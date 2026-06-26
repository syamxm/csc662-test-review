import { useEffect, useRef, useState } from 'react';

const ICONS = {
  sun: <><circle cx="12" cy="12" r="4" /><path d="M12 2v2M12 20v2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M2 12h2M20 12h2M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4" /></>,
  moon: <path d="M21 12.8A9 9 0 1 1 11.2 3a7 7 0 0 0 9.8 9.8z" />,
  flower: <><circle cx="12" cy="12" r="2.5" /><path d="M12 9.5C12 6 13.5 4 15 4s2 2 0 4M12 14.5C12 18 10.5 20 9 20s-2-2 0-4M9.5 12C6 12 4 10.5 4 9s2-2 4 0M14.5 12C18 12 20 13.5 20 15s-2 2-4 0" /></>,
  sprig: <><path d="M12 21V8" /><path d="M12 12c-3 0-5-2-5-5 3 0 5 2 5 5zM12 9c2.5 0 4-1.5 4-4-2.5 0-4 1.5-4 4z" /></>,
  cat: <><path d="M4 5l2.5 4M20 5l-2.5 4" /><path d="M5 11a7 5 0 0 1 14 0c0 4-3 7-7 7s-7-3-7-7z" /><path d="M9.5 12h.01M14.5 12h.01M12 14.5l-1 1M12 14.5l1 1" /></>,
};

const THEMES = [
  { id: 'light', label: 'Light', icon: 'sun' },
  { id: 'dark', label: 'Dark', icon: 'moon' },
  { id: 'pink', label: 'Pink', icon: 'flower' },
  { id: 'lavender', label: 'Lavender', icon: 'sprig' },
  { id: 'latte', label: 'Catppuccin Latte', icon: 'cat' },
  { id: 'mocha', label: 'Catppuccin Mocha', icon: 'cat' },
];

function Icon({ name }) {
  return (
    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
      strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      {ICONS[name]}
    </svg>
  );
}

export default function ThemeSwitcher({ theme, onChange }) {
  const [open, setOpen] = useState(false);
  const ref = useRef(null);
  const current = THEMES.find((t) => t.id === theme) || THEMES[0];

  useEffect(() => {
    if (!open) return;
    const close = (e) => { if (!ref.current.contains(e.target)) setOpen(false); };
    document.addEventListener('mousedown', close);
    return () => document.removeEventListener('mousedown', close);
  }, [open]);

  return (
    <div className="theme-switcher" ref={ref}>
      <button className="theme-trigger" onClick={() => setOpen((o) => !o)}
        aria-haspopup="true" aria-expanded={open} aria-label="Change theme">
        <Icon name={current.icon} />
        <span>{current.label}</span>
      </button>
      {open && (
        <ul className="theme-menu" role="menu">
          {THEMES.map((t) => (
            <li key={t.id}>
              <button className={t.id === theme ? 'active' : ''} role="menuitem"
                onClick={() => { onChange(t.id); setOpen(false); }}>
                <Icon name={t.icon} />
                <span>{t.label}</span>
                {t.id === theme && <span className="check">✓</span>}
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
