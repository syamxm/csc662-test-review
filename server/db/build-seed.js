const fs = require('fs');
const path = require('path');

const contentDir = path.join(__dirname, '../../content');

const chapters = [
  { number: 1, title: 'Introduction to Computer Security', file: 'CHAPTER1.md' },
  { number: 2, title: 'Information Security & Access Control', file: 'CHAPTER2.md' },
  { number: 3, title: 'Cryptography', file: 'CHAPTER3.md' },
  { number: 4, title: 'Operating System Security', file: 'CHAPTER4.md' },
  { number: 5, title: 'Software & Web Security', file: 'CHAPTER5.md' },
];

// Generated MCQ options per chapter/question. Each entry: [optionA, optionB, optionC, optionD], correctIndex.
// The correct option restates the answer; distractors are plausible terms drawn from the same chapter.
const mcq = {
  1: [
    [['Confidentiality, Integrity, Availability', 'Control, Identity, Access', 'Confidentiality, Identity, Authorisation', 'Cryptography, Integrity, Authentication'], 0],
    [['Actions are traceable to those responsible', 'Information is never disclosed', 'Users prove their identity', 'Data is never altered'], 0],
    [['Risk = Assets x Vulnerabilities x Threats', 'Risk = Threats - Controls', 'Risk = Assets + Vulnerabilities', 'Risk = Vulnerabilities x Cost'], 0],
    [['A vulnerability is a weakness; a threat is a potential violation of security', 'A vulnerability is an attack in progress; a threat is a flaw', 'They are identical terms', 'A threat is a weakness; a vulnerability is the actual attack'], 0],
    [['Deception, countered by Integrity', 'Disclosure, countered by Confidentiality', 'Disruption, countered by Availability', 'Usurpation, countered by Authentication'], 0],
    [['When in doubt, do not grant access', 'Keep the mechanism as simple as possible', 'Never rely on obscurity', 'Always grant access unless explicitly denied'], 0],
    [['Quantitative uses price and probability to compute expected loss; Qualitative uses ad-hoc expert advice', 'Quantitative uses expert opinion; Qualitative uses formulas', 'Both rely purely on mathematics', 'Quantitative ignores probability; Qualitative ignores cost'], 0],
    [['Prevention, Detection, Recovery/Reaction', 'Policy, Mechanism, Audit', 'Identify, Protect, Respond', 'Design, Build, Operate'], 0],
    [['Hardware, OS Kernel, Operating System, Services, Applications', 'Applications, Services, OS, Kernel, Hardware', 'Hardware, Firmware, Network, OS, Users', 'Kernel, Hardware, Services, OS, Applications'], 0],
    [['Semi-technical', 'Technical', 'Non-technical', 'Administrative'], 0],
  ],
  2: [
    [['Security, Robustness, Capacity', 'Confidentiality, Integrity, Availability', 'Identification, Authentication, Authorisation', 'Speed, Cost, Size'], 0],
    [['Something you are (biometrics)', 'Something you know', 'Something you have', 'Something you do once'], 0],
    [['No reads up: read allowed only if object level <= subject clearance', 'No writes down: write allowed only if object level >= subject clearance', 'No reads down: read allowed only if object level >= subject clearance', 'Read allowed only if levels are equal'], 0],
    [['In DAC the resource owner grants rights; in MAC rights are fixed centrally by an administrator', 'In DAC an administrator grants rights; in MAC the owner does', 'Both are controlled solely by the owner', 'DAC is for files only; MAC is for users only'], 0],
    [['The Chinese Wall model', 'The Bell-LaPadula model', 'The Biba model', 'The Reference Monitor model'], 0],
    [['Tamper-resistance, complete mediation, easy verification', 'Confidentiality, integrity, availability', 'Identification, authentication, accountability', 'Speed, simplicity, scalability'], 0],
    [['Poor overview of rights per object and difficult revocation', 'It cannot authenticate users', 'It exposes passwords in plaintext', 'It only works for a single user'], 0],
    [['It verifies the TGT and issues a service ticket and session key for the application server', 'It hashes the user password into a key', 'It stores all user passwords', 'It encrypts the final application data'], 0],
    [['Simple integrity: write allowed only if subject integrity >= object integrity (no write up)', 'Write allowed only if subject integrity <= object integrity', 'Write is always denied', 'Write allowed only if levels are equal'], 0],
    [['Chinese Wall: permissions change with access history, blocking the competing dataset', 'Bell-LaPadula: she lacks clearance for Pizza Hut', 'Biba: Pizza Hut data has higher integrity', 'DAC: the owner revoked her access'], 0],
  ],
  3: [
    [['A 1-bit change in plaintext or key produces large changes in the ciphertext', 'The ciphertext shrinks with each round', 'Keys avalanche into smaller subkeys', 'Plaintext statistics are preserved'], 0],
    [['Confusion and Diffusion', 'Substitution and Addition', 'Encryption and Decryption', 'Hashing and Salting'], 0],
    [['XOR (Exclusive OR)', 'AND', 'Modular multiplication', 'Bit rotation'], 0],
    [['Three 56-bit keys applied Encrypt-Decrypt-Encrypt', 'One 128-bit key', 'Two 64-bit keys', 'Three 128-bit keys'], 0],
    [['Rijndael; no, it does not use a Feistel network', 'Rijndael; yes, it uses a Feistel network', 'DES; no Feistel network', 'Blowfish; yes, Feistel based'], 0],
    [['Infeasible to find any two distinct messages with the same hash', 'Infeasible to reverse a hash to its message', 'Infeasible to find a second message matching a given message hash', 'Infeasible to compute the hash at all'], 0],
    [['N x (N - 1) / 2', 'N x N', '2^N', 'N - 1'], 0],
    [['Certification Authority, Registration Authority, Subscribers, Repository/Archive', 'Sender, Receiver, Key, Cipher', 'CA, Firewall, VPN, IDS', 'Hash, Salt, Key, Certificate'], 0],
    [['An S-box does key-controlled substitution (non-linearity); a P-box permutes bits', 'An S-box permutes bits; a P-box substitutes', 'Both only permute bits', 'Both only substitute values'], 0],
    [["Alice's public key; it guarantees data integrity and non-repudiation", "Alice's private key; confidentiality and integrity", "Bob's public key; authentication and confidentiality", "A shared symmetric key; integrity only"], 0],
  ],
  4: [
    [['The Local Security Authority (LSA)', 'The Security Accounts Manager (SAM)', 'Active Directory', 'The Reference Monitor'], 0],
    [['rw-r--r--', 'rwxr--r--', 'rw-rw-r--', 'r--r--r--'], 0],
    [['An ACL entry defining allow or deny permissions for a specific principal SID', 'A list of all users on the system', 'A Linux file permission bit', 'A password hash record'], 0],
    [['False', 'True'], 0],
    [['It masks out bits from the default permissions of newly created files', 'It grants root access to a user', 'It encrypts new files', 'It lists active processes'], 0],
    [['The Discretionary Access Control List (DACL)', 'The System Access Control List (SACL)', 'The Owner SID', 'The Primary Group SID'], 0],
    [['Real UID is inherited from the parent; effective UID may come from the parent or a SUID file owner', 'Real UID comes from SUID; effective UID from the parent', 'They are always identical', 'Effective UID is always 0'], 0],
    [['Owner SID, DACL, SACL', 'inode, umask, SUID', 'LSA, SAM, UAC', 'TGT, TGS, AS'], 0],
    [['Only the file owner (or root) may remove files in that directory', 'It makes the directory read-only', 'It runs files with owner privilege', 'It hides the directory'], 0],
    [['750: owner rwx, group r-x, others none', '755: owner rwx, group r-x, others r-x', '640: owner rw-, group r--, others none', '777: full access for everyone'], 0],
  ],
  5: [
    [["Program code executed without the user's consent that carries out harmful functionality", 'Any program that uses the network', 'Software with a graphical interface', 'A legally licensed application'], 0],
    [['A Trojan masquerades as helpful software; a Rootkit hides processes and maintains privileged access', 'A Trojan spreads over the network; a Rootkit needs a host file', 'They are the same thing', 'A Rootkit masquerades as a game; a Trojan hides files'], 0],
    [['Data Execution Protection, Address Space Layout Randomisation, Canaries', 'Firewalls, VPNs, IDS', 'Encryption, Hashing, Salting', 'DEP, SQL parameterisation, XSS filtering'], 0],
    [['The return address', 'The heap pointer', 'The program counter register', 'The function name'], 0],
    [['Cross-Site Request Forgery; it exploits an existing authenticated session', 'Cross-Site Reflected Forgery; it injects scripts', 'Client-Side Request Filtering; it blocks cookies', 'Cross-Site Resource Fetch; it steals files'], 0],
    [['It makes the query condition always true (1=1), granting access without a valid password', 'It deletes the password table', 'It encrypts the query', 'It overflows the login buffer'], 0],
    [['Encryption makes a document unreadable without a key; watermarking leaves it intact with a hidden marker', 'Both make the document unreadable', 'Watermarking needs a key; encryption does not', 'Encryption hides a copyright marker inside the file'], 0],
    [['Any three of: Unobtrusive, Readily Detectable, Unambiguous, Innumerable, Robust', 'Encrypted, Compressed, Signed', 'Fast, Cheap, Small', 'Visible, Removable, Editable'], 0],
    [['It tweaks lower-order bits and adds jitter to stop watermark bits being located, keeping the object intact', 'It floods the detector with requests', 'It encrypts the watermark', 'It overflows the media buffer'], 0],
    [['Cross-Site Scripting (XSS); the attacker could run arbitrary JavaScript to steal session cookies', 'SQL Injection; the attacker could drop tables', 'CSRF; the attacker could forge a bank transfer', 'Buffer overflow; the attacker could overwrite the return address'], 0],
  ],
};

function parseChapter(raw) {
  const quizIdx = raw.indexOf('**6. Quiz**');
  const overviewIdx = raw.indexOf('**1. Overview**');
  const content_md = raw.slice(overviewIdx, quizIdx).trim();

  const answersIdx = raw.indexOf('**Answers**');
  const quizBlock = raw.slice(quizIdx + '**6. Quiz**'.length, answersIdx);
  const answersBlock = raw.slice(answersIdx + '**Answers**'.length);

  const prompts = parseNumbered(quizBlock);
  const answers = parseNumbered(answersBlock);
  return { content_md, prompts, answers };
}

function parseNumbered(block) {
  const items = [];
  const re = /^\s*(\d+)\.\s+([\s\S]*?)(?=^\s*\d+\.\s|\*\*\*|$)/gm;
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

for (const ch of chapters) {
  const raw = fs.readFileSync(path.join(contentDir, ch.file), 'utf8');
  const { content_md, prompts, answers } = parseChapter(raw);

  if (prompts.length !== 10) throw new Error(`${ch.file}: expected 10 prompts, got ${prompts.length}`);
  if (answers.length !== 10) throw new Error(`${ch.file}: expected 10 answers, got ${answers.length}`);

  out.push(`INSERT INTO chapters (number, title, content_md) VALUES (${ch.number}, ${sqlStr(ch.title)}, ${sqlStr(content_md)});`);

  for (let i = 0; i < 10; i++) {
    const [options, correctIndex] = mcq[ch.number][i];
    const prompt = prompts[i].text.replace(/^\*Applied Question:\*\s*/, '');
    const explanation = answers[i].text;
    out.push(
      `INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) ` +
      `VALUES ((SELECT id FROM chapters WHERE number = ${ch.number}), ${sqlStr(prompt)}, ${sqlStr(JSON.stringify(options))}, ${correctIndex}, ${sqlStr(explanation)});`
    );
  }
  out.push('');
}

out.push('COMMIT;');

fs.writeFileSync(path.join(__dirname, 'seed.sql'), out.join('\n') + '\n');
console.log('Wrote seed.sql');
