**1. Overview**
Chapter Four covers the security architectures, access control mechanisms, and fundamental design philosophies of the Windows and Linux/UNIX operating systems. It matters because it highlights the stark contrast between Windows’ highly granular, centrally managed security frameworks—such as Active Directory, Security Identifiers (SIDs), and Access Tokens—and UNIX’s historically modular approach that lacks a unified security architecture entirely, relying instead on careful administration of user IDs, group IDs, and file permissions. Understanding these OS-level controls is essential for securing system resources against unauthorised access and preventing privilege escalation.

**2. Key Terms**
*   **Security Reference Monitor:** The Windows kernel-mode component responsible for ACL verification [041 Slide 3/23].
*   **Local Security Authority (LSA):** A Windows user-mode process responsible for password verification and change, access tokens, and audit logs [041 Slide 3/23].
*   **Security Accounts Manager (SAM):** The Windows database containing user accounts and password encryption [041 Slide 3/23].
*   **Security Identifier (SID):** A unique, machine-generated code of varying length used to identify principals in Windows [041 Slide 9/23].
*   **Access Token:** A Windows container for a subject's security credentials that provides a principal/subject mapping, inherited during the creation of new processes [041 Slide 11/23].
*   **Active Directory:** An LDAP-like directory service in Windows used for the organisation of system resources, users, security credentials, and trust management [041 Slide 6/23].
*   **UID / GID (User/Group Identifier):** 16-bit numbers used by UNIX to identify distinct users and groups [042 Slide 7/30].
*   **Inode:** A UNIX data structure pointed to by a directory that describes essential resource properties [042 Slide 12/30].
*   **umask:** A UNIX command that changes default permissions [042 Slide 17/30].
*   **Controlled Invocation:** Setting a special flag indicating that a program can be run under the privilege of its owner rather than that of a calling user [042 Slide 19/30].
*   **SUID (set UID):** A Linux flag allowing all users to run a program (under the owner's privilege) [042 Slide 20/30].
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
*   **Assuming UNIX was built with security in mind:** Students often assume UNIX is natively secure. The slides emphasize that its primary goals were modularity and efficiency, and its main weakness stems from an open-source implementation yielding a less professional code base.

**6. Quiz**
1. Does UNIX have a unified security architecture?
2. Which Windows kernel-mode component is responsible for ACL verification?
3. Which Windows user-mode component contains the accounts database and password encryption?
4. What does the acronym SID stand for in Windows security?
5. State the mathematical difference between a UNIX UID and a Windows SID in terms of size/format.
6. What are the four components of a Windows Object Security Descriptor?
7. In Windows, is the ability to "shut down a system" considered a Privilege or an Access Right?
8. In Linux, what does the octal permission `644` translate to in text format?
9. What does the "Sticky flag" do when applied to a directory in Linux?
10. Name three security options that can be applied to the Linux `mount` command to restrict external file systems.
11. What is the difference between the `fork` and `vfork` commands in UNIX?
12. What is the fundamental difference between the *real* UID and the *effective* UID in a Linux process?
13. Which Linux password encryption method uses a 2-bit salt and encrypts a 64-bit string using a 56-bit key?
14. Which Linux logging file specifically stores kernel events, errors, and warnings?
15. What are the three primary design goals of UNIX (which took priority over security)?
16. Name three security features that are explicitly listed as "missing" in standard UNIX.
17. What Windows 10 security enhancement protects user credentials using hardware-based virtualization/isolation?
18. What Windows Access Right allows a user to change an object's DACL?
19. *Applied Question:* A Linux user creates a new file. The system's default permission for files is 666. If the administrator has set the system's `umask` to `033`, what will the final octal permission of the newly created file be?
20. *Applied Question:* A developer writes a new program. The system's default permission for programs is 777. If the `umask` is `027`, what will the final octal permission be, and what does this mean in plain English for the Owner, Group, and Others?

***

**Answers**
1. No! UNIX explicitly does not have a security architecture.
2. The Security Reference Monitor.
3. The Security Accounts Manager (SAM).
4. Security Identifier.
5. A UNIX UID is a fixed 16-bit number, whereas a Windows SID is a machine-generated code of varying length (e.g., S-1-5-18).
6. Owner SID, Primary Group SID, DACL, and SACL.
7. A Privilege.
8. `rw-r--r--` (Owner: read/write, Group: read-only, Others: read-only).
9. It ensures that only the owner of a file (or root) can remove files within that directory.
10. Any three of: `-r` (read-only), `-o nosuid`, `-o noexec`, or `-o nodev`.
11. `fork` spawns a new identical child process, whereas `vfork` is the same but memory is shared between the two processes.
12. The real UID is always inherited from the parent process, whereas the effective UID can be inherited from the parent OR from the owner of the executed file.
13. DES.
14. `/var/log/kern.log`.
15. Modularity, portability, and efficiency.
16. Any three of: ACLs in general, Data labeling, Mandatory access control, Capabilities, Standardized auditing.
17. Credential Guard.
18. `WRITE_DAC`.
19. The final octal permission will be `644`.
20. The final octal permission will be `750`. This means the Owner has read/write/execute access, the Group has read and execute access, and Others have no access.
