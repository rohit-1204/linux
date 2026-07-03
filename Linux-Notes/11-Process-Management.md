# 11 - Process Management

## Learning Objectives

After completing this chapter, you will be able to:

- Understand what a process is
- View running processes
- Monitor system performance
- Manage foreground and background processes
- Kill and terminate processes
- Change process priority
- Understand process states
- Work with jobs in the shell

---

## What is a Process?

A **process** is a running instance of a program.

For example:

- Opening Firefox creates a Firefox process.
- Running `ls` creates an `ls` process.
- Running a shell script creates a shell process.

Every process has a unique **Process ID (PID)** assigned by the Linux kernel.

Example:

```
Program
   │
   ▼
Executed
   │
   ▼
Running Process (PID)
```

---

## Process Lifecycle

```
New
 │
 ▼
Ready
 │
 ▼
Running
 │
 ├─────────────┐
 ▼             ▼
Waiting     Terminated
```

---

## Process Types

### User Processes

Started by users.

Examples:

- Firefox
- VS Code
- Bash

---

### System Processes

Started by the Linux kernel during boot.

Examples:

- systemd
- sshd
- cron

---

### Daemon Processes

Background services that run continuously.

Examples:

- nginx
- mysql
- docker
- sshd

---

# ps Command

Displays information about running processes.

---

## Syntax

```bash
ps [options]
```

---

## Example

```bash
ps
```

Output:

```text
 PID TTY          TIME CMD
 1200 pts/0    00:00:00 bash
 1215 pts/0    00:00:00 ps
```

---

## Show All Processes

```bash
ps -e
```

or

```bash
ps -A
```

---

## Detailed Output

```bash
ps -ef
```

---

## BSD Style Output

```bash
ps aux
```

Example:

```text
USER   PID %CPU %MEM COMMAND
root     1  0.1  0.5 systemd
```

---

# top Command

Displays real-time system processes.

---

## Syntax

```bash
top
```

---

## Example

```bash
top
```

Shows:

- CPU usage
- Memory usage
- Running processes
- Load average

Exit using:

```
q
```

---

# htop Command

Improved version of `top`.

---

## Install

Ubuntu/Debian

```bash
sudo apt install htop
```

RHEL/CentOS

```bash
sudo dnf install htop
```

---

## Run

```bash
htop
```

Features:

- Colorful interface
- Mouse support
- Easy process management

---

# pgrep Command

Find process IDs by process name.

---

## Syntax

```bash
pgrep process_name
```

---

## Example

```bash
pgrep sshd
```

Output:

```
945
```

---

# pidof Command

Displays the PID of a running program.

---

## Syntax

```bash
pidof program
```

---

## Example

```bash
pidof bash
```

---

# kill Command

Terminates a process using its PID.

---

## Syntax

```bash
kill PID
```

---

## Example

```bash
kill 2456
```

---

# Common Kill Signals

| Signal | Number | Description |
|---------|--------|-------------|
| SIGTERM | 15 | Gracefully terminate |
| SIGKILL | 9 | Force kill |
| SIGHUP | 1 | Reload configuration |
| SIGSTOP | 19 | Pause process |
| SIGCONT | 18 | Resume process |

---

## Force Kill

```bash
kill -9 PID
```

---

# killall Command

Kills processes by name.

---

## Syntax

```bash
killall process_name
```

---

## Example

```bash
killall firefox
```

---

# pkill Command

Kill processes by matching process names.

---

## Syntax

```bash
pkill process_name
```

---

## Example

```bash
pkill nginx
```

---

# Process Priority

Linux schedules processes using priority values.

Lower priority number = Higher priority.

---

# nice Command

Starts a process with a specified priority.

---

## Syntax

```bash
nice -n value command
```

---

## Example

```bash
nice -n 10 python script.py
```

---

# renice Command

Changes the priority of an existing process.

---

## Syntax

```bash
renice priority PID
```

---

## Example

```bash
renice 5 2456
```

---

# Background Processes

Run a command in the background.

---

## Syntax

```bash
command &
```

---

## Example

```bash
sleep 100 &
```

Output:

```
[1] 2034
```

---

# Foreground Processes

Bring a background process back.

---

## Syntax

```bash
fg
```

---

## Example

```bash
fg %1
```

---

# jobs Command

Lists background jobs.

---

## Syntax

```bash
jobs
```

---

## Example

```bash
jobs
```

Output:

```
[1]+ Running sleep 100 &
```

---

# Suspend a Process

Press

```
Ctrl + Z
```

Moves the running process to the background (stopped).

---

# Continue Background Process

```bash
bg
```

---

# Continue Foreground Process

```bash
fg
```

---

# Process States

| State | Meaning |
|--------|----------|
| R | Running |
| S | Sleeping |
| D | Uninterruptible Sleep |
| T | Stopped |
| Z | Zombie |

---

# View Process Tree

```bash
pstree
```

Example:

```text
systemd
 ├── NetworkManager
 ├── sshd
 └── bash
```

---

# Monitor CPU Usage

```bash
top
```

or

```bash
htop
```

---

# Monitor Memory Usage

```bash
free -h
```

---

# Common Mistakes

- Killing the wrong PID
- Using `kill -9` unnecessarily
- Forgetting background jobs
- Running CPU-intensive processes with high priority
- Ignoring zombie processes

---

# Pro Tips

- Use `top` for quick monitoring
- Prefer `SIGTERM` before `SIGKILL`
- Use `pgrep` instead of manually searching PIDs
- Use `htop` for interactive management
- Use `jobs` to manage background tasks

---

# Practice Exercises

1. View running processes using `ps`
2. Display all processes
3. Monitor processes with `top`
4. Install and use `htop`
5. Run a process in the background
6. Bring it back to the foreground
7. Kill a process using PID
8. Kill a process using its name
9. Change process priority
10. Display the process tree

---

# Mini Project

## Process Monitoring Lab

### Step 1

Run a background process.

```bash
sleep 300 &
```

### Step 2

Find its PID.

```bash
pgrep sleep
```

### Step 3

View it.

```bash
ps -ef | grep sleep
```

### Step 4

Change its priority.

```bash
renice 10 PID
```

### Step 5

Terminate it.

```bash
kill PID
```

### Step 6

Verify it is no longer running.

```bash
ps -ef | grep sleep
```

---

# Interview Questions

1. What is a process?
2. What is PID?
3. Difference between a process and a program?
4. Difference between `ps` and `top`?
5. What is `htop`?
6. Difference between `kill`, `killall`, and `pkill`?
7. What does `kill -9` do?
8. What are process states?
9. What is a zombie process?
10. Difference between foreground and background processes?
11. What does `nice` do?
12. What is `renice`?
13. What is the purpose of the `jobs` command?
14. How do you suspend a running process?
15. How do you resume a suspended process?

---

# Summary

- Process = Running program
- PID = Process ID
- `ps` → View processes
- `top` → Real-time monitoring
- `htop` → Interactive process viewer
- `kill` → Terminate process by PID
- `killall` → Kill by process name
- `pkill` → Kill matching processes
- `nice` → Start process with priority
- `renice` → Change process priority
- `jobs` → View background jobs
- `fg` → Bring process to foreground
- `bg` → Resume process in background

---

# Further Reading

- `man ps`
- `man top`
- `man htop`
- `man kill`
- `man nice`
- `man renice`
- `man jobs`
- Linux Process Management Documentation
- GNU Core Utilities Documentation
