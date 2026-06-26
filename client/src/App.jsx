import { useEffect, useState } from 'react';
import { Routes, Route, Link } from 'react-router-dom';
import Home from './components/Home.jsx';
import Chapter from './components/Chapter.jsx';
import ThemeSwitcher from './components/ThemeSwitcher.jsx';

export default function App() {
  const [theme, setTheme] = useState(() => document.documentElement.dataset.theme || 'light');

  useEffect(() => {
    document.documentElement.dataset.theme = theme;
    localStorage.setItem('theme', theme);
  }, [theme]);

  return (
    <div className="app">
      <header className="topbar">
        <Link to="/" className="brand">CSC662: Test Review</Link>
        <ThemeSwitcher theme={theme} onChange={setTheme} />
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
