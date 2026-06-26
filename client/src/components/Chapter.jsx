import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { fetchChapter } from '../api.js';
import Quiz from './Quiz.jsx';
import ChapterSections from './ChapterSections.jsx';

export default function Chapter() {
  const { id } = useParams();
  const [chapter, setChapter] = useState(null);
  const [error, setError] = useState(null);
  const [quizOpen, setQuizOpen] = useState(false);
  const [variant, setVariant] = useState(() => localStorage.getItem('variant') || 'standard');

  useEffect(() => {
    setQuizOpen(false);
    fetchChapter(id).then(setChapter).catch((e) => setError(e.message));
  }, [id]);

  useEffect(() => {
    localStorage.setItem('variant', variant);
  }, [variant]);

  if (error) return <p className="error">Failed to load chapter: {error}</p>;
  if (!chapter) return <p>Loading…</p>;

  const active = chapter.variants[variant] || chapter.variants.standard;
  const hasExtended = Boolean(chapter.variants.extended);

  return (
    <div>
      <Link to="/" className="back-link">← All chapters</Link>
      <div className="chapter-header">
        <h1>Chapter {chapter.number}: {chapter.title}</h1>
        {hasExtended && (
          <div className="variant-toggle" role="group" aria-label="Content variant">
            <button className={variant === 'standard' ? 'active' : ''} onClick={() => setVariant('standard')}>
              Standard
            </button>
            <button className={variant === 'extended' ? 'active' : ''} onClick={() => setVariant('extended')}>
              Extended
            </button>
          </div>
        )}
      </div>

      {quizOpen ? (
        <Quiz key={variant} questions={active.questions} onExit={() => setQuizOpen(false)} />
      ) : (
        <>
          <ChapterSections content={active.content_md} />
          <div className="quiz-cta">
            <div>
              <strong>Ready to test yourself?</strong>
              <p>{active.questions.length} questions · {variant} · MCQ or flashcards</p>
            </div>
            <button className="primary" onClick={() => setQuizOpen(true)}>
              Start Quiz
            </button>
          </div>
        </>
      )}
    </div>
  );
}
