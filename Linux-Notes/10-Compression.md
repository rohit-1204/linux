# 10 - File Compression and Archiving

## Learning Objectives

After completing this chapter, you will be able to:

- Understand the difference between compression and archiving
- Create archives using `tar`
- Compress and decompress files using `gzip`, `bzip2`, and `xz`
- Extract compressed archives
- View archive contents without extracting
- Choose the appropriate compression format
- Backup files and directories efficiently

---

## Why Compression is Important

Compression helps to:

- Save disk space
- Reduce file transfer time
- Create backups
- Archive multiple files into a single file
- Share files efficiently

Example:

```
Project Folder
│
├── src/
├── docs/
├── images/
└── logs/

↓

project.tar.gz
```

---

# Compression vs Archiving

| Compression | Archiving |
|-------------|-----------|
| Reduces file size | Combines multiple files |
| Uses algorithms | Creates one archive |
| Example: `.gz` | Example: `.tar` |

---

## Common File Extensions

| Extension | Description |
|-----------|-------------|
| `.tar` | Archive only |
| `.gz` | Gzip compressed file |
| `.tar.gz` or `.tgz` | Tar archive compressed with gzip |
| `.bz2` | Bzip2 compressed file |
| `.tar.bz2` | Tar archive with bzip2 compression |
| `.xz` | XZ compressed file |
| `.tar.xz` | Tar archive with xz compression |
| `.zip` | ZIP archive |

---

# tar Command

The `tar` command is used to create and extract archive files.

---

## Syntax

```bash
tar [options] archive_name files
```

---

## Common tar Options

| Option | Meaning |
|---------|----------|
| `-c` | Create archive |
| `-x` | Extract archive |
| `-v` | Verbose output |
| `-f` | Archive filename |
| `-t` | List archive contents |
| `-z` | Use gzip |
| `-j` | Use bzip2 |
| `-J` | Use xz |

---

# Create a tar Archive

## Syntax

```bash
tar -cvf archive.tar folder/
```

---

## Example

```bash
tar -cvf backup.tar Documents/
```

Output:

```
Documents/
Documents/file1.txt
Documents/file2.txt
```

---

# List Archive Contents

## Syntax

```bash
tar -tvf archive.tar
```

---

## Example

```bash
tar -tvf backup.tar
```

---

# Extract Archive

## Syntax

```bash
tar -xvf archive.tar
```

---

## Example

```bash
tar -xvf backup.tar
```

---

# Extract to Specific Directory

```bash
tar -xvf backup.tar -C /home/student/
```

---

# gzip Command

Compresses a file using Gzip.

---

## Syntax

```bash
gzip filename
```

---

## Example

```bash
gzip report.txt
```

Result:

```
report.txt.gz
```

---

# Decompress gzip File

## Syntax

```bash
gunzip filename.gz
```

---

## Example

```bash
gunzip report.txt.gz
```

---

# Create tar.gz Archive

## Syntax

```bash
tar -czvf archive.tar.gz folder/
```

---

## Example

```bash
tar -czvf project.tar.gz Project/
```

---

# Extract tar.gz Archive

```bash
tar -xzvf project.tar.gz
```

---

# bzip2 Command

Compresses files with better compression than gzip.

---

## Syntax

```bash
bzip2 filename
```

---

## Example

```bash
bzip2 report.txt
```

Result:

```
report.txt.bz2
```

---

# Decompress bzip2 File

```bash
bunzip2 report.txt.bz2
```

---

# Create tar.bz2 Archive

```bash
tar -cjvf archive.tar.bz2 folder/
```

---

# Extract tar.bz2 Archive

```bash
tar -xjvf archive.tar.bz2
```

---

# xz Command

Provides higher compression than gzip and bzip2.

---

## Syntax

```bash
xz filename
```

---

## Example

```bash
xz report.txt
```

Result:

```
report.txt.xz
```

---

# Decompress xz File

```bash
unxz report.txt.xz
```

---

# Create tar.xz Archive

```bash
tar -cJvf archive.tar.xz folder/
```

---

# Extract tar.xz Archive

```bash
tar -xJvf archive.tar.xz
```

---

# zip Command

Creates ZIP archives.

---

## Syntax

```bash
zip archive.zip files
```

---

## Example

```bash
zip notes.zip notes.txt
```

---

## Compress Directory

```bash
zip -r project.zip Project/
```

---

# unzip Command

Extract ZIP archives.

---

## Syntax

```bash
unzip archive.zip
```

---

## Example

```bash
unzip project.zip
```

---

# Compare Compression Tools

| Tool | Speed | Compression | Common Use |
|------|--------|-------------|------------|
| gzip | Fast | Good | Most common |
| bzip2 | Medium | Better | Large backups |
| xz | Slow | Best | Maximum compression |
| zip | Fast | Good | Windows compatibility |

---

# View Compressed File Information

```bash
file archive.tar.gz
```

Example:

```text
archive.tar.gz: gzip compressed data
```

---

# Common Mistakes

- Forgetting the `-f` option with `tar`
- Using the wrong extraction option (`-z`, `-j`, `-J`)
- Compressing an already compressed file
- Confusing archiving with compression
- Extracting archives into the wrong directory

---

# Pro Tips

- Use `tar -czvf` for most Linux backups
- Use `tar -cJvf` for maximum compression
- Use `zip` when sharing files with Windows users
- Use `tar -tvf` to inspect archives before extracting
- Store backups with timestamps

Example:

```bash
tar -czvf backup-$(date +%F).tar.gz Documents/
```

---

# Practice Exercises

1. Create a directory named `practice`
2. Add three text files
3. Create a `tar` archive
4. Compress it using gzip
5. Extract the archive
6. Create a ZIP archive
7. List the contents of the archive without extracting it

---

# Mini Project

## Create a Backup Archive

Create the following directory:

```
backup-project/
├── documents/
├── scripts/
├── images/
└── logs/
```

### Tasks

1. Create the directory structure
2. Add sample files
3. Create:

```bash
backup.tar
```

4. Create:

```bash
backup.tar.gz
```

5. Create:

```bash
backup.tar.xz
```

6. Verify archive contents

```bash
tar -tvf backup.tar.gz
```

7. Extract the archive into a new directory

---

# Interview Questions

1. What is the difference between compression and archiving?
2. What does the `tar` command do?
3. What is the purpose of the `-z` option in `tar`?
4. How do you create a `.tar.gz` archive?
5. How do you extract a `.tar.gz` archive?
6. What is the difference between `gzip`, `bzip2`, and `xz`?
7. Which command lists archive contents without extracting?
8. How do you create a ZIP archive?
9. What is the purpose of the `-C` option while extracting?
10. Which compression method provides the highest compression ratio?

---

# Summary

- `tar` → Archive files and directories
- `gzip` → Fast compression
- `gunzip` → Decompress gzip files
- `bzip2` → Better compression than gzip
- `xz` → Highest compression ratio
- `zip` → Cross-platform archive format
- `unzip` → Extract ZIP archives
- `tar -tvf` → View archive contents
- `tar -xvf` → Extract archives
- `tar -czvf` → Create compressed tar archive

---

# Further Reading

- `man tar`
- `man gzip`
- `man bzip2`
- `man xz`
- `man zip`
- GNU tar Documentation
- Linux Backup and Recovery Guide
