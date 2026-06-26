const fs = require('fs');
const path = require('path');
const Database = require('better-sqlite3');

function initDb(dbPath) {
  const db = new Database(dbPath);
  db.pragma('foreign_keys = ON');
  const schema = fs.readFileSync(path.join(__dirname, 'schema.sql'), 'utf8');
  const seed = fs.readFileSync(path.join(__dirname, 'seed.sql'), 'utf8');
  db.exec(schema);
  db.exec(seed);
  return db;
}

module.exports = { initDb };
