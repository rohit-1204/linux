# 17 - SSH (Secure Shell)

## Learning Objectives

After completing this chapter, you will be able to:

- Understand what SSH is and why it is used
- Connect to remote Linux systems securely
- Use SSH keys for authentication
- Transfer files using SCP and SFTP
- Configure SSH server basics
- Improve security for SSH access

---

# 📖 Theory

**SSH (Secure Shell)** is a protocol used to securely access remote systems over a network.

It is mainly used for:

- Remote server login
- System administration
- File transfer
- Running remote commands

Example:

```
Your Laptop → SSH → Remote Linux Server
```

---

# 🧠 Concepts

## Why SSH is Important?

Before SSH:

- Telnet was used (not secure)
- Passwords were sent in plain text

With SSH:

- Encrypted communication
- Secure authentication
- Safe remote access

---

## Default SSH Port

```
22
```

---

## SSH Architecture

```
Client (your machine)
        │
        ▼
Encrypted connection
        │
        ▼
Server (remote Linux machine)
```

---

# 🖥️ SSH Command

## Connect to remote server

### Syntax

```bash
ssh username@ip_address
```

---

### Example

```bash
ssh ubuntu@192.168.1.10
```

---

### First connection

You may see:

```
Are you sure you want to continue connecting? (yes/no)
```

Type:

```
yes
```

---

# 📌 SSH with Custom Port

```bash
ssh -p 2222 user@server_ip
```

---

# 📌 Run Command Remotely

```bash
ssh user@server_ip "ls -l"
```

---

# 🔐 SSH Key Authentication

Instead of passwords, SSH uses keys.

---

## Generate SSH Key

```bash
ssh-keygen
```

---

### Key files created:

```
~/.ssh/id_rsa       (private key)
~/.ssh/id_rsa.pub   (public key)
```

---

## Copy key to server

```bash
ssh-copy-id user@server_ip
```

---

## Login without password

```bash
ssh user@server_ip
```

---

# 📁 SCP (Secure Copy)

Used to copy files over SSH.

---

## Copy file to server

```bash
scp file.txt user@server_ip:/home/user/
```

---

## Copy file from server

```bash
scp user@server_ip:/home/user/file.txt .
```

---

## Copy directory

```bash
scp -r folder user@server_ip:/home/user/
```

---

# 📁 SFTP (Secure File Transfer)

Interactive file transfer tool.

---

## Connect

```bash
sftp user@server_ip
```

---

## Common commands inside SFTP

| Command | Action |
|--------|--------|
| ls | list files |
| cd | change directory |
| put | upload file |
| get | download file |
| exit | quit |

---

# ⚙️ SSH Configuration File

Located at:

```bash
/etc/ssh/sshd_config
```

---

## Example settings

```bash
Port 22
PermitRootLogin no
PasswordAuthentication yes
```

---

## Restart SSH service

```bash
sudo systemctl restart ssh
```

---

# 🔐 SSH Security Best Practices

- Disable root login
- Use SSH keys instead of passwords
- Change default port (optional)
- Use firewall rules
- Disable password authentication (advanced)

---

# 📊 Check SSH Service Status

```bash
systemctl status ssh
```

---

# 🧪 Test SSH Connection

```bash
ssh -v user@server_ip
```

Verbose mode helps debugging.

---

# ⚠️ Common Mistakes

- Wrong IP address
- Firewall blocking port 22
- Incorrect username
- Forgetting to start SSH service
- Not setting correct file permissions

---

# 💡 Pro Tips

- Always use SSH keys in production
- Use `ssh -v` for debugging
- Keep private key secure (`chmod 600`)
- Use aliases for frequent servers
- Use `scp` for quick transfers, `rsync` for large backups

---

# 🎯 Practice Exercises

1. Connect to localhost using SSH
2. Generate SSH key pair
3. Copy public key to server
4. Login without password
5. Transfer a file using SCP
6. Create SFTP session
7. Run remote command via SSH
8. Change SSH port (lab only)
9. Disable password authentication (lab)
10. Debug SSH connection using verbose mode

---

# 🧩 Mini Project

## Remote Server Access Setup

### Step 1

Generate SSH key:

```bash
ssh-keygen
```

---

### Step 2

Copy key to server:

```bash
ssh-copy-id user@server_ip
```

---

### Step 3

Login:

```bash
ssh user@server_ip
```

---

### Step 4

Transfer file:

```bash
scp test.txt user@server_ip:/tmp/
```

---

### Step 5

Run remote command:

```bash
ssh user@server_ip "uptime"
```

---

# ❓ Interview Questions

1. What is SSH?
2. Why is SSH secure?
3. What is default SSH port?
4. Difference between SSH and Telnet?
5. What is SSH key authentication?
6. What is SCP used for?
7. Difference between SCP and SFTP?
8. What is ssh-keygen?
9. Where are SSH keys stored?
10. How do you debug SSH issues?

---

# 📝 Summary

- SSH = Secure remote login protocol
- Uses encryption for secure communication
- Default port = 22
- `ssh` → connect remotely
- `scp` → copy files
- `sftp` → file transfer
- SSH keys provide passwordless login
- Config file: `/etc/ssh/sshd_config`

---

# 📚 Further Reading

- `man ssh`
- `man scp`
- OpenSSH official documentation
- SSH best practices guide
- Linux security hardening guide
