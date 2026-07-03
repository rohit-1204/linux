# 16 - Bash Scripting

## Learning Objectives

After completing this chapter, you will be able to:

- Understand what Bash scripting is
- Write and execute shell scripts
- Use variables, conditions, loops, and functions
- Automate repetitive Linux tasks
- Handle user input and command-line arguments
- Debug and improve scripts

---

# 📖 Theory

**Bash (Bourne Again Shell)** is the default shell in most Linux systems.

A **bash script** is a file containing a sequence of Linux commands that are executed automatically.

Instead of typing commands manually every time, you can automate tasks using scripts.

Example:

- System backup scripts
- Log cleanup
- User management automation
- Deployment scripts

---

# 🧠 Concepts

## What is a shell script?

A file containing Linux commands executed sequentially.

## Script flow

```
Start → Execute line by line → End
```

## File extension

```bash
script.sh
```

---

## Shebang (Important)

Every script starts with:

```bash
#!/bin/bash
```

This tells Linux to use Bash interpreter.

---

# 🖥️ Command Explanation

## Run a script

```bash
bash script.sh
```

or

```bash
./script.sh
```

---

## Make script executable

```bash
chmod +x script.sh
```

---

# 📌 Syntax

## Basic script structure

```bash
#!/bin/bash

echo "Hello Linux"
```

---

# ✅ Examples

---

## Example 1: Basic Script

```bash
#!/bin/bash

echo "Welcome to Linux Scripting"
```

---

## Example 2: Variables

```bash
#!/bin/bash

name="Linux"
echo "I am learning $name"
```

---

## Example 3: User Input

```bash
#!/bin/bash

echo "Enter your name:"
read name
echo "Hello $name"
```

---

## Example 4: If Condition

```bash
#!/bin/bash

num=10

if [ $num -gt 5 ]
then
  echo "Number is greater than 5"
else
  echo "Number is smaller or equal to 5"
fi
```

---

## Example 5: For Loop

```bash
#!/bin/bash

for i in 1 2 3 4 5
do
  echo "Number: $i"
done
```

---

## Example 6: While Loop

```bash
#!/bin/bash

count=1

while [ $count -le 5 ]
do
  echo "Count: $count"
  count=$((count + 1))
done
```

---

## Example 7: Functions

```bash
#!/bin/bash

greet() {
  echo "Hello $1"
}

greet "Linux User"
```

---

## Example 8: Command-line Arguments

```bash
#!/bin/bash

echo "First argument: $1"
echo "Second argument: $2"
```

Run:

```bash
./script.sh Linux Bash
```

---

# ⚠️ Common Mistakes

- Forgetting `#!/bin/bash`
- Not giving execute permission
- Using spaces incorrectly in conditions
- Forgetting `$` in variables
- Using `=` instead of `-eq`, `-gt`, etc.

---

# 💡 Pro Tips

- Always start scripts with shebang
- Use `set -x` for debugging
- Quote variables: `"${var}"`
- Break large scripts into functions
- Use comments for clarity

---

# 🎯 Practice Exercises

1. Write a script that prints your name
2. Take user input and greet user
3. Check if a number is even or odd
4. Print numbers from 1 to 10
5. Create a simple calculator script
6. Accept command-line arguments
7. Write a script using functions
8. Create a backup script using tar

---

# 🧩 Mini Project

## System Info Reporter

Create a script:

```bash
system_info.sh
```

### Requirements:

- Show system date
- Show logged-in user
- Show current directory
- Show disk usage
- Show memory usage

---

### Script:

```bash
#!/bin/bash

echo "System Report"
echo "----------------"

echo "Date: $(date)"
echo "User: $(whoami)"
echo "Directory: $(pwd)"

echo "Disk Usage:"
df -h

echo "Memory Usage:"
free -h
```

---

### Run:

```bash
chmod +x system_info.sh
./system_info.sh
```

---

# ❓ Interview Questions

1. What is a Bash script?
2. What is shebang?
3. How do you execute a script?
4. Difference between bash and shell?
5. What are variables in bash?
6. What is `$1` in scripting?
7. How do you debug a script?
8. What are loops in bash?
9. What is the use of chmod +x?
10. What is the difference between if and case?

---

# 📝 Summary

- Bash scripting automates Linux tasks
- Scripts contain Linux commands
- `#!/bin/bash` defines interpreter
- Variables store data
- Conditions control logic
- Loops repeat tasks
- Functions reuse code
- Arguments pass values to scripts

---

# 📚 Further Reading

- `man bash`
- GNU Bash documentation
- Advanced Bash Scripting Guide
- Linux Shell Scripting Tutorial (tldp.org)
