Here is your exam-focused cram guide for Chapter One, based exclusively on the "011 - Introduction to Computer Security" slides.

**1. Overview**
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
*   **Ignoring the 'Human Factor':** Students often focus entirely on hackers and technical exploits, forgetting that acts of human error (inexperience, improper training) are listed as "among the greatest threats" to organisational data.
*   **Misunderstanding Open Design:** Assuming security relies on keeping the system hidden. The slides explicitly state that Open Design means "no security by obscurity".

**6. Quiz**
1. What does the CIA triad stand for?
2. Define "Accountability" in the context of computer security.
3. What is the mathematical formula for evaluating Risk?
4. Explain the difference between a Threat and a Vulnerability.
5. Which class of threat involves the "acceptance of false data," and which security service counters it?
6. What does the "Fail-safe defaults" security design principle mean?
7. Differentiate between Quantitative and Qualitative risk analysis.
8. What are the three categories of security instruments/mechanisms mentioned in the system design lifecycle?
9. List the five layers of the "Onion Model" from the innermost layer to the outermost.
10. *Applied Question:* Your organisation implements SSL encryption on its web portal and monitors credit card statements for abnormal transactions. According to the slides, what level of instrument/mechanism (Non-technical, Semi-technical, or Technical) do these specific actions represent?

***

**Answers**
1. Confidentiality, Integrity, and Availability.
2. Actions are traceable to those responsible.
3. Risk = Assets x Vulnerabilities x Threats.
4. A vulnerability is a weakness in the system, whereas a threat is a "potential" violation of security that represents a constant danger to an asset.
5. Deception; it is countered by Integrity services.
6. When in doubt, do not grant access.
7. Quantitative uses mathematical values (price and probability) to calculate an expected loss, while Qualitative relies on ad-hoc advice by security experts without a mathematical structure.
8. Prevention, Detection, and Recovery/Reaction.
9. Hardware, OS Kernel, Operating System, Services, and Applications.
10. Semi-technical instruments/mechanisms.
