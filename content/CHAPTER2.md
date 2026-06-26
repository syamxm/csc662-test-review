I have synthesised the four slide decks from the "02" series (021 to 024) to form your Chapter Two study guide, covering Information Security, Identification & Authentication, Access Control, and Formal Security Models. 

Here is your exam-focused cram guide:

**1. Overview**
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
1. **Simple Security Property (ss-Property):** "No reads up." A subject can read an object only if the subject's clearance level is greater than or equal to the object's classification.
2. **\*-Property (Star Property):** "No writes down." A subject can write to an object only if the subject's clearance level is less than or equal to the object's classification.

**Biba Integrity Model**
1. **Simple Integrity:** A subject can modify (write to) an object only if the subject's integrity level is greater than or equal to the object's.
2. **Integrity Confinement:** A subject can read an object only if the subject's integrity level is less than or equal to the object's.
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
*   **You must know** that Chinese Wall permissions change dynamically based entirely on the history of the subject's past accesses.

**5. Common Mistakes**
*   **Mixing up Bell-LaPadula and Biba rules:** Students famously reverse these. Remember: BLP protects *secrets* ("No Read Up, No Write Down"). Biba protects *trust/integrity* ("No Read Down, No Write Up").
*   **Confusing Identification and Authentication:** Identification is just stating a name (e.g. providing a username); Authentication is proving that the name is yours (e.g. providing the password).
*   **Misunderstanding MAC vs DAC:** Students often think DAC means access is "discretionary" for everyone. It means the *resource owner* uses their discretion to grant rights. MAC overrides the owner, forcing a centralised, administrator-controlled policy.
*   **Confusing ACLs and Capabilities:** Students forget which list belongs to what. An ACL is attached to the *file/object* (like a bouncer holding a guest list at a door). A Capability is attached to the *user/subject* (like a VIP pass in a user's pocket).

**6. Quiz**
1. What are the three conflicting aspects of an information-hiding system?
2. Which category of user authentication does "signature dynamics" fall under?
3. State the formula for the "Simple Security Property" (ss-Property) in the Bell-LaPadula model.
4. What is the fundamental difference between Discretionary Access Control (DAC) and Mandatory Access Control (MAC)?
5. Which formal security model uses "Conflict of Interest" (COI) classes?
6. Identify the three core requirements of a Reference Monitor.
7. What is the primary vulnerability or downside of using a Capability List (C-List) instead of an ACL?
8. In the Kerberos protocol, what is the purpose of the Ticket Granting Server (TGS)?
9. State the Biba model's rule regarding "writing" (modifying) an object.
10. *Applied Question:* A contractor is hired to audit the networks of Domino's and Pizza Hut, who are direct competitors. On her first day, she accesses a file on the Domino's network. According to the slides, what formal security model dictates that she must now be permanently blocked from accessing any files on the Pizza Hut network, and why?

***

**Answers**
1. Security, Robustness, and Capacity.
2. "Something you are" (Biometrics/behavioral characteristics).
3. "No reads up." A subject can read an object only if the object's security level is less than or equal to the subject's clearance.
4. In DAC, access control is carried out by the resource owner. In MAC, access rights are fixed centrally by an administrator via a system-wide policy.
5. The Chinese Wall model.
6. Tamper-resistance, Complete mediation (guaranteed invocation), and Easiness of verification and testing.
7. It offers a poor overview of access rights per object and makes revocation of rights difficult.
8. The TGS verifies the client's Ticket-Granting Ticket (TGT) and authenticator, and if valid, generates a specific service ticket and session key for the application server.
9. Simple integrity: A subject can modify an object only if the subject's integrity level is greater than or equal to the object's integrity level ("No Write Up").
10. The Chinese Wall model. It dictates this block to prevent a conflict of interest, as her permissions dynamically change based on her history of past accesses. Because she accessed data in one conflict of interest class (Domino's), she is blocked from accessing data from a competing dataset (Pizza Hut) within the same class.
