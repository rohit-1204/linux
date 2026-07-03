# 19 - Environment Variables in Linux

## Learning Objectives

After completing this chapter, you will be able to:

- Understand environment variables
- View and set variables in Linux
- Differentiate between environment and shell variables
- Make variables persistent
- Work with important system variables like PATH
- Configure user-level and system-level environment settings

---

# 📖 Theory

Environment variables are **key-value pairs** used by the Linux system and applications to store configuration information.

They help programs know:

- Where files are located
- Which user is logged in
- System paths
- Language settings
- Application configurations

Example:

```
USER=student
HOME=/home/student
PATH=/usr/bin:/bin:/usr/local/bin
```

---

# 🧠 Concepts

## Types of Variables

### 1. Shell Variables

- Exist only in current shell session
- Not inherited by child processes

---

### 2. Environment Variables

- Available to all child processes
- Used by system and applications

---

## Variable Flow

```
Shell → Environment → Child Processes → Programs
```

---

# 🖥️ Viewing Variables

---

## Show all environment variables

```bash
printenv
```

---

## Show specific variable

```bash
echo $HOME
```

Example:

```bash
/home/user
```

---

## List all shell variables

```bash
set
```

---

# 📌 Setting Variables

---

## Temporary variable (shell only)

```bash
name="Linux"
echo $name
```

---

## Environment variable (export)

```bash
export name="Linux"
```

Now accessible to child processes.

---

# 📌 Important System Variables

| Variable | Description |
|----------|-------------|
| PATH | Directories for executables |
| HOME | User home directory |
| USER | Current username |
| SHELL | Default shell |
| PWD | Current directory |
| LANG | Language settings |

---

# 📌 PATH Variable

## View PATH

```bash
echo $PATH
```

---

## Add temporary path

```bash
export PATH=$PATH:/home/user/scripts
```

---

## Why PATH is important?

It allows you to run commands without full path:

```
ls instead of /bin/ls
```

---

# 🧪 Making Variables Permanent

---

## User-level configuration

Add to:

```bash
~/.bashrc
```

Example:

```bash
export MY_VAR="LinuxLearning"
```

Apply changes:

```bash
source ~/.bashrc
```

---

## System-wide configuration

File:

```bash
/etc/environment
```

or

```bash
/etc/profile
```

---

# 📌 Unset Variables

```bash
unset name
```

---

# 📌 Read-only Variables

```bash
readonly name="Linux"
```

---

# ⚙️ Difference: Shell vs Environment Variables

| Feature | Shell Variable | Environment Variable |
|--------|---------------|----------------------|
| Scope | Current shell only | All processes |
| Exported | No | Yes |
| Persistence | No | No (unless configured) |

---

# 📌 Common Environment Files

| File | Purpose |
|------|--------|
| ~/.bashrc | User shell config |
| ~/.profile | Login shell config |
| /etc/profile | System-wide config |
| /etc/environment | Global variables |

---

# ⚠️ Common Mistakes

- Forgetting `export` keyword
- Overwriting PATH accidentally
- Not using full path in scripts
- Editing wrong config file
- Not reloading shell after changes

---

# 💡 Pro Tips

- Always append PATH instead of overwriting
- Use `.bashrc` for user customization
- Use `printenv` for debugging
- Use `source ~/.bashrc` to apply changes instantly
- Keep system PATH clean

---

# 🎯 Practice Exercises

1. Display HOME and USER variables
2. Create a shell variable
3. Export a variable and test in child shell
4. Modify PATH temporarily
5. Add a custom variable in `.bashrc`
6. Reload shell configuration
7. Unset a variable
8. Check all environment variables
9. Compare shell vs environment variable behavior
10. Break and fix PATH (safe lab)

---

# 🧩 Mini Project

## Custom Environment Setup

### Step 1: Create variable

```bash
export PROJECT="LinuxMastery"
```

---

### Step 2: Add script directory to PATH

```bash
export PATH=$PATH:/home/user/scripts
```

---

### Step 3: Create script

```bash
mkdir ~/scripts
nano ~/scripts/hello.sh
```

---

### Step 4: Add script content

```bash
#!/bin/bash
echo "Hello from custom script"
```

---

### Step 5: Make executable

```bash
chmod +x ~/scripts/hello.sh
```

---

### Step 6: Run without full path

```bash
hello.sh
```

---

# ❓ Interview Questions

1. What are environment variables?
2. Difference between shell and environment variables?
3. What is PATH variable?
4. How do you set a variable permanently?
5. What is export used for?
6. How do you view all environment variables?
7. What happens if PATH is incorrect?
8. What is ~/.bashrc used for?
9. How do child processes inherit variables?
10. How do you unset a variable?

---

# 📝 Summary

- Environment variables store system configuration
- Shell variables are local to session
- `export` makes variables global
- PATH controls command execution location
- `.bashrc` used for permanent user settings
- `/etc/environment` for system-wide config

---

# 📚 Further Reading

- `man bash`
- `printenv` documentation
- Linux environment variable guide
- Bash initialization files guide
