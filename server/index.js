const path = require('path');
const net = require('net');
const express = require('express');
const { initDb } = require('./db/init');

const DEFAULT_PORT = Number(process.env.PORT) || 8662;
const DB_PATH = process.env.DB_PATH || path.join(__dirname, 'db', 'csc662.sqlite');
const clientDist = path.join(__dirname, '..', 'client', 'dist');

const db = initDb(DB_PATH);

const app = express();

app.get('/api/chapters', (req, res) => {
  const chapters = db.prepare('SELECT id, number, title FROM chapters ORDER BY number').all();
  res.json(chapters);
});

app.get('/api/chapters/:id', (req, res) => {
  const id = Number(req.params.id);
  if (!Number.isInteger(id)) return res.status(400).json({ error: 'Invalid chapter id' });

  const chapter = db.prepare('SELECT id, number, title, content_md FROM chapters WHERE id = ?').get(id);
  if (!chapter) return res.status(404).json({ error: 'Chapter not found' });

  const rows = db.prepare('SELECT id, prompt, options_json, correct_index, explanation FROM questions WHERE chapter_id = ? ORDER BY id').all(id);
  chapter.questions = rows.map((q) => ({
    id: q.id,
    prompt: q.prompt,
    options: JSON.parse(q.options_json),
    correctIndex: q.correct_index,
    explanation: q.explanation,
  }));
  res.json(chapter);
});

app.use(express.static(clientDist));
app.get('*', (req, res) => res.sendFile(path.join(clientDist, 'index.html')));

function findFreePort(start, attempts = 20) {
  return new Promise((resolve, reject) => {
    let port = start;
    const tryPort = () => {
      const tester = net.createServer();
      tester.once('error', (err) => {
        tester.close();
        if (err.code === 'EADDRINUSE' && attempts-- > 0) {
          port += 1;
          tryPort();
        } else {
          reject(err);
        }
      });
      tester.once('listening', () => tester.close(() => resolve(port)));
      tester.listen(port, '0.0.0.0');
    };
    tryPort();
  });
}

findFreePort(DEFAULT_PORT).then((port) => {
  if (port !== DEFAULT_PORT) console.log(`Port ${DEFAULT_PORT} busy, using ${port} instead`);
  app.listen(port, () => console.log(`CSC662 Test Review listening on http://0.0.0.0:${port}`));
});
