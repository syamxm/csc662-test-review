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
      <ul className="chapter-list">
        {chapters.map((c) => (
          <li key={c.id}>
            <Link to={`/chapter/${c.id}`}>
              <span className="chapter-number">Chapter {c.number}</span>
              <span className="chapter-title">{c.title}</span>
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
