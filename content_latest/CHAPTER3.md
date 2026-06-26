**1. Overview**
This chapter covers the evolution and mechanics of cryptography, bridging classical substitution and transposition methods with modern computational algorithms like DES, AES (Rijndael), and stream ciphers. It expands into the theoretical foundations of secrecy (Shannon's principles of Confusion and Diffusion), asymmetric (public-key) frameworks, cryptographic hash functions, and the Public Key Infrastructure (PKI) required to manage trust at scale. This matters because cryptography is the mathematical engine enabling core information security objectives: guaranteeing confidentiality, detecting malicious alterations (integrity), preventing masquerading (authentication), and ensuring users cannot deny their actions (non-repudiation).

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
*   **You must know** Shannon's principles: Confusion (achieved via substitution) and Diffusion (achieved via transposition/permutation).
*   **You must know** the difference between Passive attacks (eavesdropping, traffic analysis - difficult to detect, should be prevented) and Active attacks (masquerade, replay, modification, DoS - difficult to prevent, should be detected).
*   **You must know** the symmetric key distribution vulnerability known as the $N \times (N-1)/2$ problem; as the network grows, sharing unique secret keys between every pair of users becomes unmanageable.
*   **You must know** the three collision requirements for secure hash functions: Preimage resistance (computationally infeasible to find $M$ such that $D = h(M)$), Second preimage resistance (infeasible to find $M' \ne M$ such that $D = h(M')$), and Collision resistance (infeasible to find any pair $M_1, M_2$ such that $h(M_1) = h(M_2)$).
*   **You must know** the Birthday Paradox implies that for an ideal hash function with output size $n$, a collision attack only requires $2^{n/2}$ operations (whereas a brute force second-preimage attack requires $2^n$ operations).
*   **You must know** that a digital signature provides *Data Integrity* and *Non-repudiation*, but it does *not* provide confidentiality.
*   **You must know** that 3DES (Triple DES) uses three 56-bit keys and operates in an Encrypt-Decrypt-Encrypt sequence: $C = E_{k3}(D_{k2}(E_{k1}(P)))$.
*   **You must know** the components of PKI: Certification Authority (CA, issues and signs certificates), Registration Authority (RA, identity proofing), Users/Subscriber, and the Repository/Archive (stores certificates and CRLs).

**5. Common Mistakes**
*   **Confusing Confusion and Diffusion:** Students frequently mix these up. Remember: *Confusion* is tied to Substitution (obscuring the key-to-ciphertext relationship). *Diffusion* is tied to Transposition/Permutation (obscuring the plaintext-to-ciphertext relationship).
*   **Misunderstanding Digital Signatures:** Students often think a digital signature means encrypting the entire document with a private key. It does not. It only encrypts the *hash (digest)* of the document to save computational resources.
*   **Confusing Asymmetric Key Uses:** Encrypting with a public key is for *confidentiality* (only the recipient can decrypt with their private key). Encrypting with a private key is for *digital signatures/non-repudiation* (anyone can verify with the public key, proving authorship).
*   **Assuming AES uses a Feistel structure:** AES (Rijndael) explicitly does *not* use a Feistel structure. It uses a state matrix with independent non-linear, linear mixing, and key addition operations.

**6. Quiz**
1. What is the mathematical formula illustrating the scalability problem of symmetric key distribution?
2. Name the three classifications of cryptography based on 'Method', 'Key', and 'Processing'.
3. What mathematical operation is used in a Feistel cipher to combine $L_i$ with the output of $F(R_i, K_i)$?
4. What are the input and output bit sizes of a DES S-box?
5. What is the 3DES (Triple DES) equation for encryption using three keys?
6. According to Shannon's theory, what is the only perfectly secure encryption algorithm?
7. Does the Rijndael (AES) algorithm use a Feistel structure?
8. Define "Preimage resistance" for a hash function.
9. According to the Birthday Paradox, how many operations are required to stage a collision attack on an ideal hash function with an output size of $n$?
10. Name the four main components of a Public Key Infrastructure (PKI).
11. Which PKI component is responsible for verifying certificate contents for the CA (Identity proofing)?
12. What two security characteristics does a Digital Signature natively provide?
13. What is the fundamental difference between an Active attack and a Passive attack?
14. Give two examples of an Active attack.
15. In what type of cryptographic protocol does a trusted third party only help if needed and after the fact?
16. What does a Certification Authority (CA) publish to list invalid or revoked certificates?
17. What specifically does an X.509 digital certificate bind together?
18. What does the "Avalanche effect" refer to in conventional cryptography?
19. *Applied Question:* Alice wants to send a confidential message to Bob using asymmetric cryptography so that absolutely no one else can read it. Which specific key must Alice use to encrypt the message, and which key will Bob use to decrypt it?
20. *Applied Question:* Bob receives a digitally signed contract from Sue. To validate the signature, Bob successfully computes the hash of the contract. What must he do with Sue's public key next, and what determines if the signature is definitively valid?

***

**Answers**
1. $N \times (N - 1) / 2$.
2. Method (Transposition/Substitution), Key (Asymmetric/Symmetric), and Processing (Stream/Block).
3. XOR (Exclusive OR).
4. 6-bit input and 4-bit output.
5. $C = E_{k3}(D_{k2}(E_{k1}(P)))$.
6. The One Time Pad.
7. No, it uses a state matrix with non-linear, linear mixing, and key addition layers.
8. For any given value $D$, it is computationally infeasible to find $M$ such that $D = h(M)$.
9. $2^{n/2}$ operations.
10. Certification Authority (CA), Registration Authority (RA), Users/Subscriber, and Repository/Archive.
11. Registration Authority (RA).
12. Data Integrity and Non-repudiation.
13. Active attacks attempt to alter system resources or affect their operation, whereas Passive attacks merely attempt to learn or make use of information without affecting system resources.
14. Any two of: masquerade (spoofing), replay, modification (substitution, insertion, destruction), denial of service.
15. An Adjudicated Protocol.
16. Certificate Revocation Lists (CRLs).
17. It binds an entity name to its public key.
18. It is a diffusion property where a 1-bit difference in the plaintext or the key rapidly results in a large difference in the ciphertext bits.
19. Alice must encrypt the message using *Bob's Public Key*. Bob will then decrypt it using *Bob's Private Key*.
20. Bob must decrypt the original attached hash (the signature) using *Sue's Public Key*. If the hash value he computed matches the hash value he decrypted, the signature is valid.
```
