**1. Overview**
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
*   **Ignoring Non-Malicious Threats:** Focusing entirely on hackers. The slides explicitly outline "Acts of Human Error or Failure" and "Forces of Nature" as among the greatest/most dangerous threats to an organisation.

**6. Quiz**
1. What does the CIA triad stand for?
2. Which two objectives were added "Beyond The CIA Triad" to form the five main security objectives?
3. Define "Mechanism" in the context of computer security.
4. Explain the difference between a Threat and a Vulnerability.
5. What are the two types of Asset Valuation listed in the slides?
6. What is the mathematical formula for evaluating Risk?
7. Differentiate between Quantitative and Qualitative risk analysis.
8. What are the three broad categories of Enterprise Security Threats?
9. Which specific security service counters the "Deception" threat class?
10. Give two examples of attacks that fall under the "Disclosure" threat class.
11. What are the three functions of security instruments/mechanisms?
12. Give an example of a "Semi-technical" prevention mechanism.
13. What does the "Fail-safe defaults" security design principle mean?
14. What does the "Open design" security design principle mean?
15. What are the two core elements of a "Defence-in-Depth" strategy?
16. What are the two core elements of a "Compartmentalisation" strategy?
17. What four conflicting elements make up the "Security Quadrilema"?
18. List the five layers of the "Onion Model" starting from the innermost layer.
19. *Applied Question:* Your organisation evaluates the danger of a server room fire. They calculate that a replacement server costs £10,000, and the probability of a fire is 1% per year, resulting in an expected loss calculation of £100 annually. According to the slides, what specific type of analysis is this?
20. *Applied Question:* A network engineer installs a web application firewall, a network firewall, and local personal firewalls on user workstations. According to the slides, what specific security design strategy is the engineer employing?

***

**Answers**
1. Confidentiality, Integrity, and Availability.
2. Authentication and Accountability.
3. The methods which can be used to fulfil policy requirements; the "implementation" of security.
4. A vulnerability is a weakness in the system, whereas a threat is a "potential" violation of security representing a constant danger.
5. Monetary replacement value and Lost revenue.
6. Risk = Assets x Vulnerabilities x Threats.
7. Quantitative analysis uses values from a mathematical domain (price and probability) to calculate an expected loss, while Qualitative analysis relies on ad-hoc advice by security experts without mathematical structure.
8. Act of Human Error or Failure, Forces of Nature, and Deviation in Quality of Services.
9. Integrity services.
10. Snooping, sniffing, or wiretapping.
11. Prevention, Detection, and Recovery/Reaction.
12. SSL encryption or credit card validation.
13. When in doubt, do not grant access.
14. No "security by obscurity".
15. Layered protection and Diversification.
16. Sensitivity/privilege differentiation and Information hiding.
17. Security, Cost, Functionality, and User expertise.
18. Hardware, OS kernel, Operating system, Services, and Applications.
19. Quantitative risk analysis.
20. Defence-in-Depth (specifically Layered protection).
