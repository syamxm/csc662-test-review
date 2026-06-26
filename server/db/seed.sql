BEGIN TRANSACTION;
DELETE FROM questions;
DELETE FROM chapters;
DELETE FROM sqlite_sequence WHERE name IN ('chapters','questions');

INSERT INTO chapters (number, title, content_md) VALUES (1, 'Introduction to Computer Security', '**1. Overview**
This chapter provides a foundational understanding of computer security, focusing on the core principles, objectives, and mechanisms used to protect organisational assets. It is critical because it establishes the baseline vocabulary and frameworks—such as the CIA triad, threat classifications, and risk analysis—that will inform all subsequent technical and non-technical security strategies in your module.

**2. Key Terms**
*   **Security:** The protection of organisational assets (physical, software, data, intellectual property, and reputation).
*   **Policy:** Specifies what security objectives we want to achieve.
*   **Mechanism:** The methods and implementations used to enforce and fulfil security policies.
*   **Confidentiality:** Ensuring no information is inappropriately disclosed.
*   **Integrity:** Ensuring data has not been maliciously altered.
*   **Availability:** Ensuring data and services can be accessed when desired.
*   **Authentication:** Ensuring a user or data origin is properly identifiable.
*   **Authorisation:** The permission to do or have something.
*   **Accountability:** Ensuring actions are traceable to those responsible.
*   **Vulnerability:** A weakness of a system that can be exploited to damage assets.
*   **Threat:** A "potential" violation of security.
*   **Attack:** The actual violation of security exploiting a vulnerability.

**3. Processes & Models**
**Risk Analysis Process**
1. Identify the value of your **Assets**.
2. Identify system **Vulnerabilities**.
3. Identify potential **Threats**.
4. Calculate Risk using the function: `Risk = Assets x Vulnerabilities x Threats`.

**Security Life Cycle**
1. Identify **Threats**.
2. Define security **Policy**.
3. Create **Specification**.
4. **Design** the system.
5. **Implementation**.
6. **Operation & Maintenance** (which loops back to evaluating Threats).

**The Onion Model (Layered Security)**
*From innermost to outermost layer:*
1. **Hardware** security (tamper-resistant hardware modules).
2. **OS kernel** security (security models at the hardware abstraction level).
3. **Operating system** security (main OS security mechanisms).
4. **Services** security (security of services such as DNS, DHCP).
5. **Applications** security (application-level protection mechanisms).

**4. Most Examinable Points**
*   **You must know** the difference between a vulnerability (a weakness), a threat (a potential danger), and an attack (a deliberate act exploiting a vulnerability).
*   **You must know** the core elements of the CIA Triad: Confidentiality, Integrity, and Availability.
*   **You must know** the extended security objectives: Authentication and Accountability.
*   **You must know** the mathematical function for Risk: `Risk = Assets x Vulnerabilities x Threats`.
*   **You must know** the difference between Quantitative risk analysis (using mathematical domains like price/probability to calculate expected loss) and Qualitative risk analysis (ad-hoc advice from security experts without mathematical structure).
*   **You must know** the core Security Design Principles: Economy of mechanism (keep it simple), Fail-safe defaults (when in doubt, deny access), Open design (no "security by obscurity"), Separation of privilege, and Least privilege (minimum necessary access rights).
*   **You must know** the three security instrument stages: Prevention (by design), Detection (timely discovery), and Recovery/Reaction (restoring and upgrading).
*   **You must know** the four Classes of Threats: Disclosure (counters confidentiality), Deception (counters integrity), Disruption (counters integrity), and Usurpation (counters availability).
*   **You must know** the concept of Defense-in-Depth, which involves layered protection and the diversification of complementary products.
*   **You must know** the Security Quadrilema, which illustrates the constant trade-offs between Security, Cost, Functionality, and User expertise.

**5. Common Mistakes**
*   **Confusing Threats, Vulnerabilities, and Attacks:** Students often use these interchangeably. A vulnerability is the *flaw/weakness*, a threat is the *potential* danger to the asset, and an attack is the *actual execution*.
*   **Mixing up Policy and Mechanism:** Policy dictates *what* you want to achieve (the goal), while mechanism is *how* you implement it (the tool enforcing the goal).
*   **Ignoring the ''Human Factor'':** Students often focus entirely on hackers and technical exploits, forgetting that acts of human error (inexperience, improper training) are listed as "among the greatest threats" to organisational data.
*   **Misunderstanding Open Design:** Assuming security relies on keeping the system hidden. The slides explicitly state that Open Design means "no security by obscurity".');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1), 'What does the CIA triad stand for?', '["Confidentiality, Integrity, Availability","Control, Identity, Access","Confidentiality, Identity, Authorisation","Cryptography, Integrity, Authentication"]', 0, 'Confidentiality, Integrity, and Availability.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1), 'Define "Accountability" in the context of computer security.', '["Actions are traceable to those responsible","Information is never disclosed","Users prove their identity","Data is never altered"]', 0, 'Actions are traceable to those responsible.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1), 'What is the mathematical formula for evaluating Risk?', '["Risk = Assets x Vulnerabilities x Threats","Risk = Threats - Controls","Risk = Assets + Vulnerabilities","Risk = Vulnerabilities x Cost"]', 0, 'Risk = Assets x Vulnerabilities x Threats.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1), 'Explain the difference between a Threat and a Vulnerability.', '["A vulnerability is a weakness; a threat is a potential violation of security","A vulnerability is an attack in progress; a threat is a flaw","They are identical terms","A threat is a weakness; a vulnerability is the actual attack"]', 0, 'A vulnerability is a weakness in the system, whereas a threat is a "potential" violation of security that represents a constant danger to an asset.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1), 'Which class of threat involves the "acceptance of false data," and which security service counters it?', '["Deception, countered by Integrity","Disclosure, countered by Confidentiality","Disruption, countered by Availability","Usurpation, countered by Authentication"]', 0, 'Deception; it is countered by Integrity services.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1), 'What does the "Fail-safe defaults" security design principle mean?', '["When in doubt, do not grant access","Keep the mechanism as simple as possible","Never rely on obscurity","Always grant access unless explicitly denied"]', 0, 'When in doubt, do not grant access.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1), 'Differentiate between Quantitative and Qualitative risk analysis.', '["Quantitative uses price and probability to compute expected loss; Qualitative uses ad-hoc expert advice","Quantitative uses expert opinion; Qualitative uses formulas","Both rely purely on mathematics","Quantitative ignores probability; Qualitative ignores cost"]', 0, 'Quantitative uses mathematical values (price and probability) to calculate an expected loss, while Qualitative relies on ad-hoc advice by security experts without a mathematical structure.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1), 'What are the three categories of security instruments/mechanisms mentioned in the system design lifecycle?', '["Prevention, Detection, Recovery/Reaction","Policy, Mechanism, Audit","Identify, Protect, Respond","Design, Build, Operate"]', 0, 'Prevention, Detection, and Recovery/Reaction.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1), 'List the five layers of the "Onion Model" from the innermost layer to the outermost.', '["Hardware, OS Kernel, Operating System, Services, Applications","Applications, Services, OS, Kernel, Hardware","Hardware, Firmware, Network, OS, Users","Kernel, Hardware, Services, OS, Applications"]', 0, 'Hardware, OS Kernel, Operating System, Services, and Applications.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1), 'Your organisation implements SSL encryption on its web portal and monitors credit card statements for abnormal transactions. According to the slides, what level of instrument/mechanism (Non-technical, Semi-technical, or Technical) do these specific actions represent?', '["Semi-technical","Technical","Non-technical","Administrative"]', 0, 'Semi-technical instruments/mechanisms.');

INSERT INTO chapters (number, title, content_md) VALUES (2, 'Information Security & Access Control', '**1. Overview**
Chapter Two shifts from general security concepts to the specific mechanisms and theoretical models used to control system access. It covers the entire lifecycle of resource access—from identifying and authenticating a user, to authorising their actions, and logging those actions for accountability. This chapter matters because it bridges practical implementations (like passwords, biometrics, Kerberos, and Access Control Lists) with the rigorous, mathematical formal models (like Bell-LaPadula and Biba) that prove a system enforces its security policies without logical leaks.

**2. Key Terms**
*   **Information Security:** The process of protecting the confidentiality, integrity, availability, accountability, and privacy of information.
*   **Identification:** The process of establishing the identity of someone or something (asking "Who are you?").
*   **Authentication:** The process of verifying an established identity (demanding "Prove it!").
*   **Zero Knowledge Protocols:** Advanced authentication exchanges that provide absolutely no information to an adversarial impersonator.
*   **Single Sign-On (SSO):** Methods like Kerberos that automate distributed authentication, reducing the need to memorise and type multiple passwords.
*   **Subject:** An active entity (such as a user or process) that initiates an access request.
*   **Object:** A passive entity (such as a file or directory) to which access is requested.
*   **Reference Monitor:** An abstract mechanism that makes authorisation decisions and strictly mediates all access requests between subjects and objects.
*   **Discretionary Access Control (DAC):** An access control type where the resource owner dictates who has access rights and can transfer those rights to others.
*   **Mandatory Access Control (MAC):** Centralised access control where access rights are fixed strictly by administrators using system-wide policies.
*   **Role-Based Access Control (RBAC):** A logical layer that assigns access rights to specific roles rather than individual users.
*   **Conflict of Interest Class (COI):** In the Chinese Wall model, a grouping of datasets belonging to competing companies.

**3. Processes & Models**
**The Resource Access Sequence**
1. **Identification:** Determine which object/subject is requesting access to a resource.
2. **Authentication:** Verify that the object is indeed what it claims to be.
3. **Authorisation:** Verify if the object has the specific permission to access the resource.
4. **Accountability:** Log the transaction access for future auditing.

**Kerberos Ticket Request Process**
1. User logs in with a username and password, and the client hashes the password to use as a secret key.
2. Client sends a request with the user ID and requested service to the Authentication Server (AS).
3. The AS generates a Ticket-Granting Ticket (TGT) containing a session key, encrypts it, and sends it back to the client.
4. The client generates an authenticator and sends the TGT to the Ticket Granting Server (TGS).
5. The TGS verifies the authenticator, generates a Service Ticket with a new session key, and sends it encrypted to the client.
6. The client sends an authenticator and the Service Ticket to the actual Application Server to be granted access.

**Bell-LaPadula (BLP) Confidentiality Model**
1. **Simple Security Property (ss-Property):** "No reads up." A subject can read an object only if the subject''s clearance level is greater than or equal to the object''s classification.
2. **\*-Property (Star Property):** "No writes down." A subject can write to an object only if the subject''s clearance level is less than or equal to the object''s classification.

**Biba Integrity Model**
1. **Simple Integrity:** A subject can modify (write to) an object only if the subject''s integrity level is greater than or equal to the object''s.
2. **Integrity Confinement:** A subject can read an object only if the subject''s integrity level is less than or equal to the object''s.
3. **Invocation Property:** A subject can invoke another subject only if the first subject has an equal or higher integrity level.

**Chinese Wall Confidentiality Model**
1. **Simple Security Rule:** A subject can access an object only if the object is in the same company dataset as objects already accessed, or if it belongs to an entirely different conflict of interest class.
2. **\*-Property:** Write access is permitted only if the simple security rule is met, and the subject cannot read any unsanitised information in a different company dataset.

**4. Most Examinable Points**
*   **You must know** the three aspects that constantly contend with each other in information-hiding systems: Security, Robustness, and Capacity.
*   **You must know** the three categories of user authentication: something you know (passwords), something you have (smart cards), and something you are (biometrics).
*   **You must know** the difference between an Access Control List (ACL), which is an object-centred description of rights, and a Capability List (C-List), which is a subject-centred description.
*   **You must know** the three core requirements for implementing a Reference Monitor: Tamper-resistance, complete mediation (guaranteed invocation), and easiness of verification and testing.
*   **You must know** that the Bell-LaPadula model is designed solely to protect *confidentiality* and prevent information from flowing to lower clearance levels.
*   **You must know** that the Biba model is designed to protect *integrity* and prevent untrusted data alteration, acting essentially as Bell-LaPadula upside-down.
*   **You must know** that the Chinese Wall Policy is a hybrid model specifically designed to address conflicts of interest for consultants or contractors.
*   **You must know** that Chinese Wall permissions change dynamically based entirely on the history of the subject''s past accesses.

**5. Common Mistakes**
*   **Mixing up Bell-LaPadula and Biba rules:** Students famously reverse these. Remember: BLP protects *secrets* ("No Read Up, No Write Down"). Biba protects *trust/integrity* ("No Read Down, No Write Up").
*   **Confusing Identification and Authentication:** Identification is just stating a name (e.g. providing a username); Authentication is proving that the name is yours (e.g. providing the password).
*   **Misunderstanding MAC vs DAC:** Students often think DAC means access is "discretionary" for everyone. It means the *resource owner* uses their discretion to grant rights. MAC overrides the owner, forcing a centralised, administrator-controlled policy.
*   **Confusing ACLs and Capabilities:** Students forget which list belongs to what. An ACL is attached to the *file/object* (like a bouncer holding a guest list at a door). A Capability is attached to the *user/subject* (like a VIP pass in a user''s pocket).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2), 'What are the three conflicting aspects of an information-hiding system?', '["Security, Robustness, Capacity","Confidentiality, Integrity, Availability","Identification, Authentication, Authorisation","Speed, Cost, Size"]', 0, 'Security, Robustness, and Capacity.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2), 'Which category of user authentication does "signature dynamics" fall under?', '["Something you are (biometrics)","Something you know","Something you have","Something you do once"]', 0, '"Something you are" (Biometrics/behavioral characteristics).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2), 'State the formula for the "Simple Security Property" (ss-Property) in the Bell-LaPadula model.', '["No reads up: read allowed only if object level <= subject clearance","No writes down: write allowed only if object level >= subject clearance","No reads down: read allowed only if object level >= subject clearance","Read allowed only if levels are equal"]', 0, '"No reads up." A subject can read an object only if the object''s security level is less than or equal to the subject''s clearance.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2), 'What is the fundamental difference between Discretionary Access Control (DAC) and Mandatory Access Control (MAC)?', '["In DAC the resource owner grants rights; in MAC rights are fixed centrally by an administrator","In DAC an administrator grants rights; in MAC the owner does","Both are controlled solely by the owner","DAC is for files only; MAC is for users only"]', 0, 'In DAC, access control is carried out by the resource owner. In MAC, access rights are fixed centrally by an administrator via a system-wide policy.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2), 'Which formal security model uses "Conflict of Interest" (COI) classes?', '["The Chinese Wall model","The Bell-LaPadula model","The Biba model","The Reference Monitor model"]', 0, 'The Chinese Wall model.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2), 'Identify the three core requirements of a Reference Monitor.', '["Tamper-resistance, complete mediation, easy verification","Confidentiality, integrity, availability","Identification, authentication, accountability","Speed, simplicity, scalability"]', 0, 'Tamper-resistance, Complete mediation (guaranteed invocation), and Easiness of verification and testing.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2), 'What is the primary vulnerability or downside of using a Capability List (C-List) instead of an ACL?', '["Poor overview of rights per object and difficult revocation","It cannot authenticate users","It exposes passwords in plaintext","It only works for a single user"]', 0, 'It offers a poor overview of access rights per object and makes revocation of rights difficult.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2), 'In the Kerberos protocol, what is the purpose of the Ticket Granting Server (TGS)?', '["It verifies the TGT and issues a service ticket and session key for the application server","It hashes the user password into a key","It stores all user passwords","It encrypts the final application data"]', 0, 'The TGS verifies the client''s Ticket-Granting Ticket (TGT) and authenticator, and if valid, generates a specific service ticket and session key for the application server.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2), 'State the Biba model''s rule regarding "writing" (modifying) an object.', '["Simple integrity: write allowed only if subject integrity >= object integrity (no write up)","Write allowed only if subject integrity <= object integrity","Write is always denied","Write allowed only if levels are equal"]', 0, 'Simple integrity: A subject can modify an object only if the subject''s integrity level is greater than or equal to the object''s integrity level ("No Write Up").');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2), 'A contractor is hired to audit the networks of Domino''s and Pizza Hut, who are direct competitors. On her first day, she accesses a file on the Domino''s network. According to the slides, what formal security model dictates that she must now be permanently blocked from accessing any files on the Pizza Hut network, and why?', '["Chinese Wall: permissions change with access history, blocking the competing dataset","Bell-LaPadula: she lacks clearance for Pizza Hut","Biba: Pizza Hut data has higher integrity","DAC: the owner revoked her access"]', 0, 'The Chinese Wall model. It dictates this block to prevent a conflict of interest, as her permissions dynamically change based on her history of past accesses. Because she accessed data in one conflict of interest class (Domino''s), she is blocked from accessing data from a competing dataset (Pizza Hut) within the same class.');

INSERT INTO chapters (number, title, content_md) VALUES (3, 'Cryptography', '**1. Overview**
This chapter covers the evolution and mechanics of cryptography, bridging classical substitution and transposition methods with modern computational algorithms like DES, AES, and stream ciphers. It expands into the theoretical foundations of secrecy (Shannon''s principles), asymmetric (public-key) frameworks, cryptographic hash functions, and the Public Key Infrastructure (PKI) required to manage trust at scale. This matters because cryptography is the mathematical engine enabling core information security objectives: guaranteeing confidentiality, detecting malicious alterations (integrity), preventing spoofing (authentication), and ensuring users cannot deny their actions (non-repudiation).

**2. Key Terms**
*   **Cryptography:** The practice of hiding the *meaning* of a message, rather than its existence.
*   **Confusion:** Obscuring the statistical dependence between the encryption key and the cipher-text, often achieved via substitution.
*   **Diffusion:** Obscuring the statistical structure of the plaintext from the cipher-text, often achieved via transposition.
*   **Feistel Network:** A structural model for block ciphers that splits data into halves, using multiple rounds of substitution and permutation governed by sub-keys.
*   **S-Box (Substitution Box):** A complex, key-controlled substitution mechanism designed to introduce secure non-linearity into a cipher.
*   **Avalanche Effect:** A principle where a 1-bit difference in plaintext or key rapidly cascades into a large difference in cipher-text bits.
*   **Hash Function:** An algorithm that converts a large, variable-size input into a small, fixed-size output (digest).
*   **Digital Certificate:** An electronic document (following the X.509 standard) that binds an entity''s name to its public key, digitally signed by a trusted third party.
*   **Public Key Infrastructure (PKI):** The hardware, software, people, policies, and procedures needed to create, manage, store, distribute, and revoke digital certificates.
*   **Zero Knowledge Protocols:** (Though primarily in chapter 2, strongly related to modern auth) *Note: Not explicitly detailed in the Ch 3 slides beyond core asymmetric auth concepts.* 

**3. Processes & Models**
**Feistel Cipher Round Structure**
1. Split the plaintext block into a Left half ($L_i$) and Right half ($R_i$).
2. Pass the Left half directly down to become the new Right half: $L_{i+1} = R_i$.
3. Pass the Right half ($R_i$) and the sub-key ($K_i$) into the round function $F$.
4. XOR the output of the round function with the original Left half ($L_i$).
5. Set this XORed result as the new Right half: $R_{i+1} = L_i \oplus F(R_i, K_i)$. 
6. Repeat for $n$ rounds and combine $L_n$ and $R_n$ for the final cipher-text.

**DES One-Round Transformation**
1. **Expansion:** Expand the 32-bit right half ($R_{i-1}$) to 48 bits (duplicating some bits for the avalanche effect).
2. **Key Mixing:** XOR the expanded 48 bits with the 48-bit round key ($K_i$).
3. **Substitution:** Pass the result through 8 S-Boxes (converting 6-bit inputs into 4-bit outputs) to introduce non-linearity.
4. **Permutation:** Permute the resulting 32 bits using a P-Box.
5. **XOR:** XOR the permuted 32 bits with the left half ($L_{i-1}$) to create the new right half ($R_i$).

**Validating a Digital Signature**
1. Re-compute the hash value (digest) of the received original message.
2. Obtain the author’s public key from a trusted source/certificate.
3. Decrypt the attached digital signature using the author''s public key.
4. Compare the newly computed hash value with the decrypted hash value; if they match, the signature is valid.

**4. Most Examinable Points**
*   **You must know** that the *One Time Pad* is the only perfectly secure encryption algorithm because it uses a truly random key as long as the message, and the key is never reused.
*   **You must know** Shannon''s two cryptographic principles: *Confusion* (achieved via substitution to obscure key/cipher-text dependence) and *Diffusion* (achieved via transposition to obscure plaintext/cipher-text structure).
*   **You must know** the symmetric key distribution vulnerability known as the $N \times (N-1)/2$ problem; as the network grows, sharing unique secret keys between every pair of users becomes unmanageable.
*   **You must know** the three collision requirements for secure hash functions: First preimage resistance (hard to find a message from a given hash), Second preimage resistance (hard to find a second message matching a given message''s hash), and Collision resistance (hard to find *any* two messages with the same hash).
*   **You must know** that a digital signature provides *Data Integrity* (via the hash value) and *Non-repudiation* (via private key encryption), but it does *not* provide confidentiality.
*   **You must know** the difference between a Virus (needs a host file to propagate/execute) and a Worm (exploits network vulnerabilities to run and spread independently).
*   **You must know** that Advanced Encryption Standard (AES) is based on the *Rijndael* algorithm, which does *not* use a Feistel structure, but instead uses a state matrix with a non-linear layer, linear mixing layer, and key addition layer.
*   **You must know** that 3DES (Triple DES) was introduced because DES''s 56-bit key became too weak; 3DES operates by Encrypting, Decrypting, and Encrypting again, effectively using three 56-bit keys ($C = E_{k3}(D_{k2}(E_{k1}(P)))$).
*   **You must know** the components of PKI: Certification Authority (CA, issues and signs certificates), Registration Authority (RA, verifies identity), Subscribers, and the Repository/Archive (stores certificates and Certificate Revocation Lists).

**5. Common Mistakes**
*   **Confusing Confusion and Diffusion:** Students frequently mix these up. Remember: *Confusion* = Substitution (complex relationship between ciphertext and *key*). *Diffusion* = Transposition/Permutation (complex relationship between ciphertext and *plaintext*).
*   **Misunderstanding Digital Signatures:** Students often think a digital signature means encrypting the entire document with a private key. It does not. It only encrypts the *hash (digest)* of the document to save computational resources.
*   **Assuming Asymmetric is Always Better:** Students forget that asymmetric cryptography is highly computationally intensive (approx. 100x slower than symmetric). In practice, asymmetric is used to securely exchange a *symmetric session key*, which is then used to encrypt the actual data.
*   **Confusing Hash Preimage Resistances:** Second preimage resistance is about matching a *specific, existing* message''s hash. Collision resistance is the broader inability to find *any* two random messages that hash to the exact same value.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3), 'What does the "Avalanche effect" refer to in conventional cryptography?', '["A 1-bit change in plaintext or key produces large changes in the ciphertext","The ciphertext shrinks with each round","Keys avalanche into smaller subkeys","Plaintext statistics are preserved"]', 0, 'It is a diffusion property where a 1-bit difference in the plaintext or the key rapidly results in a large number of differences in the final cipher-text bits.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3), 'What are the two fundamental principles of secrecy design introduced by Claude Shannon?', '["Confusion and Diffusion","Substitution and Addition","Encryption and Decryption","Hashing and Salting"]', 0, 'Confusion and Diffusion.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3), 'In a Feistel cipher, what mathematical operation is used to combine the Left half of the data with the output of the round function $F$?', '["XOR (Exclusive OR)","AND","Modular multiplication","Bit rotation"]', 0, 'XOR (Exclusive OR).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3), 'What is the key size and the number of keys used in standard 3DES?', '["Three 56-bit keys applied Encrypt-Decrypt-Encrypt","One 128-bit key","Two 64-bit keys","Three 128-bit keys"]', 0, 'Three 56-bit keys (for a total of 168 bits, though sometimes two are the same), applied in an Encrypt-Decrypt-Encrypt sequence.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3), 'Which specific algorithm was chosen by NIST to become the Advanced Encryption Standard (AES), and does it use a Feistel network?', '["Rijndael; no, it does not use a Feistel network","Rijndael; yes, it uses a Feistel network","DES; no Feistel network","Blowfish; yes, Feistel based"]', 0, 'The Rijndael algorithm. No, it does not use a Feistel structure; it uses a state matrix with non-linear, linear mixing, and key addition layers.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3), 'Define "Collision resistance" in the context of hash functions.', '["Infeasible to find any two distinct messages with the same hash","Infeasible to reverse a hash to its message","Infeasible to find a second message matching a given message hash","Infeasible to compute the hash at all"]', 0, 'It is the property that makes it computationally infeasible to find *any* two distinct messages ($M_1$ and $M_2$) that produce the exact same hash value ($h(M_1) = h(M_2)$).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3), 'What formula illustrates the scalability problem of symmetric key distribution?', '["N x (N - 1) / 2","N x N","2^N","N - 1"]', 0, '$N \times (N - 1) / 2$.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3), 'Name the four main components of a Public Key Infrastructure (PKI).', '["Certification Authority, Registration Authority, Subscribers, Repository/Archive","Sender, Receiver, Key, Cipher","CA, Firewall, VPN, IDS","Hash, Salt, Key, Certificate"]', 0, 'Certification Authority (CA), Registration Authority (RA), Users/Subscribers, and Repository/Archive.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3), 'Explain the difference between a P-box and an S-box in block ciphers.', '["An S-box does key-controlled substitution (non-linearity); a P-box permutes bits","An S-box permutes bits; a P-box substitutes","Both only permute bits","Both only substitute values"]', 0, 'An S-box (Substitution box) performs complex, key-controlled substitutions to provide non-linearity. A P-box (Permutation box) performs block-wise permutations/scrambling of digits to provide maximum entropy.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3), 'Bob receives an email claiming to be from Alice, along with a digital signature. To verify the signature, Bob hashes the email and decrypts the signature. Which key must Bob use to decrypt the signature, and what two security guarantees does a successful match provide him?', '["Alice''s public key; it guarantees data integrity and non-repudiation","Alice''s private key; confidentiality and integrity","Bob''s public key; authentication and confidentiality","A shared symmetric key; integrity only"]', 0, 'Bob must use *Alice''s Public Key*. A successful match guarantees Data Integrity (the email wasn''t altered) and Non-repudiation/Authentication (Alice definitely sent it, as only her private key could have encrypted the matching hash).');

INSERT INTO chapters (number, title, content_md) VALUES (4, 'Operating System Security', '**1. Overview**
Chapter Four covers the security architectures, access control mechanisms, and fundamental design philosophies of the Windows and Linux/UNIX operating systems. It matters because it highlights the stark contrast between Windows’ highly granular, centrally managed security frameworks—such as Active Directory, Security Identifiers (SIDs), and Access Tokens—and UNIX’s historically modular approach that lacks a unified architecture and relies entirely on careful administration of user IDs and file permissions. Understanding these OS-level controls is essential for securing system resources against unauthorised access and preventing privilege escalation.

**2. Key Terms**
*   **Local Security Authority (LSA):** A Windows user-mode process responsible for password verification, access tokens, and audit logs (Slide 3/23).
*   **Security Accounts Manager (SAM):** The Windows database containing user accounts and encrypted passwords (Slide 3/23).
*   **Security Identifier (SID):** A unique, machine-generated code used to identify active entities (principals) in Windows security policies (Slide 9/23).
*   **Access Token:** A Windows credential container for a subject (process or thread) that holds identity SIDs, privileges, and default access rights (Slide 12/23).
*   **Active Directory:** A directory service in Windows used for the centralised organisation of system resources, users, security credentials, and trust management (Slide 6/23).
*   **UID / GID (User/Group Identifier):** 16-bit numbers used by UNIX to identify distinct users and groups (Slide 7/30).
*   **Inode:** A UNIX data structure that describes essential properties and access control rules for a specific resource or file (Slide 12/30).
*   **umask:** A UNIX command used to alter the default permissions of newly created files by specifying which bits to remove (Slide 17/30).
*   **SUID (Set User ID):** A Linux flag allowing a program to execute under the privilege of its owner, rather than the user calling it (Slide 20/30).
*   **Sticky Flag:** A Linux directory permission flag ensuring that only the owner of a file (or root) can remove files within that directory (Slide 20/30).

**3. Processes & Models**
**ACE (Access Control Entry) Processing Sequence (Windows)**
1. The system processes Access Control Entries sequentially within a Discretionary Access Control List (DACL).
2. Processing stops immediately if an entry explicitly *denies* the requested access rights.
3. Processing also stops if a set of entries explicitly *grants* all requested access rights.

**Effective Permission Calculation via umask (Linux)**
1. Identify the default permissions for the object (e.g., `777` for programs, `666` for files).
2. Identify the specified `umask` octal value (e.g., `022`).
3. Calculate the inverse of the mask using bitwise NOT (e.g., inverse of `022` is `755`).
4. Combine the default permission and the inverted mask to get the final resulting permissions (e.g., `777` combined with inverse `755` results in `755`).

**Object Security Descriptor Structure (Windows)**
1. **Owner SID:** Identifies the principal who holds ownership of the object.
2. **Primary Group SID:** Stored primarily for POSIX compatibility.
3. **DACL:** Specifies who is granted and who is denied access to the object.
4. **SACL:** Specifies the security audit policy for tracking access.

**4. Most Examinable Points**
*   **You must know** that UNIX inherently does *not* possess a unified security architecture; its security relies entirely on mechanisms that must be independently and correctly configured by an administrator.
*   **You must know** the difference between a Windows *Privilege* (which controls system-wide tasks like shutting down the system) and an *Access Right* (which dictates actions on specific objects like reading a file).
*   **You must know** the root user in Linux (UID 0) bypasses almost all access control mechanisms, and any user name can theoretically be mapped to UID 0 to grant root access.
*   **You must know** how to translate UNIX permissions between text (e.g., `rwxr-xr-x`) and octal (e.g., `755`) formats.
*   **You must know** the severe security risk of SUID programs; if ownership of a vulnerable SUID script is transferred to root, an attacker exploiting it automatically gains root privileges.
*   **You must know** the core components of Windows User Mode security: the Log-on process (winlogon), Local Security Authority (LSA), Security Accounts Manager (SAM), and User Account Control (UAC).
*   **You must know** that an Active Directory Domain Controller (DC) handles domain authentication, and they are typically replicated to prevent a single point of failure.
*   **You must know** the mapping of UNIX processes to UIDs: the *real* UID is always inherited from the parent process, while the *effective* UID can be inherited from the parent OR from the owner of the executed file if the SUID flag is set.

**5. Common Mistakes**
*   **Confusing Privileges and Access Rights in Windows:** Students frequently treat these interchangeably. Remember that Privileges are fixed system-wide rights (like locking a page in memory), while Access Rights are object-specific (like write access to a registry key).
*   **Miscalculating the Linux umask:** Students often subtract the mask as a normal decimal number. It acts as a bitwise filter; a default of `666` and a mask of `033` results in `644`, not `633`.
*   **Assuming SUID is a Defensive Security Measure:** Students sometimes assume SUID makes a system inherently secure by restricting execution rights. In reality, it is a functional tool that poses a massive risk of privilege escalation if applied carelessly to insecure scripts.
*   **Misunderstanding UNIX origins:** Assuming UNIX was built with high security in mind. Security was secondary to modularity, portability, and efficiency.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4), 'Which Windows user-mode component is specifically responsible for password verification, generating access tokens, and handling audit logs?', '["The Local Security Authority (LSA)","The Security Accounts Manager (SAM)","Active Directory","The Reference Monitor"]', 0, 'The Local Security Authority (LSA).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4), 'In Linux, what does the octal permission `644` translate to in text format?', '["rw-r--r--","rwxr--r--","rw-rw-r--","r--r--r--"]', 0, '`rw-r--r--` (Owner: read/write, Group: read-only, Others: read-only).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4), 'Define what an Access Control Entry (ACE) does in Windows.', '["An ACL entry defining allow or deny permissions for a specific principal SID","A list of all users on the system","A Linux file permission bit","A password hash record"]', 0, 'An individual entry within an ACL that defines positive (allow) or negative (deny) permissions for a specific principal SID.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4), 'True or False: UNIX was designed from the ground up with a comprehensive, unified security architecture.', '["False","True"]', 0, 'False. UNIX explicitly does *not* have a security architecture; its design goals were modularity, portability, and efficiency.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4), 'What is the purpose of the `umask` command in Linux?', '["It masks out bits from the default permissions of newly created files","It grants root access to a user","It encrypts new files","It lists active processes"]', 0, 'It changes the default permissions for newly created files and directories by masking out specific bits.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4), 'Within a Windows Security Descriptor, which component explicitly specifies who is granted and who is denied access to an object?', '["The Discretionary Access Control List (DACL)","The System Access Control List (SACL)","The Owner SID","The Primary Group SID"]', 0, 'The Discretionary Access Control List (DACL).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4), 'What is the difference between a *real* UID and an *effective* UID in Linux?', '["Real UID is inherited from the parent; effective UID may come from the parent or a SUID file owner","Real UID comes from SUID; effective UID from the parent","They are always identical","Effective UID is always 0"]', 0, 'The *real* UID is always inherited from the parent process. The *effective* UID can be inherited from the parent OR from the owner of the executed file if the SUID flag is present.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4), 'Name three components found within a Windows Object Security Descriptor.', '["Owner SID, DACL, SACL","inode, umask, SUID","LSA, SAM, UAC","TGT, TGS, AS"]', 0, 'Any three of: Owner SID, Primary Group SID, DACL, SACL.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4), 'What does the "Sticky flag" do when applied to a directory in Linux?', '["Only the file owner (or root) may remove files in that directory","It makes the directory read-only","It runs files with owner privilege","It hides the directory"]', 0, 'It ensures that only the owner of a file (or root) is permitted to remove files within that directory.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4), 'A Linux user writes a new script. The OS default permission for programs is `777`. If the administrator has set the system''s `umask` to `027`, what will the final octal permission of the newly created script be, and what does this mean in plain English for the Owner, Group, and Others?', '["750: owner rwx, group r-x, others none","755: owner rwx, group r-x, others r-x","640: owner rw-, group r--, others none","777: full access for everyone"]', 0, 'The final octal permission will be `750`. This means the Owner has full read/write/execute access (`7` or `rwx`), the Group has read and execute access (`5` or `r-x`), and Others have absolutely no access (`0` or `---`).');

INSERT INTO chapters (number, title, content_md) VALUES (5, 'Software & Web Security', '**1. Overview**
This chapter covers the critical vulnerabilities and protective measures at the application layer. It matters because it explores how malicious software (malware) and input validation failures (such as buffer overflows and SQL injection) can completely compromise system security. Furthermore, it details how stateless web protocols are exploited via cross-site scripting (XSS) and cross-site request forgery (CSRF), and concludes with how digital watermarking is utilised to protect copyright and verify the integrity of digital media. Understanding these concepts is essential for defending against the most prevalent application-level attacks.

**2. Key Terms**
*   **Malware:** Program code executed without a user’s consent that carries out harmful functionality [Slide 555].
*   **Virus:** Malware that copies itself to other files and needs a host file to propagate and execute [Slide 576].
*   **Worm:** Malware that exploits network vulnerabilities to spread independently over a network [Slide 576].
*   **Buffer Overflow:** A vulnerability where a lack of bounds checking allows data to overspill into adjacent stack memory, potentially hijacking the execution flow [Slides 585, 587].
*   **Code Injection:** Tricking a program into executing an attacker''s code by cleverly manipulating input to mix code and data [Slide 600].
*   **Cross-Site Scripting (XSS):** A vulnerability where unvalidated user input is reflected by a web application, allowing the execution of arbitrary Javascript in a victim''s browser [Slides 628, 630].
*   **Cross-Site Request Forgery (CSRF / XSRF):** An attack that tricks a victim''s browser into sending a forged request using existing, active authorisation credentials (like session cookies) [Slides 637, 639].
*   **Digital Watermark:** A digital signal or pattern covertly inserted into a document that carries information unique to the copyright owner or authorised consumer [Slides 648, 651].
*   **Least Significant Bit (LSB):** A spatial watermarking technique where the lowest-order bits of pixels or bytes are altered to hide data with minimal visual distortion [Slides 665, 666].

**3. Processes & Models**
**Malware Incident Handling Steps**
1. **Preparation** (Steady State)
2. **Identification** (Declare an Incident)
3. **Containment** 
4. **Eradication** (Start Clean-Up)
5. **Recovery** (Finish Clean-Up, Back in Production)
6. **Lessons Learned**

**Stack Buffer Overflow Attack Sequence**
1. Identify a vulnerable function (e.g. `strcpy()`) that copies input into a local buffer without checking the string''s length.
2. Input a string larger than the allocated buffer.
3. Overflow the adjacent memory, specifically targeting the **return address** within the stack frame.
4. Overwrite the return address with a guessed pointer to the attacker''s own code (e.g. `exec("/bin/sh")`) placed inside the stack.
5. When the function exits, the execution flow is hijacked to run the attacker''s code.

**Cross-Site Scripting (XSS) Attack Sequence**
1. The attacker inserts a malicious script (e.g. via a form) into a website''s database.
2. The victim requests a page from the infected website.
3. The website includes the malicious script from the database in the response sent to the victim.
4. The victim''s browser executes the malicious script, often sending sensitive data (like cookies) back to the attacker''s server.

**LSB Checksum Watermarking Algorithm**
1. Randomly choose eight pixels to hold one bit each of a checksum.
2. Form a 56-bit checksum by concatenating the 7 most significant bits of each chosen pixel.
3. Replace the Least Significant Bit (LSB) of each pixel with the corresponding checksum bit to embed the watermark.

**4. Most Examinable Points**
*   **You must know** that the primary source of software insecurity is the failure to validate and sanitise user input.
*   **You must know** the fundamental difference between a virus (requires a host file to propagate) and a worm (exploits vulnerabilities to spread independently).
*   **You must know** that a buffer overflow exploits the stack''s "bottom-up" allocation by overwriting the return address.
*   **You must know** the three defensive mechanisms against stack exploits: Data Execution Protection (DEP), Address Space Layout Randomisation (ASLR), and Canaries.
*   **You must know** that XSS allows the execution of arbitrary Javascript in a user''s browser because the application reflects user input without filtering.
*   **You must know** that SQL Injection bypasses authentication or alters queries by manipulating input (e.g. using `'' OR 1=1`), and is defended against using parameterised input and input sanitisation.
*   **You must know** the difference between spatial watermarking (changing pixel values like LSB) and frequency domain watermarking (applying watermarks in low-frequency redundant data areas).
*   **You must know** that watermarking attacks (like Jitter or StirMark) aim to produce media very similar to the original while successfully destroying or confusing the watermark detector.

**5. Common Mistakes**
*   **Confusing Viruses and Worms:** Students frequently mix these up. Remember: a virus *requires a host file* and user interaction to spread. A worm spreads *independently* across a network.
*   **Misunderstanding XSS vs. CSRF:** XSS involves injecting malicious *scripts* that execute in the victim''s browser. CSRF involves forging *requests* from a victim''s browser to exploit their existing authenticated session (e.g. an active banking login).
*   **Assuming Encryption and Watermarking are the same:** Encryption transforms a document to make it unreadable without a key. Watermarking leaves the original file intact and readable, merely hiding a copyright or integrity marker within it.
*   **Thinking LSB Watermarking is robust:** Students sometimes assume LSB is highly secure. In reality, it is extremely fragile; the entire watermark can be destroyed simply by removing the LSB plane or using lossy compression.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5), 'Define "Malware" according to the slides.', '["Program code executed without the user''s consent that carries out harmful functionality","Any program that uses the network","Software with a graphical interface","A legally licensed application"]', 0, 'Program code executed without a user''s consent and carrying out harmful functionality.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5), 'What is the fundamental difference between a Trojan Horse and a Rootkit?', '["A Trojan masquerades as helpful software; a Rootkit hides processes and maintains privileged access","A Trojan spreads over the network; a Rootkit needs a host file","They are the same thing","A Rootkit masquerades as a game; a Trojan hides files"]', 0, 'A Trojan Horse masquerades as a helpful or harmless program to steal data or install malware, whereas a Rootkit is designed specifically to mask malicious processes and maintain hidden, privileged remote access.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5), 'Name the three security mechanisms that protect the stack against buffer overflow attacks.', '["Data Execution Protection, Address Space Layout Randomisation, Canaries","Firewalls, VPNs, IDS","Encryption, Hashing, Salting","DEP, SQL parameterisation, XSS filtering"]', 0, 'Data Execution Protection (DEP), Address Space Layout Randomisation (ASLR), and Canaries.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5), 'What specific component of a stack frame does a buffer overflow attacker aim to overwrite to hijack the execution flow?', '["The return address","The heap pointer","The program counter register","The function name"]', 0, 'The return address.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5), 'In web security, what does CSRF stand for, and what does it exploit?', '["Cross-Site Request Forgery; it exploits an existing authenticated session","Cross-Site Reflected Forgery; it injects scripts","Client-Side Request Filtering; it blocks cookies","Cross-Site Resource Fetch; it steals files"]', 0, 'Cross-Site Request Forgery. It exploits an existing authenticated session (like an active session cookie) by tricking the browser into sending a forged request.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5), 'How does a SQL injection attack bypass a password check using the string `'' OR 1=1`?', '["It makes the query condition always true (1=1), granting access without a valid password","It deletes the password table","It encrypts the query","It overflows the login buffer"]', 0, 'It modifies the SQL query so that the password check evaluates to true (since 1=1 is always true), permitting access even if the password field is blank.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5), 'What is the main difference between encryption and digital watermarking?', '["Encryption makes a document unreadable without a key; watermarking leaves it intact with a hidden marker","Both make the document unreadable","Watermarking needs a key; encryption does not","Encryption hides a copyright marker inside the file"]', 0, 'Encryption transforms a document to make it unreadable without a key, whereas watermarking leaves the original document intact and recognisable.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5), 'Name three characteristics (requirements) of a good digital watermark.', '["Any three of: Unobtrusive, Readily Detectable, Unambiguous, Innumerable, Robust","Encrypted, Compressed, Signed","Fast, Cheap, Small","Visible, Removable, Editable"]', 0, 'Any three of: Unobtrusive, Readily Detectable, Unambiguous, Innumerable, Robust.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5), 'What is a "Jitter attack" in the context of digital watermarking?', '["It tweaks lower-order bits and adds jitter to stop watermark bits being located, keeping the object intact","It floods the detector with requests","It encrypts the watermark","It overflows the media buffer"]', 0, 'An attack that tweaks lower-order bits and adds jitter (e.g. duplicating or deleting signal segments at random) to prevent watermarked bits from being located, whilst keeping the object more or less intact.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5), 'Your company''s web application takes a user''s search term and immediately displays "You searched for: [term]" on the page without any filtering. What specific type of vulnerability is this, and what could an attacker execute in the victim''s browser?', '["Cross-Site Scripting (XSS); the attacker could run arbitrary JavaScript to steal session cookies","SQL Injection; the attacker could drop tables","CSRF; the attacker could forge a bank transfer","Buffer overflow; the attacker could overwrite the return address"]', 0, 'Cross-Site Scripting (XSS). An attacker could inject arbitrary Javascript (e.g. `<script>...</script>`) which would execute in the victim''s browser, potentially stealing sensitive data like session cookies.');

COMMIT;
