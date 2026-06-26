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

  useEffect(() => {
    setQuizOpen(false);
    fetchChapter(id).then(setChapter).catch((e) => setError(e.message));
  }, [id]);

  if (error) return <p className="error">Failed to load chapter: {error}</p>;
  if (!chapter) return <p>Loading…</p>;

  return (
    <div>
      <Link to="/" className="back-link">← All chapters</Link>
      <h1>Chapter {chapter.number}: {chapter.title}</h1>

      {quizOpen ? (
        <Quiz questions={chapter.questions} onExit={() => setQuizOpen(false)} />
      ) : (
        <>
          <ChapterSections content={chapter.content_md} />
          <div className="quiz-cta">
            <div>
              <strong>Ready to test yourself?</strong>
              <p>{chapter.questions.length} questions · MCQ or flashcards</p>
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
