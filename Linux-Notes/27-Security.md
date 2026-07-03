# Linux Notes
# Chapter 27 - Linux Security

> **Level:** Intermediate to Advanced  
> **Estimated Reading Time:** 3–4 hours  
> **Practice Time:** 4–6 hours  

---

# Table of Contents

1. What is Linux Security?
2. Security Principles in Linux
3. Users and Privilege Separation
4. Root User and sudo
5. File Permissions Security Model
6. SSH Security Basics
7. Firewall Basics (ufw)
8. Password Security
9. File System Security
10. Process Security
11. Network Security Basics
12. Logs and Security Monitoring
13. Malware and Threat Awareness
14. System Hardening Basics
15. Updates and Patch Management
16. SELinux and AppArmor Overview
17. Encryption Basics
18. Backup Security
19. Common Attacks
20. Best Practices
21. Summary
22. Interview Questions
23. Practice Exercises
24. Mini Project

---

# Learning Objectives

After completing this chapter, you will understand:

- Core Linux security concepts
- How permissions protect the system
- How to secure SSH and users
- How to use firewalls in Linux
- How to harden a Linux system
- How to detect basic security issues

---

# 📖 Theory

Linux security is built around:

- Users
- Permissions
- Processes
- Network control
- System policies

Linux is secure by design because it follows the principle of **least privilege**.

---

# 🧠 Concepts

## Principle of Least Privilege

Every user and process gets only the permissions they need.

---

## Defense in Depth

Multiple layers of security:

- User level
- File level
- Network level
- System level

---

# 👤 Users and Privilege Separation

## View users

```bash
cat /etc/passwd
```

---

## Root user

- Full system access
- Can delete everything
- Should be used carefully

---

## sudo

Run commands as admin:

```bash
sudo apt update
```

---

## Why sudo is safer than root?

- Logs actions
- Temporary privilege escalation
- Reduces accidental damage

---

# 🔐 File Permission Security

## View permissions

```bash
ls -l
```

---

## Example:

```
-rwxr-xr--
```

| Part | Meaning |
|------|--------|
| r | read |
| w | write |
| x | execute |

---

## Dangerous permission

```bash
chmod 777 file.sh
```

⚠️ Gives full access to everyone

---

# 🔑 SSH Security

## Connect via SSH

```bash
ssh user@server_ip
```

---

## Key-based authentication (recommended)

Generate key:

```bash
ssh-keygen
```

Copy key:

```bash
ssh-copy-id user@server
```

---

## Disable password login (secure servers)

Edit:

```bash
/etc/ssh/sshd_config
```

Set:

```
PasswordAuthentication no
```

---

# 🔥 Firewall (ufw)

## Enable firewall

```bash
sudo ufw enable
```

---

## Allow SSH

```bash
sudo ufw allow ssh
```

---

## Allow port

```bash
sudo ufw allow 80
```

---

## Check status

```bash
sudo ufw status
```

---

# 🔐 Password Security

## Rules:

- Minimum 12 characters
- Use symbols
- Avoid dictionary words
- Change regularly

---

## Change password

```bash
passwd
```

---

# 📂 File System Security

## Sensitive directories

- /etc
- /var
- /root
- /home

---

## Protect files

```bash
chmod 600 file.txt
```

---

## Ownership control

```bash
chown root:root file.txt
```

---

# ⚙️ Process Security

## View processes

```bash
ps aux
```

---

## Kill suspicious process

```bash
kill -9 PID
```

---

## Prevent high CPU abuse

Use:

```bash
nice
renice
```

---

# 🌐 Network Security

## Check open ports

```bash
netstat -tulnp
```

---

## Active connections

```bash
ss -tuln
```

---

# 📜 Logs and Monitoring

## View auth logs

```bash
cat /var/log/auth.log
```

---

## Live logs

```bash
journalctl -f
```

---

## Failed login attempts

```bash
grep "Failed password" /var/log/auth.log
```

---

# 🦠 Malware Awareness

Linux is less prone but still vulnerable:

- Suspicious scripts
- Rootkits
- Unauthorized SSH access

---

# 🛡️ System Hardening

## Disable root login

```bash
PermitRootLogin no
```

---

## Remove unused services

```bash
systemctl disable service_name
```

---

## Keep system updated

```bash
sudo apt update && sudo apt upgrade
```

---

# 🔄 Updates & Patching

Security updates fix vulnerabilities.

```bash
sudo apt update
sudo apt upgrade
```

---

# 🔐 Encryption Basics

## File encryption

```bash
gpg -c file.txt
```

---

## Disk encryption

- LUKS (Linux Unified Key Setup)

---

# 💾 Backup Security

- Store backups securely
- Encrypt backups
- Use remote storage

---

# ⚠️ Common Attacks

- Brute force SSH
- Malware scripts
- Privilege escalation
- Open ports exploitation
- Weak passwords

---

# 🧯 Best Practices

✔ Use SSH keys  
✔ Disable root login  
✔ Enable firewall  
✔ Keep system updated  
✔ Use strong passwords  
✔ Monitor logs regularly  
✔ Limit open ports  

---

# 🎯 Practice Exercises

1. Create a new user with limited permissions
2. Configure SSH key login
3. Enable ufw firewall
4. Block a port using firewall
5. Check failed login attempts
6. Change file permissions securely
7. Disable root SSH login
8. Monitor open ports
9. Kill suspicious process
10. Update system packages

---

# 🧩 Mini Project

## Basic Security Hardening Script

Create:

```bash
security_hardening.sh
```

---

### Script:

```bash
#!/bin/bash

echo "=== SECURITY REPORT ==="

echo ""
echo "FAILED LOGIN ATTEMPTS:"
grep "Failed password" /var/log/auth.log | tail -10

echo ""
echo "OPEN PORTS:"
ss -tuln

echo ""
echo "RUNNING USERS:"
who

echo ""
echo "UPDATES AVAILABLE:"
apt list --upgradable 2>/dev/null | head -10
```

---

### Make executable:

```bash
chmod +x security_hardening.sh
```

---

### Run:

```bash
./security_hardening.sh
```

---

# ❓ Interview Questions

### Beginner

1. What is Linux security?
2. Why is Linux considered secure?

---

### Intermediate

3. What is sudo?
4. What is SSH key authentication?
5. What is file permission security?

---

### Advanced

6. What is system hardening?
7. How does firewall protect Linux?
8. What is privilege escalation?
9. How do you secure SSH?
10. What is least privilege principle?

---

# 📝 Summary

- Linux security is layered
- Users and permissions are key
- SSH should use keys
- Firewall controls access
- Logs help detect attacks
- System hardening improves safety
- Updates fix vulnerabilities

---

# 📚 Further Reading

- `man ssh`
- `man ufw`
- Linux Security Guide (LSG)
- OpenSSH documentation
- CIS Linux Benchmark
