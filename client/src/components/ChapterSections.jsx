import ReactMarkdown from 'react-markdown';
import { parseSections, parseKeyTerms } from '../chapterSections.js';

function KeyTerms({ terms }) {
  return (
    <dl className="key-terms">
      {terms.map((t) => (
        <div key={t.term} className="term-row">
          <dt>{t.term}</dt>
          <dd>{t.def}</dd>
        </div>
      ))}
    </dl>
  );
}

function SectionBody({ section }) {
  if (section.key === 'key terms') {
    const terms = parseKeyTerms(section.body);
    if (terms) return <KeyTerms terms={terms} />;
  }
  return (
    <div className="markdown">
      <ReactMarkdown>{section.body}</ReactMarkdown>
    </div>
  );
}

export default function ChapterSections({ content }) {
  const sections = parseSections(content);

  if (!sections) {
    return (
      <article className="markdown chapter-card">
        <ReactMarkdown>{content}</ReactMarkdown>
      </article>
    );
  }

  return (
    <div className="chapter-body">
      <nav className="section-nav" aria-label="Chapter sections">
        {sections.map((s) => (
          <a key={s.id} href={`#${s.id}`}>
            <span className="nav-icon">{s.icon}</span>
            {s.title}
          </a>
        ))}
      </nav>

      <div className="sections">
        {sections.map((s) => (
          <section key={s.id} id={s.id} className={`section-card ${s.accent}`}>
            <header className="section-head">
              <span className="section-icon">{s.icon}</span>
              <h2>{s.title}</h2>
            </header>
            <SectionBody section={s} />
          </section>
        ))}
      </div>
    </div>
  );
}
