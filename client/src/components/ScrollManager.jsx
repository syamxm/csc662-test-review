import { useEffect, useRef } from 'react';
import { useLocation } from 'react-router-dom';

const key = (path) => `scroll:${path}`;

export default function ScrollManager() {
  const { pathname } = useLocation();
  const firstLoad = useRef(true);

  useEffect(() => {
    if ('scrollRestoration' in history) history.scrollRestoration = 'manual';
  }, []);

  useEffect(() => {
    let raf = 0;
    const onScroll = () => {
      if (raf) return;
      raf = requestAnimationFrame(() => {
        sessionStorage.setItem(key(pathname), String(window.scrollY));
        raf = 0;
      });
    };
    window.addEventListener('scroll', onScroll, { passive: true });
    return () => {
      window.removeEventListener('scroll', onScroll);
      if (raf) cancelAnimationFrame(raf);
    };
  }, [pathname]);

  useEffect(() => {
    if (!firstLoad.current) {
      window.scrollTo(0, 0);
      return;
    }
    firstLoad.current = false;

    const saved = Number(sessionStorage.getItem(key(pathname)) || 0);
    if (!saved) return;

    let tries = 0;
    const restore = () => {
      window.scrollTo(0, saved);
      if (window.scrollY < saved - 2 && tries++ < 60) requestAnimationFrame(restore);
    };
    requestAnimationFrame(restore);
  }, [pathname]);

  return null;
}
