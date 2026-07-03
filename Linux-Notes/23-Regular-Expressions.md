# Linux Notes
# Chapter 23 - Regular Expressions in Linux

> **Level:** Intermediate  
> **Estimated Reading Time:** 2–3 hours  
> **Practice Time:** 3–5 hours  

---

# Table of Contents

1. What are Regular Expressions?
2. Why Regex is Important in Linux
3. Basic Regex Syntax
4. Types of Regular Expressions
5. grep with Regex
6. egrep / grep -E
7. Basic Patterns
8. Character Classes
9. Quantifiers
10. Anchors
11. Wildcards in Regex
12. Extended Regex
13. sed with Regex
14. awk with Regex
15. Real-world Examples
16. Common Mistakes
17. Pro Tips
18. Summary
19. Interview Questions
20. Practice Exercises
21. Mini Project

---

# Learning Objectives

After completing this chapter, you will understand:

- What regular expressions are
- How to use regex in Linux tools
- How to filter text using patterns
- How to combine regex with `grep`, `sed`, and `awk`
- How to solve real-world text processing problems

---

# 📖 Theory

A **Regular Expression (Regex)** is a pattern used to match text.

In Linux, regex is used for:

- Searching logs
- Filtering output
- Validating data
- Extracting information
- Automating text processing

---

# 🧠 Concepts

## Why Regex is Powerful

Instead of searching manually:

```bash
grep error file.txt
```

You can search patterns like:

- All emails
- All IP addresses
- All numbers
- Specific formats

---

## Types of Regex

| Type | Description |
|------|--------|
| Basic Regex (BRE) | Default grep |
| Extended Regex (ERE) | grep -E / egrep |

---

# 🖥️ Basic Regex Syntax

| Symbol | Meaning |
|--------|--------|
| . | Any single character |
| * | Zero or more |
| ^ | Start of line |
| $ | End of line |
| [] | Character set |
| {} | Repetition |
| \ | Escape character |

---

# 📌 grep with Regex

## Basic search

```bash
grep "error" file.txt
```

---

## Using regex patterns

```bash
grep "^error" file.txt
```

Find lines starting with "error".

---

```bash
grep "error$" file.txt
```

Find lines ending with "error".

---

# 📌 Extended Regex (ERE)

```bash
grep -E "pattern"
```

or:

```bash
egrep "pattern"
```

---

# 🧩 Character Classes

| Pattern | Meaning |
|--------|--------|
| [abc] | a or b or c |
| [a-z] | lowercase letters |
| [0-9] | numbers |
| [^a-z] | NOT lowercase |

---

## Examples

```bash
grep "[0-9]" file.txt
```

Find lines with numbers.

---

```bash
grep "[A-Z]" file.txt
```

Find uppercase letters.

---

# 🔁 Quantifiers

| Symbol | Meaning |
|--------|--------|
| * | 0 or more |
| + | 1 or more |
| ? | 0 or 1 |
| {n} | exactly n times |
| {n,} | at least n times |
| {n,m} | between n and m |

---

## Examples

```bash
grep -E "a{3}" file.txt
```

Matches "aaa"

---

```bash
grep -E "ab+" file.txt
```

Matches ab, abb, abbb...

---

# 📌 Anchors

| Symbol | Meaning |
|--------|--------|
| ^ | Start of line |
| $ | End of line |

---

## Examples

```bash
grep "^root" file.txt
```

Lines starting with root

---

```bash
grep "bash$" file.txt
```

Lines ending with bash

---

# 🧠 Wildcards vs Regex

| Feature | Wildcards | Regex |
|--------|----------|-------|
| Use | filenames | text |
| Tool | ls | grep |
| Power | low | high |

---

# ⚙️ sed with Regex

## Replace text

```bash
sed 's/error/warning/' file.txt
```

---

## Global replace

```bash
sed 's/error/warning/g' file.txt
```

---

## Delete lines

```bash
sed '/error/d' file.txt
```

---

# 📊 awk with Regex

## Example

```bash
awk '/error/ {print}' file.txt
```

---

## Print column

```bash
awk '{print $1}' file.txt
```

---

## Filter numbers

```bash
awk '$2 ~ /^[0-9]+$/ {print}' file.txt
```

---

# 🌍 Real-world Examples

---

## Find emails

```bash
grep -E "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}" file.txt
```

---

## Find IP addresses

```bash
grep -E "([0-9]{1,3}\\.){3}[0-9]{1,3}" file.txt
```

---

## Find log errors

```bash
grep -i "error|fail|critical" /var/log/syslog
```

---

# ⚠️ Common Mistakes

- Forgetting to escape special characters
- Confusing glob patterns with regex
- Using grep instead of grep -E for + and {}
- Overcomplicating simple patterns
- Not testing regex step-by-step

---

# 💡 Pro Tips

- Build regex step-by-step
- Always test with small input first
- Use `grep -n` to see line numbers
- Combine regex with pipes
- Learn basic patterns first, then advanced

---

# 🎯 Practice Exercises

1. Find all lines starting with "root"
2. Find all numbers in a file
3. Match email patterns
4. Extract IP addresses
5. Replace words using sed
6. Delete error lines using sed
7. Use awk to print columns
8. Combine grep + awk
9. Match lines ending with ".log"
10. Build a custom regex filter

---

# 🧩 Mini Project

## Log Analyzer using Regex

Create file:

```bash
log_analyzer.sh
```

---

### Script:

```bash
#!/bin/bash

echo "=== LOG ANALYZER ==="

echo ""
echo "ERROR LINES:"
grep -i "error" /var/log/syslog | head -10

echo ""
echo "FAILED LOGINS:"
grep "Failed password" /var/log/auth.log | head -10

echo ""
echo "IP ADDRESSES FOUND:"
grep -E "([0-9]{1,3}\\.){3}[0-9]{1,3}" /var/log/syslog | head -10
```

---

### Make executable:

```bash
chmod +x log_analyzer.sh
```

---

### Run:

```bash
./log_analyzer.sh
```

---

# ❓ Interview Questions

### Beginner

1. What is regex?
2. Why is regex used in Linux?

---

### Intermediate

3. Difference between grep and grep -E?
4. What does ^ and $ mean?
5. What are character classes?

---

### Advanced

6. How does sed use regex?
7. How does awk use regex?
8. Difference between globbing and regex?
9. How do you extract emails using regex?
10. Why is regex powerful in DevOps?

---

# 📝 Summary

- Regex is pattern matching system
- Used in grep, sed, awk
- Supports advanced filtering
- Helps process logs and text
- Essential for DevOps and scripting

---

# 📚 Further Reading

- `man grep`
- `man sed`
- `man awk`
- Regex cheatsheet (Linux)
- Advanced text processing guides
