import { useEffect, useState } from 'react';
import { Routes, Route, Link } from 'react-router-dom';
import Home from './components/Home.jsx';
import Chapter from './components/Chapter.jsx';

function getInitialTheme() {
  const stored = sessionStorage.getItem('theme');
  if (stored) return stored;
  return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
}

export default function App() {
  const [theme, setTheme] = useState(getInitialTheme);

  useEffect(() => {
    document.documentElement.dataset.theme = theme;
    sessionStorage.setItem('theme', theme);
  }, [theme]);

  const toggleTheme = () => setTheme((t) => (t === 'dark' ? 'light' : 'dark'));

  return (
    <div className="app">
      <header className="topbar">
        <Link to="/" className="brand">CSC662: Test Review</Link>
        <button className="theme-toggle" onClick={toggleTheme} aria-label="Toggle theme">
          {theme === 'dark' ? '☀ Light' : '☾ Dark'}
        </button>
      </header>
      <main className="content">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/chapter/:id" element={<Chapter />} />
        </Routes>
      </main>
    </div>
  );
}
