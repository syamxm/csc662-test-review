async function get(url) {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`Request failed: ${res.status}`);
  return res.json();
}

export const fetchChapters = () => get('/api/chapters');
export const fetchChapter = (id) => get(`/api/chapters/${id}`);
