# Linux Notes
# Chapter 25 - grep Command in Linux

> **Level:** Beginner to Intermediate  
> **Estimated Reading Time:** 2–3 hours  
> **Practice Time:** 3–5 hours  

---

# Table of Contents

1. What is grep?
2. Why grep is Important
3. Basic Syntax of grep
4. Searching Text in Files
5. Case-insensitive Search
6. Recursive Search
7. Line Numbers in grep
8. Inverting Matches
9. Counting Matches
10. Matching Whole Words
11. Using grep with Regex
12. grep Options Summary
13. grep with Pipes
14. Real-world Examples
15. Common Mistakes
16. Pro Tips
17. Summary
18. Interview Questions
19. Practice Exercises
20. Mini Project

---

# Learning Objectives

After completing this chapter, you will understand:

- How to use `grep` effectively
- How to search text in files and output
- How to combine grep with regex
- How DevOps engineers use grep in logs
- How to filter system information quickly

---

# 📖 Theory

`grep` stands for:

> **Global Regular Expression Print**

It is used to **search text patterns inside files or output**.

---

# 🧠 Concepts

## Why grep is powerful

Instead of manually searching:

```bash
cat file.txt
```

You can directly filter:

```bash
grep "error" file.txt
```

---

# 🖥️ Basic Syntax

```bash
grep [options] pattern file
```

---

# 📌 Searching Text in Files

```bash
grep "linux" file.txt
```

---

# 🔠 Case-insensitive Search

```bash
grep -i "linux" file.txt
```

Matches:

- Linux
- linux
- LINUX

---

# 🔁 Recursive Search

Search inside directories:

```bash
grep -r "error" /var/log
```

---

# 🔢 Line Numbers

```bash
grep -n "error" file.txt
```

Output:

```
5:error occurred
12:error found
```

---

# 🚫 Invert Matches

Show lines that DO NOT match:

```bash
grep -v "error" file.txt
```

---

# 🔢 Count Matches

```bash
grep -c "error" file.txt
```

---

# 📌 Match Whole Words

```bash
grep -w "linux" file.txt
```

---

# 🧠 grep with Regex

## Example:

```bash
grep "^root" file.txt
```

Lines starting with "root"

---

```bash
grep "bash$" file.txt
```

Lines ending with "bash"

---

```bash
grep "[0-9]" file.txt
```

Lines containing numbers

---

# 🔗 grep with Pipes

```bash
ps aux | grep "nginx"
```

---

```bash
cat log.txt | grep "error"
```

---

# 📊 grep Options Summary

| Option | Description |
|--------|-------------|
| -i | Ignore case |
| -r | Recursive search |
| -n | Show line numbers |
| -v | Invert match |
| -c | Count matches |
| -w | Whole word match |
| -E | Extended regex |
| --color | Highlight matches |

---

# 🌍 Real-world Examples

---

## Find running process

```bash
ps aux | grep apache
```

---

## Find errors in logs

```bash
grep "ERROR" /var/log/syslog
```

---

## Find failed logins

```bash
grep "Failed password" /var/log/auth.log
```

---

## Search configuration files

```bash
grep -r "PORT" /etc
```

---

# ⚠️ Common Mistakes

- Forgetting quotes around patterns
- Using grep instead of grep -r for directories
- Confusing regex syntax
- Missing case sensitivity
- Not using -n for debugging

---

# 💡 Pro Tips

- Always use `-n` when debugging logs
- Combine grep with awk for advanced filtering
- Use `--color` for readability
- Use `-r` carefully on large directories
- Pipe grep with ps, ls, cat for power

---

# 🎯 Practice Exercises

1. Search for a word in a file
2. Use case-insensitive search
3. Count occurrences of a word
4. Find lines not matching a pattern
5. Search recursively in /etc
6. Use grep with ps command
7. Find error logs
8. Match numbers using regex
9. Combine grep with pipes
10. Use grep -n for debugging

---

# 🧩 Mini Project

## System Log Filter Tool

Create:

```bash
grep_tool.sh
```

---

### Script:

```bash
#!/bin/bash

echo "=== GREP LOG TOOL ==="

echo ""
echo "ERRORS:"
grep -i "error" /var/log/syslog | head -10

echo ""
echo "FAILED LOGIN ATTEMPTS:"
grep "Failed password" /var/log/auth.log | head -10

echo ""
echo "NGINX PROCESSES:"
ps aux | grep nginx
```

---

### Make executable:

```bash
chmod +x grep_tool.sh
```

---

### Run:

```bash
./grep_tool.sh
```

---

# ❓ Interview Questions

### Beginner

1. What is grep?
2. What does grep stand for?

---

### Intermediate

3. Difference between grep and grep -i?
4. What does -r option do?
5. How do you count matches?

---

### Advanced

6. How does grep use regex?
7. Why is grep important in DevOps?
8. Difference between grep and awk?
9. How do you search logs efficiently?
10. What is recursive search?

---

# 📝 Summary

- grep searches text patterns
- Works with files and output
- Supports regex
- Used heavily in log analysis
- Essential DevOps tool
- Works well with pipes

---

# 📚 Further Reading

- `man grep`
- GNU grep documentation
- Linux text processing guides
- Regex integration with grep
