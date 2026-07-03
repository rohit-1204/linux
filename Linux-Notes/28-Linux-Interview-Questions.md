# Linux Notes
# Chapter 29 - Linux Interview Questions

> **Level:** Beginner to Advanced  
> **Estimated Reading Time:** 2–3 hours  
> **Practice Time:** 3–6 hours  

---

# Table of Contents

1. Why Linux Interviews Matter
2. Basic Level Questions
3. Intermediate Level Questions
4. Advanced Level Questions
5. Scenario-Based Questions
6. Command-Based Questions
7. Troubleshooting Questions
8. System Administration Questions
9. Networking Questions
10. Security Questions
11. Docker & DevOps Questions
12. Scenario Practice Sets
13. Common Mistakes in Interviews
14. Pro Tips for Interviews
15. Summary

---

# Learning Objectives

After completing this chapter, you will:

- Understand common Linux interview questions
- Learn how to answer confidently
- Practice real-world scenarios
- Improve troubleshooting thinking
- Prepare for DevOps/Linux roles

---

# 📖 Why Linux Interviews Matter

Linux is widely used in:

- DevOps
- Cloud computing
- System administration
- Backend engineering

Interviewers focus on:

- Command knowledge
- Problem-solving ability
- System understanding

---

# 🟢 Basic Level Questions

## 1. What is Linux?

Linux is an open-source operating system kernel used to manage hardware and software resources.

---

## 2. Linux vs UNIX?

| Linux | UNIX |
|------|------|
| Open source | Proprietary |
| Free | Licensed |
| Community-driven | Vendor-controlled |

---

## 3. What is a shell?

A shell is a command interpreter between user and kernel.

---

## 4. What is a kernel?

The kernel is the core of the operating system that manages hardware.

---

## 5. What is root user?

Root is the superuser with full system access.

---

# 🟡 Intermediate Level Questions

## 6. What is a process?

A process is a running instance of a program.

---

## 7. Process vs Thread?

| Process | Thread |
|--------|--------|
| Independent memory | Shared memory |
| Heavyweight | Lightweight |

---

## 8. What is inode?

An inode stores metadata about a file (permissions, size, location).

---

## 9. What is swap space?

Disk space used as virtual memory when RAM is full.

---

## 10. What is a daemon?

A background service process.

---

# 🔵 Advanced Level Questions

## 11. Explain Linux boot process

BIOS/UEFI → Bootloader → Kernel → systemd → Services

---

## 12. What is systemd?

A system and service manager used to start and manage services.

---

## 13. What is load average?

System workload over 1, 5, and 15 minutes.

---

## 14. Zombie process?

A process that has finished execution but still has an entry in the process table.

---

## 15. How does Linux handle memory?

Using RAM + swap + caching + virtual memory management.

---

# 🧩 Scenario-Based Questions

## 16. System is slow. What do you check?

- CPU → `top`
- Memory → `free -h`
- Disk → `df -h`
- Processes → `ps aux`
- Logs → `journalctl`

---

## 17. Disk is full. How do you find large files?

```bash
du -ah / | sort -n | tail
```

---

## 18. Service is not working. What do you do?

```bash
systemctl status service
systemctl restart service
journalctl -xe
```

---

## 19. User cannot login. Debug steps?

- Check `/etc/passwd`
- Check `/var/log/auth.log`
- Check SSH config
- Verify permissions

---

## 20. High CPU usage process?

```bash
top
ps aux --sort=-%cpu
```

---

# ⚙️ Command-Based Questions

## 21. List processes

```bash
ps aux
```

---

## 22. Kill process

```bash
kill -9 PID
```

---

## 23. Disk usage

```bash
df -h
```

---

## 24. Memory usage

```bash
free -h
```

---

## 25. Search in file

```bash
grep "error" file.txt
```

---

# 🔐 Security Questions

## 26. What is chmod?

Command to change file permissions.

---

## 27. What is sudo?

Runs commands with elevated privileges.

---

## 28. How to secure SSH?

- Use SSH keys
- Disable root login
- Use firewall
- Change default port

---

## 29. What is firewall?

A system that controls incoming and outgoing network traffic.

---

## 30. What is encryption?

Process of converting data into unreadable format for security.

---

# ☁️ Docker & DevOps Questions

## 31. What is Docker?

A platform for running applications in containers.

---

## 32. Image vs Container?

| Image | Container |
|------|-----------|
| Blueprint | Running instance |

---

## 33. Why Docker?

- Portability
- Fast deployment
- Isolation
- Scalability

---

## 34. What is Kubernetes?

A container orchestration platform.

---

## 35. What is CI/CD?

Continuous Integration and Continuous Deployment.

---

# 🧪 Scenario Practice Sets

## Set 1

- Explain Linux boot process
- What is kernel?
- Difference between process and thread

---

## Set 2

- How to debug a slow system?
- What is systemd?
- How to check logs?

---

## Set 3

- How to secure a Linux server?
- How does Docker work?
- What is load average?

---

# ⚠️ Common Mistakes

- Only giving theory without examples
- Not mentioning commands
- Ignoring logs
- Weak troubleshooting answers
- Not practicing Linux commands

---

# 💡 Pro Tips

- Always give command examples
- Explain step-by-step
- Use real-world scenarios
- Mention logs when relevant
- Stay confident and structured

---

# 🧠 Interview Answer Format

✔ Definition  
✔ Explanation  
✔ Command Example  
✔ Real-world use case  

---

# 📝 Summary

- Linux interviews are practical
- Commands matter more than theory
- Scenario-based questions are important
- Troubleshooting is key
- DevOps tools are often included

---

# 📚 Further Reading

- Linux Command Handbook
- systemd documentation
- Bash scripting guide
- Docker official documentation
- Linux man pages
