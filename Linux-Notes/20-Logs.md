# Linux Notes
# Chapter 20 - Logs in Linux

> **Level:** Beginner to Intermediate  
> **Estimated Reading Time:** 2–3 hours  
> **Practice Time:** 2–4 hours  

---

# Table of Contents

1. Why Logs are Important
2. What are Logs in Linux?
3. Types of Logs
4. Where Logs are Stored
5. Important Log Files in /var/log
6. Viewing Logs (cat, less, tail)
7. Real-Time Log Monitoring
8. journalctl (Systemd Logs)
9. Kernel Logs (dmesg)
10. Searching Logs (grep)
11. Log Levels
12. Authentication Logs
13. Application Logs
14. Log Rotation
15. Troubleshooting with Logs
16. Summary
17. Interview Questions
18. Practice Exercises
19. Mini Project

---

# Learning Objectives

After completing this chapter, you will understand:

- What Linux logs are and why they exist
- How to find and read system logs
- How to monitor logs in real time
- How to use `journalctl` and `dmesg`
- How to filter logs using `grep`
- How logging helps in debugging system issues

---

# 📖 Theory

In Linux, **logs are records of system events**. Every action happening inside the system is recorded somewhere.

Logs include:

- System startup messages
- User login attempts
- Service errors
- Kernel warnings
- Application events

Logs are the **first place Linux administrators check when something goes wrong**.

---

# 🧠 Concepts

## Why Linux uses logs?

Linux is designed to be:

- Transparent
- Debuggable
- Stable
- Secure

So it records everything happening inside the system.

---

## Types of Logs

| Type | Description |
|------|-------------|
| System Logs | General system activity |
| Kernel Logs | Hardware + kernel messages |
| Authentication Logs | Login/logout events |
| Application Logs | App-specific logs |
| Boot Logs | Startup process logs |

---

# 🖥️ Where Logs are Stored

Most logs are stored in:

```bash
/var/log/
```

---

# 📌 Important Log Files

| File | Purpose |
|------|--------|
| /var/log/syslog | General system logs |
| /var/log/auth.log | Authentication logs |
| /var/log/kern.log | Kernel logs |
| /var/log/boot.log | Boot messages |
| /var/log/dpkg.log | Package installation logs |

---

# 📌 Viewing Logs

## View full log file

```bash
cat /var/log/syslog
```

---

## View with scrolling

```bash
less /var/log/syslog
```

---

## View last lines

```bash
tail /var/log/syslog
```

---

## Follow logs in real-time

```bash
tail -f /var/log/syslog
```

---

# 📌 Real-Time Monitoring

## System logs live

```bash
journalctl -f
```

---

## File logs live

```bash
tail -f /var/log/syslog
```

---

# ⚙️ journalctl (Systemd Logs)

Modern Linux systems use **systemd journal**.

---

## View all logs

```bash
journalctl
```

---

## View latest logs

```bash
journalctl -xe
```

---

## View logs for current boot

```bash
journalctl -b
```

---

## View logs for a service

```bash
journalctl -u ssh
```

---

## View last N logs

```bash
journalctl -n 50
```

---

## View logs by time

```bash
journalctl --since "1 hour ago"
```

---

# 🧩 Kernel Logs (dmesg)

Kernel logs show hardware and system-level messages.

---

## View kernel logs

```bash
dmesg
```

---

## Filter kernel logs

```bash
dmesg | grep usb
```

---

# 🔍 Searching Logs

## Basic search

```bash
grep "error" /var/log/syslog
```

---

## Case-insensitive search

```bash
grep -i "fail" /var/log/syslog
```

---

## Context search

```bash
grep -C 2 "error" /var/log/syslog
```

---

# 📌 Log Levels

| Level | Meaning |
|------|--------|
| emerg | System unusable |
| alert | Immediate action |
| crit | Critical issue |
| err | Error |
| warning | Warning |
| info | Information |
| debug | Debug details |

---

# 🔐 Authentication Logs

## View login logs

```bash
cat /var/log/auth.log
```

---

## Failed login attempts

```bash
grep "Failed password" /var/log/auth.log
```

---

## Successful logins

```bash
grep "Accepted password" /var/log/auth.log
```

---

# 📦 Application Logs

Examples:

- Nginx → `/var/log/nginx/`
- Apache → `/var/log/apache2/`
- MySQL → `/var/log/mysql/`

---

# 🔄 Log Rotation

Logs grow continuously, so Linux rotates them.

---

## Config file

```bash
/etc/logrotate.conf
```

---

## Example rotation flow

```
syslog → syslog.1 → syslog.2.gz
```

---

## Why log rotation?

- Prevent disk full issues
- Compress old logs
- Improve performance
- Organize logs efficiently

---

# ⚠️ Common Mistakes

- Ignoring logs during debugging
- Not using `grep` for filtering
- Forgetting logs are in `/var/log`
- Using `cat` on huge log files
- Not using `journalctl` on modern systems

---

# 💡 Pro Tips

- Always check logs first when debugging
- Use `journalctl -xe` for quick error analysis
- Use `tail -f` for live debugging
- Combine `grep + tail` for filtering
- Learn `/var/log/auth.log` for security issues

---

# 🎯 Practice Exercises

1. List all files in `/var/log`
2. View `syslog`
3. Use `tail` on logs
4. Use `tail -f`
5. Search logs using `grep`
6. Find failed login attempts
7. Use `journalctl -xe`
8. View boot logs
9. Use `dmesg`
10. Filter kernel logs

---

# 🧩 Mini Project

## Log Monitoring Tool

Create a file:

```bash
log_monitor.sh
```

---

### Script

```bash
#!/bin/bash

echo "===== Linux Log Monitor ====="

echo ""
echo "Last 20 system logs:"
journalctl -n 20

echo ""
echo "Recent errors:"
journalctl -p err -n 10

echo ""
echo "Authentication failures:"
grep "Failed password" /var/log/auth.log
```

---

### Make executable

```bash
chmod +x log_monitor.sh
```

---

### Run

```bash
./log_monitor.sh
```

---

# ❓ Interview Questions

### Beginner

1. What are logs in Linux?
2. Where are logs stored?
3. What is `/var/log`?

---

### Intermediate

4. What is journalctl?
5. Difference between syslog and journalctl?
6. What is dmesg used for?

---

### Advanced

7. How does log rotation work?
8. How do you debug a system using logs?
9. What is the importance of authentication logs?
10. How do logs help in security analysis?

---

# 📝 Summary

- Logs record system events
- Stored in `/var/log`
- `journalctl` is modern logging tool
- `dmesg` shows kernel logs
- `grep` helps filter logs
- `tail -f` is used for real-time monitoring
- Log rotation prevents disk overflow

---

# 📚 Further Reading

- `man journalctl`
- `man dmesg`
- systemd logging documentation
- logrotate configuration guide
- Linux system administration basics
