
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

---

# Keyboard Shortcuts

One of the biggest productivity advantages in Linux is using keyboard shortcuts.

Instead of typing everything repeatedly, you can use shortcuts to navigate, edit commands, search history, and control running programs.

---

# Essential Keyboard Shortcuts

| Shortcut | Description |
|-----------|-------------|
| Ctrl + C | Stop the running command |
| Ctrl + D | Exit terminal or send EOF |
| Ctrl + L | Clear terminal screen |
| Ctrl + A | Move cursor to beginning of line |
| Ctrl + E | Move cursor to end of line |
| Ctrl + U | Delete from cursor to beginning |
| Ctrl + K | Delete from cursor to end |
| Ctrl + W | Delete previous word |
| Ctrl + Y | Paste deleted text |
| Ctrl + R | Search command history |
| Tab | Auto-complete commands/files |
| ↑ | Previous command |
| ↓ | Next command |
| Ctrl + P | Previous command |
| Ctrl + N | Next command |
| Ctrl + Z | Suspend current process |

---

# Ctrl + C

Stops the currently running process.

Example:

```bash
ping google.com
```

Output:

```
PING google.com ...
64 bytes from ...
64 bytes from ...
64 bytes from ...
```

To stop:

```
Ctrl + C
```

Output:

```
^C
```

---

# Ctrl + D

Ctrl + D sends an **EOF (End of File)** signal.

If you're at the shell prompt:

```bash
Ctrl + D
```

It closes the current shell session.

Example:

```bash
student@ubuntu:~$
```

Press:

```
Ctrl + D
```

Terminal closes.

---

# Ctrl + L

Clears the screen.

Instead of typing:

```bash
clear
```

Simply press:

```
Ctrl + L
```

The screen becomes clean while preserving the command history.

---

# Ctrl + A

Moves the cursor to the beginning of the command.

Example:

```bash
sudo apt install git curl vim
```

Press:

```
Ctrl + A
```

Cursor moves here:

```bash
^sudo apt install git curl vim
```

---

# Ctrl + E

Moves the cursor to the end.

Example:

```bash
sudo apt install git curl vim^
```

---

# Ctrl + U

Deletes everything from the cursor to the beginning.

Before:

```bash
sudo apt install git
      ^
```

After:

```bash
git
```

---

# Ctrl + K

Deletes everything from the cursor to the end.

Example:

Before:

```bash
sudo apt install git curl vim
           ^
```

After:

```bash
sudo apt
```

---

# Ctrl + W

Deletes the previous word.

Example:

Before:

```bash
mkdir linux practice notes
```

Cursor:

```
mkdir linux practice notes^
```

Press:

```
Ctrl + W
```

Result:

```bash
mkdir linux practice
```

Press again:

```bash
mkdir linux
```

---

# Ctrl + Y

Restores text deleted using:

- Ctrl + U
- Ctrl + K
- Ctrl + W

Think of it as a quick paste for deleted command-line text.

---

# Command History

Linux remembers previously executed commands.

View history:

```bash
history
```

Example:

```
1 pwd
2 ls
3 cd Documents
4 mkdir test
5 history
```

---

# Reusing Commands

Run the previous command:

```bash
!!
```

Example:

```bash
sudo !!
```

Useful when you forgot to use `sudo`.

Example:

```bash
apt update
```

Permission denied.

Instead of retyping:

```bash
sudo !!
```

Expands to:

```bash
sudo apt update
```

---

# Execute a Specific History Command

History:

```bash
history
```

Output:

```
20 pwd
21 ls
22 mkdir test
23 cd test
```

Execute command 22:

```bash
!22
```

---

# Search Command History

Shortcut:

```
Ctrl + R
```

Type:

```
git
```

Example:

```
(reverse-i-search)`git':
git clone https://github.com/example/project.git
```

Press:

```
Enter
```

to execute it.

---

# Auto Completion

The **Tab** key saves time.

Instead of typing:

```bash
Doc
```

Press:

```
Tab
```

Linux completes:

```bash
Documents
```

---

# Multiple Matches

Suppose:

```
Documents
Downloads
Desktop
```

Type:

```bash
D
```

Press:

```
Tab
```

Linux cannot decide.

Press Tab twice:

```
Desktop
Documents
Downloads
```

---

# Completing Commands

Instead of:

```bash
systemctl
```

Type:

```bash
sys
```

Press:

```
Tab
```

Linux attempts completion.

---

# Command Editing

Suppose:

```bash
mkdir linux-prcatice
```

Oops!

Move cursor:

```
← ← ←
```

Correct:

```bash
mkdir linux-practice
```

No need to delete the whole line.

---

# Command Line Editing Tips

Move one character:

```
← →
```

Move one word:

```
Ctrl + Left
Ctrl + Right
```

Delete one character:

```
Backspace
```

Delete one word:

```
Ctrl + W
```

---

# Using the Mouse

Although Linux supports the mouse,

professional users rely mostly on the keyboard because it is:

- Faster
- More efficient
- Easier over SSH
- Better for remote systems

---

# Interrupting Programs

Example:

```bash
yes
```

Output:

```
y
y
y
y
y
...
```

Stop:

```
Ctrl + C
```

---

# Suspending Programs

Example:

```bash
nano notes.txt
```

Press:

```
Ctrl + Z
```

Output:

```
[1]+ Stopped nano notes.txt
```

The program is suspended.

(You'll learn how to resume it in the Process Management chapter.)

---

# Clearing Command History

Delete history for current session:

```bash
history -c
```

Clear history file:

```bash
rm ~/.bash_history
```

> **Note:** Deleting history permanently removes your recorded commands. Use this only if you understand the consequences.

---

# Terminal Best Practices

✔ Use **Tab** completion.

✔ Learn keyboard shortcuts.

✔ Read error messages.

✔ Avoid typing commands as **root** unless necessary.

✔ Double-check commands before pressing Enter.

---

# Summary

You learned:

- Keyboard shortcuts
- Command history
- History search
- Auto-completion
- Editing commands
- Interrupting processes
- Suspending processes
- Terminal productivity tips

---

# Practice Lab

## Exercise 1

Run:

```bash
history
```

Count how many commands have been recorded.

---

## Exercise 2

Run:

```bash
echo "Linux"
```

Repeat it using:

```bash
!!
```

---

## Exercise 3

Use:

```
Ctrl + R
```

Search for:

```
echo
```

Execute the matching command.

---

## Exercise 4

Type:

```bash
mkdir linuxpractice
```

Move the cursor and insert a hyphen without deleting the command.

---

## Exercise 5

Run:

```bash
yes
```

Stop it using:

```
Ctrl + C
```

---

# Interview Questions

1. What does Ctrl + C do?
2. What is the purpose of Ctrl + R?
3. What is command history?
4. How does Tab completion improve productivity?
5. What does `!!` do?
6. How do you execute command number 50 from history?
7. What happens when you press Ctrl + Z?
8. What is EOF?
9. Why is keyboard navigation preferred over the mouse?
10. How do you clear the current shell history?

---

# Coming Next

In **Part 3**, you'll learn:

- Standard Input (stdin)
- Standard Output (stdout)
- Standard Error (stderr)
- Output Redirection (`>`, `>>`)
- Input Redirection (`<`)
- Pipes (`|`)
- `tee`
- `/dev/null`
- Combining commands like a Linux professional
