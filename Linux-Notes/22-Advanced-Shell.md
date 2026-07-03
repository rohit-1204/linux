# Linux Notes
# Chapter 22 - Advanced Shell in Linux

> **Level:** Intermediate  
> **Estimated Reading Time:** 3–4 hours  
> **Practice Time:** 4–6 hours  

---

# Table of Contents

1. What is the Shell?
2. Types of Shells
3. Bash Deep Dive
4. Shell Configuration Files
5. Aliases
6. Shell Variables (Advanced)
7. Quoting in Shell
8. Command Substitution
9. Shell Expansion
10. Globbing (Wildcards)
11. Redirection Advanced
12. Pipes Advanced Usage
13. Shell Functions
14. Job Control
15. Background & Foreground Jobs
16. Signals in Linux
17. Shell Scripting Basics Review
18. Debugging Shell Scripts
19. Performance Tips
20. Summary
21. Interview Questions
22. Practice Exercises
23. Mini Project

---

# Learning Objectives

After completing this chapter, you will understand:

- How the Linux shell works internally
- Advanced Bash features
- Command substitution and expansions
- Job control and process handling
- Writing reusable shell functions
- Debugging shell scripts effectively

---

# 📖 Theory

The **shell** is a command interpreter between the user and the Linux kernel.

It:

- Accepts commands
- Interprets them
- Executes programs
- Returns output

The most common shell in Linux is **Bash (Bourne Again Shell)**.

---

# 🧠 Concepts

## Types of Shells

| Shell | Description |
|------|-------------|
| bash | Default Linux shell |
| sh | Basic shell |
| zsh | Advanced interactive shell |
| fish | User-friendly shell |

---

## How Shell Works

```
User Input → Shell Parsing → Kernel System Call → Output
```

---

# 🖥️ Bash Deep Dive

Bash performs:

- Command parsing
- Variable expansion
- Globbing
- Redirection handling
- Execution

---

# 📌 Shell Configuration Files

| File | Purpose |
|------|--------|
| ~/.bashrc | Interactive shell config |
| ~/.bash_profile | Login shell config |
| /etc/bash.bashrc | System-wide config |

---

## Apply changes

```bash
source ~/.bashrc
```

---

# 🔧 Aliases

Create shortcuts for commands.

---

## Syntax

```bash
alias name='command'
```

---

## Example

```bash
alias ll='ls -la'
```

---

## Remove alias

```bash
unalias ll
```

---

# 🧠 Shell Variables (Advanced)

## Local variable

```bash
name="Linux"
```

---

## Environment variable

```bash
export name="Linux"
```

---

## Read variable

```bash
echo $name
```

---

# 📌 Quoting in Shell

## 1. Single Quotes

```bash
echo 'Hello $USER'
```

Output:

```
Hello $USER
```

---

## 2. Double Quotes

```bash
echo "Hello $USER"
```

Output:

```
Hello linuxuser
```

---

## 3. No Quotes

```bash
echo Hello $USER
```

---

# 📌 Command Substitution

## Syntax

```bash
$(command)
```

---

## Example

```bash
echo "Today is $(date)"
```

---

## Backticks (old style)

```bash
echo "Today is `date`"
```

---

# 📌 Shell Expansion

---

## Brace Expansion

```bash
echo file{1..5}.txt
```

---

## Output:

```
file1.txt file2.txt file3.txt file4.txt file5.txt
```

---

## Tilde Expansion

```bash
echo ~
```

---

## Path expansion

```bash
echo /home/*
```

---

# 📌 Globbing (Wildcards)

| Pattern | Meaning |
|--------|--------|
| * | Any characters |
| ? | Single character |
| [] | Character set |

---

## Examples

```bash
ls *.txt
ls file?.log
ls [abc]file.txt
```

---

# 🔁 Advanced Redirection

## Redirect stdout + stderr

```bash
command > output.txt 2>&1
```

---

## Discard output

```bash
command > /dev/null 2>&1
```

---

# 🔗 Pipes Advanced Usage

## Multiple pipes

```bash
cat file.txt | grep error | sort | uniq | wc -l
```

---

## Tee with pipe

```bash
cat file.txt | tee output.txt | grep error
```

---

# 🧩 Shell Functions

## Syntax

```bash
function_name() {
    commands
}
```

---

## Example

```bash
greet() {
    echo "Hello $1"
}
```

---

## Run function

```bash
greet Linux
```

---

# ⚙️ Job Control

---

## Run background process

```bash
sleep 100 &
```

---

## View jobs

```bash
jobs
```

---

## Bring to foreground

```bash
fg %1
```

---

## Send to background

```bash
bg %1
```

---

# 📌 Signals in Linux

| Signal | Meaning |
|--------|--------|
| SIGINT | Ctrl + C |
| SIGTSTP | Ctrl + Z |
| SIGKILL | Force kill |
| SIGTERM | Graceful stop |

---

## Kill process

```bash
kill -9 PID
```

---

# 🐞 Debugging Shell Scripts

## Run script with debug

```bash
bash -x script.sh
```

---

## Trace execution

```bash
set -x
```

---

## Stop on error

```bash
set -e
```

---

# ⚠️ Common Mistakes

- Forgetting quotes in variables
- Misusing wildcards
- Confusing single vs double quotes
- Killing wrong processes
- Ignoring background jobs

---

# 💡 Pro Tips

- Always quote variables: "$var"
- Use functions instead of repeated code
- Use aliases for speed
- Use `set -x` for debugging
- Combine pipes for powerful commands

---

# 🎯 Practice Exercises

1. Create alias for ls
2. Use command substitution with date
3. Use brace expansion
4. Try glob patterns
5. Create a shell function
6. Run process in background
7. Use jobs and fg
8. Kill a process safely
9. Debug a script using -x
10. Combine pipes for filtering

---

# 🧩 Mini Project

## Custom Shell Toolkit

Create:

```bash
shell_tools.sh
```

---

### Script:

```bash
#!/bin/bash

alias ll='ls -la'

greet() {
    echo "Hello $1, welcome to Linux!"
}

sysinfo() {
    echo "Date: $(date)"
    echo "User: $USER"
    echo "Directory: $(pwd)"
}
```

---

### Load it:

```bash
source shell_tools.sh
```

---

### Use:

```bash
greet Linux
sysinfo
ll
```

---

# ❓ Interview Questions

### Beginner

1. What is a shell?
2. What is Bash?

---

### Intermediate

3. Difference between single and double quotes?
4. What is command substitution?
5. What are wildcards?

---

### Advanced

6. What is job control?
7. How does background processing work?
8. What is shell expansion?
9. How do signals work in Linux?
10. How do you debug shell scripts?

---

# 📝 Summary

- Shell is command interpreter
- Bash is most common shell
- Aliases simplify commands
- Functions add reusability
- Pipes combine commands
- Job control manages processes
- Expansions automate input generation

---

# 📚 Further Reading

- `man bash`
- Advanced Bash Scripting Guide
- GNU Bash documentation
- Linux process management guide
