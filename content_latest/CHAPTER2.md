**1. Overview**
Chapter Two shifts from general security concepts to the specific mechanisms and formal theoretical models used to control system access. It covers the entire lifecycle of resource access—from identifying and authenticating a subject, to authorising their actions, and logging the transaction for accountability. This chapter matters because it bridges practical implementations (like biometrics, Kerberos, ACLs, and Capabilities) with the rigorous, formal mathematical models (like Bell-LaPadula, Biba, and the Chinese Wall) that are used to prove a system successfully enforces confidentiality and integrity policies.

**2. Key Terms**
*   **Information Security:** The process of protecting information's Confidentiality, Integrity, Availability, Accountability, and Privacy [021 Slide 2/9].
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
*   **Confusing MAC vs DAC:** Students often think DAC means access is "discretionary" for everyone. It means the *resource owner* executes control. MAC removes owner control, forcing a centralised, administrator-defined policy.

**6. Quiz**
1. What five properties does Information Security protect?
2. What are the three aspects that contend with each other in an information-hiding system?
3. What are the three main objectives of authentication?
4. "Signature dynamics" falls under which category of user authentication?
5. State the exact logical condition for the Bell-LaPadula "Simple Security Property" (ss-Property) regarding reading an object.
6. What does the "Integrity confinement" rule state in the Biba model?
7. In the context of access control structures, what is the disadvantage of using a Capability List (C-List) over an ACL?
8. What is the fundamental difference between Discretionary Access Control (DAC) and Mandatory Access Control (MAC)?
9. What is a "Protection ring" and what occupies Ring 0?
10. Identify the three core requirements of a Reference Monitor.
11. Which formal security model actively relies on "Conflict of Interest" (COI) classes?
12. Define "Role Based Access Control" (RBAC) according to the slides.
13. What is the Biba Invocation property?
14. What four steps make up the Resource Access sequence?
15. What are the five placement levels for a Reference Monitor?
16. Does the Bell-LaPadula *-Property allow "writes up" or "writes down"?
17. In the Kerberos protocol, what happens immediately after the client generates Authenticator U (Step 5)?
18. What does "Negative permission" mean in access control abstractions?
19. *Applied Question:* A subject with a 'Secret' clearance wants to read a file classified as 'Top Secret'. According to the Bell-LaPadula model, what specific property blocks this action, and what is its informal name?
20. *Applied Question:* A consultant reads an unsanitised file belonging to Domino's. She then attempts to read a file belonging to Pizza Hut (which is in the same Conflict of Interest class), and attempts to write to a file belonging to Ford Motors (a different COI class). According to the Chinese Wall model, which actions are blocked, and why?

***

**Answers**
1. Confidentiality, Integrity, Availability, Accountability, and Privacy.
2. Security, Robustness, and Capacity.
3. Correctness, Impersonation prevention, and Protection against transferability.
4. "Something you are" (behavioral characteristics).
5. Subject $s$ can read object $o$ iff $L(o) \le L(s)$ and $s$ has permission to read $o$.
6. A subject can read an object only if $I(S) \le I(O)$.
7. It offers a poor overview of access rights per object and makes revocation difficult.
8. In DAC, access control is carried out by the resource owner. In MAC, access rights are fixed centrally by an administrator via a system-wide policy.
9. A hierarchy of access right levels; Ring 0 is occupied by the operating system kernel.
10. Tamper-resistance, Complete mediation (guaranteed invocation), and Easiness of verification and testing.
11. The Chinese Wall model.
12. A "logical" layer that links users and allowed resources based on the need or circumstances in which a user needs a resource.
13. A subject can invoke another subject only if $I(S_1) \ge I(S_2)$.
14. Identification, Authentication, Authorization, and Accountability.
15. Hardware, OS kernel, Operating system, Services, and Applications.
16. It allows "writes up" but disallows "writes down".
17. Step 6: Send TGS.
18. It is the explicit revocation of access rights.
19. The Simple Security Property (ss-Property) blocks this action, informally known as the "no reads up" rule.
20. Both actions are blocked. Reading the Pizza Hut file is blocked by the Simple Security Rule (she has already accessed a competitor in the same COI class). Writing to the Ford Motors file is blocked by the *-property (she has read unsanitised information in a different company dataset—Domino's).
