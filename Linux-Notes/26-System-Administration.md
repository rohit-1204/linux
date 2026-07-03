# Linux Notes
# Chapter 26 - System Administration in Linux

> **Level:** Intermediate to Advanced  
> **Estimated Reading Time:** 3–5 hours  
> **Practice Time:** 5–8 hours  

---

# Table of Contents

1. What is System Administration?
2. Roles of a Linux System Administrator
3. User Management Overview
4. Group Management Overview
5. File Permissions and Ownership
6. Service Management Basics
7. System Boot Process Overview
8. Log Management Basics
9. Backup and Recovery Basics
10. Security Basics
11. Monitoring System Health
12. Package Management Overview
13. Network Administration Basics
14. Disk and Storage Management
15. Performance Tuning Basics
16. Automation Basics
17. Common Admin Tools
18. Troubleshooting Methodology
19. Best Practices
20. Summary
21. Interview Questions
22. Practice Exercises
23. Mini Project

---

# Learning Objectives

After completing this chapter, you will understand:

- What a Linux system administrator does
- Core system administration tasks
- How to manage users, services, and permissions
- How to maintain system health and security
- How to troubleshoot Linux systems effectively

---

# 📖 Theory

System administration is the process of:

- Managing Linux systems
- Maintaining stability
- Ensuring security
- Monitoring performance
- Handling user and service operations

A Linux system administrator ensures that systems run **smoothly, securely, and efficiently**.

---

# 🧠 Concepts

## Key Responsibilities

- User & group management
- Service management
- Security enforcement
- System monitoring
- Package installation
- Backup management
- Network configuration
- Disk management

---

# 👤 User Management Overview

## View users

```bash
cat /etc/passwd
```

---

## Add user

```bash
sudo adduser john
```

---

## Delete user

```bash
sudo deluser john
```

---

## Modify user

```bash
sudo usermod -aG sudo john
```

---

# 👥 Group Management

## Create group

```bash
sudo groupadd devteam
```

---

## Add user to group

```bash
sudo usermod -aG devteam john
```

---

## View groups

```bash
groups john
```

---

# 🔐 File Permissions

## View permissions

```bash
ls -l
```

---

## Change permissions

```bash
chmod 755 file.sh
```

---

## Change ownership

```bash
sudo chown john:devteam file.txt
```

---

## Permission breakdown

| Value | Meaning |
|------|--------|
| 7 | Read + Write + Execute |
| 6 | Read + Write |
| 5 | Read + Execute |
| 4 | Read only |

---

# ⚙️ Service Management

## Start service

```bash
sudo systemctl start nginx
```

---

## Stop service

```bash
sudo systemctl stop nginx
```

---

## Enable service at boot

```bash
sudo systemctl enable nginx
```

---

## Check status

```bash
systemctl status nginx
```

---

# 🧠 Boot Process Overview

1. BIOS/UEFI
2. Bootloader (GRUB)
3. Kernel load
4. Init system (systemd)
5. Services start

---

# 📜 Log Management

## View logs

```bash
journalctl
```

---

## Live logs

```bash
journalctl -f
```

---

## System logs

```bash
cat /var/log/syslog
```

---

# 💾 Backup Basics

## Copy files

```bash
cp file.txt backup.txt
```

---

## Archive backup

```bash
tar -cvf backup.tar /home/user
```

---

## Compress backup

```bash
tar -czvf backup.tar.gz /home/user
```

---

# 🔐 Security Basics

- Use strong passwords
- Disable root login
- Use SSH keys
- Keep system updated
- Restrict file permissions

---

# 📊 Monitoring System

```bash
top
```

```bash
df -h
```

```bash
free -h
```

---

# 📦 Package Management

## Install package

```bash
sudo apt install nginx
```

---

## Update system

```bash
sudo apt update && sudo apt upgrade
```

---

## Remove package

```bash
sudo apt remove nginx
```

---

# 🌐 Networking Basics

## Check IP

```bash
ip a
```

---

## Ping host

```bash
ping google.com
```

---

## Check ports

```bash
netstat -tulnp
```

---

# 💽 Disk Management

## Check disk usage

```bash
df -h
```

---

## Check folder size

```bash
du -sh /home
```

---

# ⚡ Performance Tuning Basics

- Monitor CPU usage
- Clear unused services
- Optimize startup services
- Manage memory usage
- Clean logs regularly

---

# 🤖 Automation Basics

Example script:

```bash
#!/bin/bash

echo "System Report"
uptime
df -h
free -h
```

---

# 🧰 Common Admin Tools

- systemctl
- journalctl
- top
- htop
- ps
- df
- du
- ip
- chmod
- chown

---

# 🧯 Troubleshooting Methodology

1. Identify issue
2. Check logs
3. Check system resources
4. Verify services
5. Reproduce problem
6. Fix and document

---

# ⚠️ Common Mistakes

- Running commands as root unnecessarily
- Misusing chmod 777
- Ignoring logs
- Not monitoring disk usage
- Forgetting backups

---

# 💡 Pro Tips

- Always check logs first
- Use systemctl instead of service
- Automate repetitive tasks
- Use SSH keys instead of passwords
- Monitor disk usage regularly

---

# 🎯 Practice Exercises

1. Create a new user
2. Add user to group
3. Change file permissions
4. Start/stop a service
5. View system logs
6. Create a backup archive
7. Check system resources
8. Install a package
9. Check network IP
10. Write a simple admin script

---

# 🧩 Mini Project

## System Admin Toolkit Script

Create:

```bash
sysadmin_tool.sh
```

---

### Script:

```bash
#!/bin/bash

echo "===== SYSTEM ADMIN TOOL ====="

echo ""
echo "USERS:"
cut -d: -f1 /etc/passwd | head -10

echo ""
echo "DISK USAGE:"
df -h

echo ""
echo "MEMORY:"
free -h

echo ""
echo "RUNNING SERVICES:"
systemctl list-units --type=service --state=running | head -10
```

---

### Make executable:

```bash
chmod +x sysadmin_tool.sh
```

---

### Run:

```bash
./sysadmin_tool.sh
```

---

# ❓ Interview Questions

### Beginner

1. What is system administration?
2. What does a system admin do?

---

### Intermediate

3. What is systemctl?
4. Difference between user and group?
5. What are file permissions?

---

### Advanced

6. Explain Linux boot process
7. How do you troubleshoot a system?
8. What is journald?
9. How do you secure a Linux server?
10. What is system hardening?

---

# 📝 Summary

- System admin manages Linux systems
- Controls users, services, security
- Uses systemctl, logs, permissions
- Ensures system stability
- Automates tasks using scripts
- Monitors performance continuously

---

# 📚 Further Reading

- `man systemctl`
- Linux System Administration Guide
- Linux Security Best Practices
- Filesystem Hierarchy Standard (FHS)
