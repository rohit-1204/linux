
# Linux Notes
# Chapter 24 - awk & sed in Linux

> **Level:** Intermediate to Advanced  
> **Estimated Reading Time:** 3–4 hours  
> **Practice Time:** 4–6 hours  

---

# Table of Contents

1. What are awk and sed?
2. Why awk and sed are Important
3. Difference between awk and sed
4. Introduction to sed
5. sed Syntax Basics
6. Substitution in sed
7. Deletion in sed
8. Insert and Append in sed
9. Advanced sed Usage
10. Introduction to awk
11. awk Syntax Basics
12. Printing Columns with awk
13. Conditions in awk
14. Built-in Variables in awk
15. awk Patterns and Actions
16. Real-world Examples
17. Common Mistakes
18. Pro Tips
19. Summary
20. Interview Questions
21. Practice Exercises
22. Mini Project

---

# Learning Objectives

After completing this chapter, you will understand:

- How to use `awk` and `sed` for text processing
- How to modify files without opening them
- How to filter, extract, and transform text
- How DevOps engineers use awk/sed in automation
- How to process logs and structured data efficiently

---

# 📖 Theory

Linux is heavily based on **text processing**.

Two powerful tools:

- `sed` → Stream Editor (edit text line by line)
- `awk` → Pattern scanning and processing language

They are used for:

- Log analysis
- File editing
- Data extraction
- Automation scripts

---

# 🧠 Concepts

## sed vs awk

| Feature | sed | awk |
|--------|-----|-----|
| Purpose | Text editing | Data processing |
| Works on | Line-by-line | Column-based |
| Complexity | Simple | Advanced |
| Use case | Replace/delete | Reports, extraction |

---

# 🖥️ Introduction to sed

`sed` = Stream Editor

It edits text **without opening files manually**.

---

# 📌 sed Syntax

```bash
sed 'command' file
```

---

# 🔁 Substitution in sed

## Basic replace

```bash
sed 's/error/warning/' file.txt
```

---

## Global replace

```bash
sed 's/error/warning/g' file.txt
```

---

## Case insensitive replace

```bash
sed 's/error/warning/gi' file.txt
```

---

# 🗑️ Deletion in sed

## Delete lines containing word

```bash
sed '/error/d' file.txt
```

---

## Delete specific line

```bash
sed '3d' file.txt
```

---

## Delete range of lines

```bash
sed '2,5d' file.txt
```

---

# ➕ Insert & Append

## Insert before line

```bash
sed '2i This is inserted line' file.txt
```

---

## Append after line

```bash
sed '2a This is appended line' file.txt
```

---

# ⚙️ Advanced sed

## Save changes to file

```bash
sed -i 's/error/warning/g' file.txt
```

---

## Multiple commands

```bash
sed -e 's/error/warning/g' -e 's/fail/pass/g' file.txt
```

---

## Print only matching lines

```bash
sed -n '/error/p' file.txt
```

---

# 🧠 Introduction to awk

`awk` is used for:

- Column-based processing
- Reports
- Filtering structured data

---

# 📌 awk Syntax

```bash
awk 'pattern { action }' file
```

---

# 🧩 Basic awk Examples

## Print entire file

```bash
awk '{print}' file.txt
```

---

## Print first column

```bash
awk '{print $1}' file.txt
```

---

## Print multiple columns

```bash
awk '{print $1, $3}' file.txt
```

---

# 📊 awk Built-in Variables

| Variable | Meaning |
|----------|--------|
| $0 | Entire line |
| $1 | First column |
| $2 | Second column |
| NF | Number of fields |
| NR | Line number |

---

## Example

```bash
awk '{print NR, $1}' file.txt
```

---

# 🔍 Conditions in awk

## Filter rows

```bash
awk '$2 > 50 {print}' file.txt
```

---

## Match text

```bash
awk '/error/ {print}' file.txt
```

---

# 📌 awk Patterns & Actions

## Only print if condition matches

```bash
awk '$3 == "Linux" {print $1}' file.txt
```

---

## Sum of values

```bash
awk '{sum += $2} END {print sum}' file.txt
```

---

## Average calculation

```bash
awk '{sum += $2} END {print sum/NR}' file.txt
```

---

# 🌍 Real-world Examples

---

## Extract usernames from logs

```bash
awk '{print $1}' /var/log/auth.log
```

---

## Find failed logins

```bash
grep "Failed password" /var/log/auth.log
```

---

## Extract IP addresses

```bash
awk '{print $NF}' access.log
```

---

## Replace using sed in logs

```bash
sed 's/error/ERROR/g' syslog
```

---

# ⚠️ Common Mistakes

- Using awk when sed is enough
- Forgetting single quotes
- Misunderstanding columns in awk
- Editing files without backup (-i risk)
- Mixing regex syntax incorrectly

---

# 💡 Pro Tips

- Use sed for quick replacements
- Use awk for structured data
- Always test without `-i` first
- Combine grep + awk for power
- Use NF and NR for advanced logic

---

# 🎯 Practice Exercises

1. Replace a word using sed
2. Delete lines with sed
3. Insert a line using sed
4. Print first column using awk
5. Print multiple columns
6. Filter rows using condition
7. Sum numbers using awk
8. Extract log data
9. Combine grep + awk
10. Modify file safely

---

# 🧩 Mini Project

## Log Processing Automation Tool

Create:

```bash
log_processor.sh
```

---

### Script:

```bash
#!/bin/bash

echo "=== LOG PROCESSOR ==="

echo ""
echo "ERROR LINES (sed filtering):"
sed -n '/error/p' /var/log/syslog | head -10

echo ""
echo "FAILED LOGINS (awk extraction):"
awk '/Failed password/ {print $0}' /var/log/auth.log | head -10

echo ""
echo "USERS FROM LOGS:"
awk '{print $1}' /var/log/auth.log | head -10
```

---

### Make executable:

```bash
chmod +x log_processor.sh
```

---

### Run:

```bash
./log_processor.sh
```

---

# ❓ Interview Questions

### Beginner

1. What is sed?
2. What is awk?

---

### Intermediate

3. Difference between sed and awk?
4. What is substitution in sed?
5. What is $1 in awk?

---

### Advanced

6. How does awk process columns?
7. Why is sed called stream editor?
8. How do you calculate sum using awk?
9. When should you avoid sed?
10. How are awk and regex related?

---

# 📝 Summary

- `sed` edits text streams
- `awk` processes structured data
- sed = line-based editing
- awk = column-based processing
- Both are essential for DevOps
- Powerful for logs and automation

---

# 📚 Further Reading

- `man sed`
- `man awk`
- GNU awk documentation
- Advanced Linux text processing guides





