Here is your exam-focused cram guide for Chapter Five, synthesised exclusively from the "051" to "053" series slide decks covering Software Security, Web Security, and Digital Watermarking.

**1. Overview**
This chapter covers the critical vulnerabilities and protective measures at the application layer. It matters because it explores how malicious software (malware) and input validation failures (such as buffer overflows and SQL injection) can completely compromise system security. Furthermore, it details how stateless web protocols are exploited via cross-site scripting (XSS) and cross-site request forgery (CSRF), and concludes with how digital watermarking is utilised to protect copyright and verify the integrity of digital media. Understanding these concepts is essential for defending against the most prevalent application-level attacks.

**2. Key Terms**
*   **Malware:** Program code executed without a user’s consent that carries out harmful functionality [Slide 555].
*   **Virus:** Malware that copies itself to other files and needs a host file to propagate and execute [Slide 576].
*   **Worm:** Malware that exploits network vulnerabilities to spread independently over a network [Slide 576].
*   **Buffer Overflow:** A vulnerability where a lack of bounds checking allows data to overspill into adjacent stack memory, potentially hijacking the execution flow [Slides 585, 587].
*   **Code Injection:** Tricking a program into executing an attacker's code by cleverly manipulating input to mix code and data [Slide 600].
*   **Cross-Site Scripting (XSS):** A vulnerability where unvalidated user input is reflected by a web application, allowing the execution of arbitrary Javascript in a victim's browser [Slides 628, 630].
*   **Cross-Site Request Forgery (CSRF / XSRF):** An attack that tricks a victim's browser into sending a forged request using existing, active authorisation credentials (like session cookies) [Slides 637, 639].
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
1. Identify a vulnerable function (e.g. `strcpy()`) that copies input into a local buffer without checking the string's length.
2. Input a string larger than the allocated buffer.
3. Overflow the adjacent memory, specifically targeting the **return address** within the stack frame.
4. Overwrite the return address with a guessed pointer to the attacker's own code (e.g. `exec("/bin/sh")`) placed inside the stack.
5. When the function exits, the execution flow is hijacked to run the attacker's code.

**Cross-Site Scripting (XSS) Attack Sequence**
1. The attacker inserts a malicious script (e.g. via a form) into a website's database.
2. The victim requests a page from the infected website.
3. The website includes the malicious script from the database in the response sent to the victim.
4. The victim's browser executes the malicious script, often sending sensitive data (like cookies) back to the attacker's server.

**LSB Checksum Watermarking Algorithm**
1. Randomly choose eight pixels to hold one bit each of a checksum.
2. Form a 56-bit checksum by concatenating the 7 most significant bits of each chosen pixel.
3. Replace the Least Significant Bit (LSB) of each pixel with the corresponding checksum bit to embed the watermark.

**4. Most Examinable Points**
*   **You must know** that the primary source of software insecurity is the failure to validate and sanitise user input.
*   **You must know** the fundamental difference between a virus (requires a host file to propagate) and a worm (exploits vulnerabilities to spread independently).
*   **You must know** that a buffer overflow exploits the stack's "bottom-up" allocation by overwriting the return address.
*   **You must know** the three defensive mechanisms against stack exploits: Data Execution Protection (DEP), Address Space Layout Randomisation (ASLR), and Canaries.
*   **You must know** that XSS allows the execution of arbitrary Javascript in a user's browser because the application reflects user input without filtering.
*   **You must know** that SQL Injection bypasses authentication or alters queries by manipulating input (e.g. using `' OR 1=1`), and is defended against using parameterised input and input sanitisation.
*   **You must know** the difference between spatial watermarking (changing pixel values like LSB) and frequency domain watermarking (applying watermarks in low-frequency redundant data areas).
*   **You must know** that watermarking attacks (like Jitter or StirMark) aim to produce media very similar to the original while successfully destroying or confusing the watermark detector.

**5. Common Mistakes**
*   **Confusing Viruses and Worms:** Students frequently mix these up. Remember: a virus *requires a host file* and user interaction to spread. A worm spreads *independently* across a network.
*   **Misunderstanding XSS vs. CSRF:** XSS involves injecting malicious *scripts* that execute in the victim's browser. CSRF involves forging *requests* from a victim's browser to exploit their existing authenticated session (e.g. an active banking login).
*   **Assuming Encryption and Watermarking are the same:** Encryption transforms a document to make it unreadable without a key. Watermarking leaves the original file intact and readable, merely hiding a copyright or integrity marker within it.
*   **Thinking LSB Watermarking is robust:** Students sometimes assume LSB is highly secure. In reality, it is extremely fragile; the entire watermark can be destroyed simply by removing the LSB plane or using lossy compression.

**6. Quiz**
1. Define "Malware" according to the slides.
2. What is the fundamental difference between a Trojan Horse and a Rootkit?
3. Name the three security mechanisms that protect the stack against buffer overflow attacks.
4. What specific component of a stack frame does a buffer overflow attacker aim to overwrite to hijack the execution flow?
5. In web security, what does CSRF stand for, and what does it exploit?
6. How does a SQL injection attack bypass a password check using the string `' OR 1=1`?
7. What is the main difference between encryption and digital watermarking?
8. Name three characteristics (requirements) of a good digital watermark.
9. What is a "Jitter attack" in the context of digital watermarking?
10. *Applied Question:* Your company's web application takes a user's search term and immediately displays "You searched for: [term]" on the page without any filtering. What specific type of vulnerability is this, and what could an attacker execute in the victim's browser?

***

**Answers**
1. Program code executed without a user's consent and carrying out harmful functionality.
2. A Trojan Horse masquerades as a helpful or harmless program to steal data or install malware, whereas a Rootkit is designed specifically to mask malicious processes and maintain hidden, privileged remote access.
3. Data Execution Protection (DEP), Address Space Layout Randomisation (ASLR), and Canaries.
4. The return address.
5. Cross-Site Request Forgery. It exploits an existing authenticated session (like an active session cookie) by tricking the browser into sending a forged request.
6. It modifies the SQL query so that the password check evaluates to true (since 1=1 is always true), permitting access even if the password field is blank.
7. Encryption transforms a document to make it unreadable without a key, whereas watermarking leaves the original document intact and recognisable.
8. Any three of: Unobtrusive, Readily Detectable, Unambiguous, Innumerable, Robust.
9. An attack that tweaks lower-order bits and adds jitter (e.g. duplicating or deleting signal segments at random) to prevent watermarked bits from being located, whilst keeping the object more or less intact.
10. Cross-Site Scripting (XSS). An attacker could inject arbitrary Javascript (e.g. `<script>...</script>`) which would execute in the victim's browser, potentially stealing sensitive data like session cookies.
