import { useState } from 'react';
import ReactMarkdown from 'react-markdown';

export default function Quiz({ questions, onExit }) {
  const [mode, setMode] = useState('mcq');
  const [index, setIndex] = useState(0);
  const [score, setScore] = useState(0);
  const [answered, setAnswered] = useState(0);
  const [selected, setSelected] = useState(null);
  const [revealed, setRevealed] = useState(false);

  const question = questions[index];
  const done = index >= questions.length;

  function reset() {
    setIndex(0);
    setScore(0);
    setAnswered(0);
    setSelected(null);
    setRevealed(false);
  }

  function switchMode(next) {
    setMode(next);
    reset();
  }

  function pickOption(i) {
    if (selected !== null) return;
    setSelected(i);
    setAnswered((n) => n + 1);
    if (i === question.correctIndex) setScore((s) => s + 1);
  }

  function grade(correct) {
    setAnswered((n) => n + 1);
    if (correct) setScore((s) => s + 1);
    next();
  }

  function next() {
    setSelected(null);
    setRevealed(false);
    setIndex((i) => i + 1);
  }

  return (
    <div className="quiz">
      <div className="quiz-bar">
        <div className="mode-toggle">
          <button className={mode === 'mcq' ? 'active' : ''} onClick={() => switchMode('mcq')}>MCQ</button>
          <button className={mode === 'flashcard' ? 'active' : ''} onClick={() => switchMode('flashcard')}>Flashcards</button>
        </div>
        <div className="score">Score: {score} / {answered}</div>
        <button className="exit" onClick={onExit}>Exit quiz</button>
      </div>

      {done ? (
        <div className="quiz-done">
          <h2>Done</h2>
          <p>You scored {score} out of {questions.length}.</p>
          <button className="primary" onClick={reset}>Restart</button>
        </div>
      ) : (
        <div className="card">
          <p className="progress">Question {index + 1} of {questions.length}</p>
          <p className="prompt">{question.prompt}</p>

          {mode === 'mcq' ? (
            <>
              <ul className="options">
                {question.options.map((opt, i) => {
                  let cls = '';
                  if (selected !== null) {
                    if (i === question.correctIndex) cls = 'correct';
                    else if (i === selected) cls = 'wrong';
                  }
                  return (
                    <li key={i}>
                      <button className={`option ${cls}`} onClick={() => pickOption(i)} disabled={selected !== null}>
                        {opt}
                      </button>
                    </li>
                  );
                })}
              </ul>
              {selected !== null && (
                <div className="explanation">
                  <strong>{selected === question.correctIndex ? 'Correct' : 'Wrong'}.</strong>
                  <ReactMarkdown>{question.explanation}</ReactMarkdown>
                  <button className="primary" onClick={next}>Next</button>
                </div>
              )}
            </>
          ) : (
            <>
              {revealed ? (
                <div className="explanation">
                  <ReactMarkdown>{question.explanation}</ReactMarkdown>
                  <div className="self-grade">
                    <button className="grade-right" onClick={() => grade(true)}>I was right</button>
                    <button className="grade-wrong" onClick={() => grade(false)}>I was wrong</button>
                  </div>
                </div>
              ) : (
                <button className="primary" onClick={() => setRevealed(true)}>Reveal answer</button>
              )}
            </>
          )}
        </div>
      )}
    </div>
  );
}
