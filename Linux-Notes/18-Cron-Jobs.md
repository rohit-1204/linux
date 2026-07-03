# 18 - Cron Jobs in Linux

## Learning Objectives

After completing this chapter, you will be able to:

- Understand what cron jobs are
- Schedule tasks automatically in Linux
- Use `crontab` command
- Write cron expressions
- Manage scheduled jobs
- Debug cron execution issues
- Automate system tasks like backups and scripts

---

# 📖 Theory

A **cron job** is a scheduled task in Linux that runs automatically at specified time intervals.

It is used for:

- Automating backups
- Running scripts periodically
- Cleaning logs
- System maintenance tasks
- Monitoring tasks

---

# 🧠 Concepts

## What is cron?

- A background service (daemon)
- Runs scheduled commands
- Controlled using `crontab`

---

## Cron System Flow

```
User defines schedule
        │
        ▼
crontab file saved
        │
        ▼
cron daemon checks schedule
        │
        ▼
Executes task automatically
```

---

# 🖥️ crontab Command

Used to create and manage cron jobs.

---

## Edit cron jobs

```bash
crontab -e
```

---

## List cron jobs

```bash
crontab -l
```

---

## Remove all cron jobs

```bash
crontab -r
```

---

# 📌 Cron Syntax

```
* * * * * command
│ │ │ │ │
│ │ │ │ └── Day of week (0-7)
│ │ │ └──── Month (1-12)
│ │ └────── Day of month (1-31)
│ └──────── Hour (0-23)
└────────── Minute (0-59)
```

---

# ⏰ Common Time Patterns

| Schedule | Expression |
|----------|------------|
| Every minute | * * * * * |
| Every hour | 0 * * * * |
| Daily at midnight | 0 0 * * * |
| Every day at 5 AM | 0 5 * * * |
| Every Sunday | 0 0 * * 0 |

---

# ✅ Examples

---

## Run script every minute

```bash
* * * * * /home/user/script.sh
```

---

## Run daily at 2 AM

```bash
0 2 * * * /home/user/backup.sh
```

---

## Run every 5 minutes

```bash
*/5 * * * * /home/user/script.sh
```

---

## Run every Sunday at midnight

```bash
0 0 * * 0 /home/user/weekly.sh
```

---

# 📁 Example Script

```bash
#!/bin/bash

echo "Backup running at $(date)" >> /home/user/backup.log
```

---

# ⚙️ Where Cron Jobs are Stored

User cron jobs:

```bash
/var/spool/cron/crontabs/
```

System-wide cron:

```bash
/etc/crontab
```

---

# 🧪 System Cron Directories

| Directory | Purpose |
|----------|--------|
| /etc/cron.hourly | Every hour |
| /etc/cron.daily | Every day |
| /etc/cron.weekly | Weekly tasks |
| /etc/cron.monthly | Monthly tasks |

---

# 📊 View Cron Service

```bash
systemctl status cron
```

---

## Start cron service

```bash
sudo systemctl start cron
```

---

## Enable cron at boot

```bash
sudo systemctl enable cron
```

---

# 📌 Redirect Output

Cron does not show output unless redirected.

---

## Example with logging

```bash
* * * * * /home/user/script.sh >> /home/user/log.txt 2>&1
```

---

# ⚠️ Common Mistakes

- Wrong cron syntax
- Forgetting full file path in commands
- Script not executable (`chmod +x`)
- Not using absolute paths
- Forgetting environment variables are limited in cron

---

# 💡 Pro Tips

- Always use full path in scripts
- Redirect output to log files
- Test script manually before adding to cron
- Use `crontab -l` to verify jobs
- Use `/etc/cron.daily` for system tasks

---

# 🎯 Practice Exercises

1. Schedule a script to run every minute
2. Run a command every 5 minutes
3. Create a daily backup cron job
4. Log system date every hour
5. Schedule a script at boot time
6. List all cron jobs
7. Remove a cron job
8. Redirect output to a file
9. Schedule weekly cleanup task
10. Debug a failing cron job

---

# 🧩 Mini Project

## Automated Backup System

### Step 1: Create backup script

```bash
#!/bin/bash

tar -czvf /home/user/backup-$(date +%F).tar.gz /home/user/Documents
```

---

### Step 2: Make it executable

```bash
chmod +x backup.sh
```

---

### Step 3: Add to cron

```bash
crontab -e
```

---

### Step 4: Schedule daily backup at 1 AM

```bash
0 1 * * * /home/user/backup.sh >> /home/user/backup.log 2>&1
```

---

# ❓ Interview Questions

1. What is cron in Linux?
2. What is crontab used for?
3. Explain cron syntax.
4. Difference between cron and systemd timers?
5. How do you list cron jobs?
6. Where are cron jobs stored?
7. How do you debug cron jobs?
8. What is a daemon?
9. Why do cron jobs fail sometimes?
10. How do you schedule a job every 10 minutes?

---

# 📝 Summary

- Cron = task scheduler in Linux
- `crontab -e` → edit jobs
- `crontab -l` → list jobs
- 5-field syntax controls timing
- Use absolute paths in scripts
- Logs should be redirected
- Runs automatically in background

---

# 📚 Further Reading

- `man crontab`
- `man cron`
- systemd timers documentation
- Linux scheduling guides
