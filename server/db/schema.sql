CREATE TABLE IF NOT EXISTS chapters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  number INTEGER NOT NULL,
  title TEXT NOT NULL,
  variant TEXT NOT NULL,
  content_md TEXT NOT NULL,
  UNIQUE (number, variant)
);

CREATE TABLE IF NOT EXISTS questions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  chapter_id INTEGER NOT NULL REFERENCES chapters(id),
  prompt TEXT NOT NULL,
  options_json TEXT NOT NULL,
  correct_index INTEGER NOT NULL,
  explanation TEXT NOT NULL
);
