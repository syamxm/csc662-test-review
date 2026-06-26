const META = {
  'overview': { icon: '◆', accent: 'sec-overview' },
  'key terms': { icon: '▤', accent: 'sec-terms' },
  'processes & models': { icon: '❯', accent: 'sec-models' },
  'most examinable points': { icon: '★', accent: 'sec-points' },
  'common mistakes': { icon: '⚠', accent: 'sec-mistakes' },
};

const HEADING = /\*\*(\d+)\.\s+([^*]+?)\s*\*\*/g;

export function parseSections(md) {
  const matches = [...md.matchAll(HEADING)];
  if (matches.length === 0) return null;

  return matches.map((m, i) => {
    const title = m[2].trim();
    const start = m.index + m[0].length;
    const end = i + 1 < matches.length ? matches[i + 1].index : md.length;
    const key = title.toLowerCase();
    const meta = META[key] || { icon: '§', accent: 'sec-default' };
    return {
      id: `sec-${m[1]}`,
      title,
      key,
      body: md.slice(start, end).trim(),
      icon: meta.icon,
      accent: meta.accent,
    };
  });
}

export function parseKeyTerms(body) {
  const terms = [];
  for (const line of body.split('\n')) {
    const m = line.match(/^\*\s+\*\*(.+?):\*\*\s*(.+)$/);
    if (m) terms.push({ term: m[1].trim(), def: m[2].trim() });
  }
  return terms.length ? terms : null;
}
