import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { fetchChapters } from '../api.js';

export default function Home() {
  const [chapters, setChapters] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchChapters().then(setChapters).catch((e) => setError(e.message));
  }, []);

  if (error) return <p className="error">Failed to load chapters: {error}</p>;

  return (
    <div>
      <h1>Chapters</h1>
      <p className="home-intro">Five cram guides, each with a 10-question quiz.</p>
      <ul className="chapter-list">
        {chapters.map((c) => (
          <li key={c.id}>
            <Link to={`/chapter/${c.id}`}>
              <span className="chapter-badge">{c.number}</span>
              <span className="chapter-meta">
                <span className="chapter-label">Chapter {c.number}</span>
                <span className="chapter-title">{c.title}</span>
              </span>
              <span className="chapter-arrow">→</span>
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
