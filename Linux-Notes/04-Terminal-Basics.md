
# Linux Notes
# Chapter 04 - Terminal Basics (Part 1)

> Level: Beginner
> Reading Time: 45–60 Minutes
> Practice Time: 2–3 Hours

---

# Table of Contents

1. Introduction to the Terminal
2. Terminal vs Shell vs Console
3. What Happens When You Run a Command?
4. Opening the Terminal
5. Terminal Prompt
6. Command Structure
7. Your First Commands
8. Getting Help
9. Command History
10. Summary
11. Practice Lab
12. Interview Questions

---

# Learning Objectives

After completing this chapter, you will be able to:

- Understand what a terminal is.
- Differentiate between Terminal, Shell, and Console.
- Run basic Linux commands.
- Read the shell prompt.
- Understand command syntax.
- Use built-in help systems.

---

# What is a Terminal?

A **terminal** is a program that allows you to interact with the Linux operating system using text commands.

Think of it as a communication window between **you** and the **shell**.

```
+-----------------------+
|      Terminal         |
+-----------------------+
           |
           v
+-----------------------+
|        Shell          |
+-----------------------+
           |
           v
+-----------------------+
|     Linux Kernel      |
+-----------------------+
           |
           v
+-----------------------+
|      Hardware         |
+-----------------------+
```

The terminal itself does not execute commands. It sends your input to the shell.

---

# Terminal vs Shell vs Console

| Component | Description |
|----------|-------------|
| Terminal | Application where you type commands |
| Shell | Command interpreter (e.g., Bash) |
| Console | Physical or virtual system interface |

Example:

- **GNOME Terminal** → Terminal emulator
- **Bash** → Shell
- **TTY1** (`Ctrl+Alt+F3`) → Virtual console

---

# What Happens When You Run a Command?

Example:

```bash
ls
```

Execution flow:

```
You
 │
 ▼
Terminal
 │
 ▼
Bash Shell
 │
 ▼
Linux Kernel
 │
 ▼
Filesystem
 │
 ▼
Output Returned
```

The shell locates the executable, asks the kernel to run it, and prints the output back to the terminal.

---

# Opening the Terminal

### Ubuntu

Press:

```text
Ctrl + Alt + T
```

Or search for **Terminal** from the application menu.

---

# Understanding the Shell Prompt

Example:

```bash
student@ubuntu:~$
```

Meaning:

| Part | Description |
|------|-------------|
| student | Username |
| @ | Separator |
| ubuntu | Hostname |
| : | Separator |
| ~ | Home directory |
| $ | Regular user prompt |

If you see:

```bash
root@ubuntu:~#
```

The `#` indicates you are the **root** (administrator) user.

---

# Command Structure

General syntax:

```bash
command [options] [arguments]
```

Example:

```bash
ls -la /home
```

Breakdown:

- `ls` → Command
- `-la` → Options
- `/home` → Argument

---

# Your First Commands

Display current user:

```bash
whoami
```

Display hostname:

```bash
hostname
```

Display current date:

```bash
date
```

Display calendar:

```bash
cal
```

Clear the terminal:

```bash
clear
```

---

# Getting Help

Show command help:

```bash
ls --help
```

Open the manual page:

```bash
man ls
```

Navigate a man page:

- `Space` → Next page
- `b` → Previous page
- `/text` → Search
- `q` → Quit

---

# Summary

You learned:

- What a terminal is.
- Difference between terminal, shell, and console.
- How commands are executed.
- How to read the shell prompt.
- Command syntax.
- Basic information commands.
- Using `man` and `--help`.

---

# Practice Lab

1. Open the terminal.
2. Run:

```bash
whoami
hostname
date
pwd
clear
```

3. Open the manual for `ls`:

```bash
man ls
```

4. Search for the word **sort** inside the manual using:

```text
/sort
```

5. Exit using:

```text
q
```

---

# Interview Questions

1. What is a terminal?
2. What is a shell?
3. What is the difference between a terminal and a console?
4. Explain the command execution process.
5. What does the `$` symbol mean in the prompt?
6. What does the `#` symbol indicate?
7. What is the syntax of a Linux command?
8. How do you access a command's manual?
