# Linux Notes
# Chapter 31 - Linux Cheat Sheet

> **Level:** Beginner → Advanced  
> **Quick Reference Guide**

---

# 📖 What is this Cheat Sheet?

This chapter is a **quick revision guide** for Linux commands, concepts, and shortcuts.

Use it for:

- Interviews
- Quick revision
- Daily terminal work
- Exams
- DevOps tasks

---

# 🧠 File & Directory Commands

## Navigation

```bash
pwd              # current directory
ls               # list files
ls -l            # long format
ls -a            # hidden files
cd folder        # change directory
cd ..            # move up
cd ~             # home directory
```

---

## File Operations

```bash
touch file.txt
cat file.txt
less file.txt
cp file1 file2
mv file1 file2
rm file.txt
mkdir dir
rmdir dir
rm -r dir
```

---

# 📂 File Permissions

```bash
chmod 755 file
chmod 644 file
chown user file
chgrp group file
ls -l
```

---

# 🔍 Search Commands

```bash
grep "text" file
find /path -name file
locate file
```

---

# ⚙️ Process Management

```bash
ps aux
top
htop
kill PID
kill -9 PID
jobs
fg
bg
```

---

# 💾 Disk & Memory

```bash
df -h
du -sh folder
free -h
uptime
```

---

# 🌐 Networking

```bash
ip a
ping google.com
curl url
wget url
netstat -tulnp
ss -tuln
```

---

# 📦 Package Management (Ubuntu/Debian)

```bash
apt update
apt upgrade
apt install package
apt remove package
dpkg -l
```

---

# 🔐 User Management

```bash
whoami
id
adduser name
deluser name
passwd
groups
```

---

# ⚙️ System Control

```bash
systemctl start service
systemctl stop service
systemctl restart service
systemctl status service
systemctl enable service
```

---

# 📜 Logs

```bash
journalctl
journalctl -f
dmesg
cat /var/log/syslog
```

---

# 🧵 Compression

```bash
tar -cvf file.tar folder
tar -xvf file.tar
tar -czvf file.tar.gz folder
gzip file
gunzip file.gz
```

---

# 🔁 Pipes & Redirection

```bash
command > file
command >> file
command < file
command1 | command2
tee file
```

---

# 🧑‍💻 Bash Scripting

```bash
#!/bin/bash
echo "Hello Linux"
```

Run:

```bash
bash script.sh
```

---

# 🐳 Docker Quick Commands

```bash
docker run ubuntu
docker ps
docker ps -a
docker images
docker pull nginx
docker stop container
docker rm container
```

---

# 🔐 SSH Commands

```bash
ssh user@host
ssh-keygen
ssh-copy-id user@host
```

---

# ⏱️ Cron Jobs

```bash
crontab -e
crontab -l
```

---

# ⚡ Keyboard Shortcuts

```text
Ctrl + C   Stop process
Ctrl + Z   Suspend process
Ctrl + D   Exit terminal
Ctrl + L   Clear screen
Ctrl + R   Search history
Tab        Auto-complete
↑ / ↓      History navigation
```

---

# 🧠 Important Concepts

## Linux is:

- Multi-user
- Multi-tasking
- Secure
- Open source

---

## Everything is a file:

- Devices
- Processes
- Folders
- Logs

---

# 🧩 One-Line Commands

```bash
ps aux | grep nginx
du -sh *
find . -name "*.log"
cat file | grep error
history | tail
```

---

# ⚠️ Dangerous Commands

```bash
rm -rf /
chmod 777 /
mkfs.ext4 /dev/sda
```

⚠️ NEVER run without understanding

---

# 💡 Pro Tips

- Use `tab` always
- Learn `grep`, `find`, `awk`
- Use `man` pages
- Avoid root unless necessary
- Read logs first when debugging

---

# 🧪 Interview Quick Answers

## What is Linux?
Open-source OS kernel.

## What is shell?
Command interpreter.

## What is process?
Running program.

## What is inode?
File metadata storage.

## What is sudo?
Admin privileges command.

---

# 📝 Summary

- Most used Linux commands
- Covers file, system, networking, Docker
- Includes shortcuts
- Useful for interviews and daily work
- Quick revision guide

---

# 📚 Further Reading

- `man bash`
- `man systemctl`
- Linux Command Line Bible
- Advanced Bash Scripting Guide
