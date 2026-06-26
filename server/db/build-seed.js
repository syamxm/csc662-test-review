const fs = require('fs');
const path = require('path');

const titles = {
  1: 'Introduction to Computer Security',
  2: 'Information Security & Access Control',
  3: 'Cryptography',
  4: 'Operating System Security',
  5: 'Software & Web Security',
};

const variants = [
  { name: 'standard', dir: path.join(__dirname, '../../content') },
  { name: 'extended', dir: path.join(__dirname, '../../content_latest') },
];

// Generated MCQ options per variant/chapter/question. Each entry: [options, correctIndex].
// correct option restates the answer; distractors are plausible terms from the same chapter.
const mcq = require('./mcq-options.js');

function parseChapter(raw) {
  const quizIdx = raw.indexOf('**6. Quiz**');
  const overviewIdx = raw.indexOf('**1. Overview**');
  const content_md = raw.slice(overviewIdx, quizIdx).trim();

  const answersIdx = raw.indexOf('**Answers**');
  const quizBlock = raw.slice(quizIdx + '**6. Quiz**'.length, answersIdx);
  const answersBlock = raw.slice(answersIdx + '**Answers**'.length);

  return {
    content_md,
    prompts: parseNumbered(quizBlock),
    answers: parseNumbered(answersBlock),
  };
}

function parseNumbered(block) {
  const items = [];
  const re = /^\s*(\d+)\.\s+([\s\S]*?)(?=^\s*\d+\.\s|\*\*\*|```|$)/gm;
  let m;
  while ((m = re.exec(block)) !== null) {
    const text = m[2].replace(/\s+/g, ' ').trim();
    if (text) items.push({ n: Number(m[1]), text });
  }
  return items;
}

function sqlStr(s) {
  return "'" + String(s).replace(/'/g, "''") + "'";
}

const out = [];
out.push('BEGIN TRANSACTION;');
out.push('DELETE FROM questions;');
out.push('DELETE FROM chapters;');
out.push("DELETE FROM sqlite_sequence WHERE name IN ('chapters','questions');");
out.push('');

for (const variant of variants) {
  for (let number = 1; number <= 5; number++) {
    const raw = fs.readFileSync(path.join(variant.dir, `CHAPTER${number}.md`), 'utf8');
    const { content_md, prompts, answers } = parseChapter(raw);
    const options = mcq[variant.name][number];

    if (prompts.length !== options.length || answers.length !== options.length) {
      throw new Error(`${variant.name} ch${number}: prompts=${prompts.length} answers=${answers.length} options=${options.length}`);
    }

    out.push(
      `INSERT INTO chapters (number, title, variant, content_md) ` +
      `VALUES (${number}, ${sqlStr(titles[number])}, ${sqlStr(variant.name)}, ${sqlStr(content_md)});`
    );

    for (let i = 0; i < prompts.length; i++) {
      const [opts, correctIndex] = options[i];
      const prompt = prompts[i].text.replace(/^\*Applied Question:\*\s*/, '');
      const explanation = answers[i].text;
      out.push(
        `INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) ` +
        `VALUES ((SELECT id FROM chapters WHERE number = ${number} AND variant = ${sqlStr(variant.name)}), ` +
        `${sqlStr(prompt)}, ${sqlStr(JSON.stringify(opts))}, ${correctIndex}, ${sqlStr(explanation)});`
      );
    }
    out.push('');
  }
}

out.push('COMMIT;');
fs.writeFileSync(path.join(__dirname, 'seed.sql'), out.join('\n') + '\n');
console.log('Wrote seed.sql');
