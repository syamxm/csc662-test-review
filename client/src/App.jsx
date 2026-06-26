import { useEffect, useState } from 'react';
import { Routes, Route, Link } from 'react-router-dom';
import Home from './components/Home.jsx';
import Chapter from './components/Chapter.jsx';
import ThemeSwitcher from './components/ThemeSwitcher.jsx';
import ScrollManager from './components/ScrollManager.jsx';

function getInitialTheme() {
  return (
    document.documentElement.dataset.theme ||
    localStorage.getItem('theme') ||
    (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light')
  );
}

export default function App() {
  const [theme, setTheme] = useState(getInitialTheme);

  useEffect(() => {
    document.documentElement.dataset.theme = theme;
    localStorage.setItem('theme', theme);
  }, [theme]);

  return (
    <div className="app">
      <ScrollManager />
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
