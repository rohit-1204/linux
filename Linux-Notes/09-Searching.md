# <mark>09 - Searching in Linux<mark/>

## <span style="background-color: #FFFF00">Learning Objectives</span>

==After completing this chapter, you will be able to:==

- Search files in Linux
- Search content inside files
- Use powerful search commands like `find`, `locate`, `grep`
- Filter output using pipes
- Combine commands for advanced searching

---

## ==Why Searching is Important==

In Linux systems, you often work with:

- Thousands of files
- Large log files
- Configuration directories

Searching helps you quickly find:

- Files by name
- Files by type
- Text inside files
- Logs and errors

---

# find Command

Search files and directories based on conditions.

---

## Syntax

```bash
find [path] [options] [expression]
```

---

## Example 1: Find file by name

```bash
find /home -name "file.txt"
```

---

## Example 2: Case insensitive search

```bash
find /home -iname "file.txt"
```

---

## Example 3: Find directories only

```bash
find /home -type d
```

---

## Example 4: Find files only

```bash
find /home -type f
```

---

## Example 5: Find by extension

```bash
find /home -name "*.sh"
```

---

## Example 6: Find large files

```bash
find / -size +100M
```

---

## Common Options

| Option | Meaning | Example |
| :--- | :--- | :--- |
| `-name` | search by name | `find . -name "app.log"` |
| `-iname` | case-insensitive name search | `find . -iname "README.md"` |
| `-type f` | files only | `find /var/log -type f` |
| `-type d` | directories only | `find /etc -type d` |
| `-size` | file size | `find . -size +10M` |
| `-mtime` | modified time | `find . -mtime -7` |

---

# locate Command

Fast file search using database index.

---

## Syntax

```bash
locate filename
```

---

## Example

```bash
locate file.txt
```

---

## Update database

```bash
sudo updatedb
```

---

## Difference: find vs locate

| Feature | find | locate |
|----------|------|--------|
| Speed | Slow | Fast |
| Real-time | Yes | No |
| Database | No | Yes |

---

# grep Command

Search inside files (text search).

---

## Syntax

```bash
grep [options] pattern file
```

---

## Example 1: Search text in file

```bash
grep "linux" file.txt
```

---

## Example 2: Ignore case

```bash
grep -i "linux" file.txt
```

---

## Example 3: Show line numbers

```bash
grep -n "error" log.txt
```

---

## Example 4: Recursive search

```bash
grep -r "main" /home/user
```

---

## Example 5: Exact word match

```bash
grep -w "root" file.txt
```

---

## Common Options

| Option | Meaning |
|--------|--------|
| -i | ignore case |
| -n | show line number |
| -r | recursive search |
| -w | whole word |
| -v | invert match |

---

# Pipe (|) for Searching

Pipe sends output of one command to another.

---

## Syntax

```bash
command1 | command2
```

---

## Example 1: grep with ls

```bash
ls | grep "txt"
```

---

## Example 2: search running process

```bash
ps aux | grep nginx
```

---

## Example 3: filter logs

```bash
cat log.txt | grep "error"
```

---

# which Command

Find location of executable command.

---

## Syntax

```bash
which command
```

---

## Example

```bash
which python
```

---

# whereis Command

Find binary, source, and manual pages.

---

## Syntax

```bash
whereis command
```

---

## Example

```bash
whereis ls
```

---

# Common Mistakes

- Using grep without quotes for patterns
- Forgetting root permission for find `/`
- Confusing find and locate
- Not updating locate database

---

# Pro Tips

- Use `grep -r` for project searching
- Use `find` for real-time file search
- Use pipes to combine commands
- Use `locate` for quick lookup

---

# Practice Exercises

1. Find all `.txt` files in home directory
2. Search for "error" inside a file
3. Find all directories in `/etc`
4. Use grep with ls output
5. Find location of bash
6. Search running process using grep

---

# Mini Project

## Log Analyzer

1. Create a file:

```bash
nano logs.txt
```

2. Add data:

```
error: disk full
info: system started
error: network down
warning: low memory
```

3. Tasks:

- Find all errors
- Show line numbers
- Count occurrences

Commands:

```bash
grep "error" logs.txt
grep -n "error" logs.txt
grep -c "error" logs.txt
```

---

# Interview Questions

1. What is grep used for?
2. Difference between find and locate?
3. What does pipe (|) do?
4. How do you search inside files?
5. What is recursive grep?
6. What is locate database?
7. How do you find file by name?
8. What is which command used for?
9. What is difference between grep and find?
10. How do you filter command output?

---

# Summary

- find → search files
- locate → fast file search
- grep → search text inside files
- pipe → connect commands
- which → locate command path
- whereis → locate binaries + docs

---

# Further Reading

- man find
- man grep
- man locate
- GNU grep documentation
- Linux filesystem search tools
