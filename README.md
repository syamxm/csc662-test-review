# CSC662: Test Review

Study/review site for CSC662. Five chapter cram guides plus a 10-question quiz per
chapter in two modes (MCQ auto-grading, flashcard self-grading). Content lives in
SQLite, built from `seed.sql`, and served by Express alongside the built React app on
a single port.

## Stack

- React (Vite) frontend, self-hosted JetBrains Mono Nerd Font (Regular + Bold only).
- Express on Node, serving the static build and a small REST API.
- SQLite single file, rebuilt fresh from `schema.sql` + `seed.sql` on every start.

## Run with Docker (primary)

```bash
docker compose up --build
```

Open http://localhost:8662.

The SQLite DB is rebuilt from seed on each start — there is no persistent state (quiz
scores are session-only in React), so the container uses **no volume**.

## Local development

```bash
# 1. Build the seed (parses content/*.md into server/db/seed.sql)
cd server && npm install && npm run build-seed

# 2. Run the API server (builds + seeds the SQLite file on start)
npm start                       # http://localhost:8662

# 3. In another terminal, run the Vite dev server (proxies /api to :8662)
cd ../client && npm install && npm run dev
```

For a production-style local run, build the client first (`cd client && npm run build`)
then start the server — Express serves `client/dist` directly.

## Environment variables

| Var       | Default                  | Purpose                              |
|-----------|--------------------------|--------------------------------------|
| `PORT`    | `8662`                   | Listen port (see auto-bump below).   |
| `DB_PATH` | `server/db/csc662.sqlite`| SQLite file location.                |

### Port auto-bump

On startup the server checks whether `PORT` is free; if taken it picks the next free
port and logs the chosen one. Inside the container the default 8662 is always free, so
the host-published port (fixed by `docker-compose.yml`) stays correct.

## API

- `GET /api/chapters` — list chapters.
- `GET /api/chapters/:id` — chapter content plus its questions.

## Deploy (nginx + Cloudflare tunnel)

`nginx/csc662-test-review.conf` is a reverse-proxy server block for
`csc662-test-review.syamxm.com -> http://127.0.0.1:8662`. Place/symlink it into your
nginx `conf.d` yourself. The Cloudflare tunnel is configured separately and only needs
the app listening on the published port.

## Adding persistence later (optional)

Scores are intentionally session-only. If you ever want a durable DB, point `DB_PATH`
at a mounted path and add a volume in `docker-compose.yml`:

```yaml
    volumes:
      - csc662-data:/data
    environment:
      DB_PATH: /data/csc662.sqlite
```

(then declare the `csc662-data` volume) and stop deleting/reseeding on start.
