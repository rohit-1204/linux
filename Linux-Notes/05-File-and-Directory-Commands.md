
# Linux Notes
# Chapter 05 - File and Directory Commands (Part 1)

> **Level:** Beginner
> **Reading Time:** 60–90 Minutes
> **Practice Time:** 2–3 Hours

---

# Table of Contents

1. Learning Objectives
2. Introduction
3. Understanding Files and Directories
4. Creating Directories (`mkdir`)
5. Creating Files (`touch`)
6. Viewing Current Location (`pwd`)
7. Listing Files (`ls`)
8. Changing Directories (`cd`)
9. Creating Nested Directories
10. File Naming Rules
11. Best Practices
12. Common Mistakes
13. Summary
14. Practice Lab
15. Interview Questions

---

# Learning Objectives

After completing this chapter, you will be able to:

- Create files and directories
- Navigate the Linux filesystem
- Understand absolute and relative paths
- Create nested directory structures
- Use common directory commands efficiently
- Follow Linux file naming conventions

---

# Introduction

Everything in Linux revolves around **files** and **directories**.

Unlike Windows, Linux stores almost everything as a file:

- Documents
- Programs
- Devices
- Configuration
- Logs
- Processes (virtual files)

Understanding file management is the first major step toward becoming comfortable with Linux.

---

# What is a File?

A file is a collection of information stored on disk.

Examples:

```
notes.txt
photo.jpg
video.mp4
script.sh
main.c
```

A file may contain:

- Text
- Images
- Audio
- Video
- Executable code
- Configuration

---

# What is a Directory?

A directory (folder) is used to organize files.

Example:

```
Documents/

├── Linux
├── Python
├── Java
└── Notes
```

Directories can contain:

- Files
- Other directories

---

# Directory Tree Example

```
Home

├── Documents
│      ├── Linux
│      ├── Python
│      └── Notes
│
├── Downloads
│
├── Music
│
├── Pictures
│
└── Videos
```

---

# Current Working Directory

Before creating anything, always know your location.

Command:

```bash
pwd
```

Example:

```bash
$ pwd
/home/student
```

Output:

```
/home/student
```

Meaning:

You are currently inside your home directory.

---

# Listing Existing Files

Command:

```bash
ls
```

Example:

```bash
$ ls

Desktop
Documents
Downloads
Pictures
```

Long listing:

```bash
ls -l
```

Hidden files:

```bash
ls -la
```

---

# Creating Directories

Linux uses the **mkdir** command.

Syntax:

```bash
mkdir directory_name
```

Example:

```bash
mkdir Linux
```

Verify:

```bash
ls
```

Output:

```
Desktop
Documents
Linux
Downloads
```

---

# Creating Multiple Directories

You can create multiple directories at once.

Example:

```bash
mkdir Java Python C C++
```

Result:

```
Java/
Python/
C/
C++/
```

---

# Creating Nested Directories

Suppose you want this structure:

```
Projects

└── Linux

      └── Shell

             └── Scripts
```

Without `-p`:

```bash
mkdir Projects/Linux/Shell/Scripts
```

Output:

```
No such file or directory
```

Because the parent directories do not yet exist.

Correct command:

```bash
mkdir -p Projects/Linux/Shell/Scripts
```

Verify:

```bash
tree Projects
```

Output:

```
Projects

└── Linux

    └── Shell

        └── Scripts
```

---

# Understanding the -p Option

The `-p` option means:

> Create parent directories if they do not already exist.

Example:

```bash
mkdir -p College/SEM5/Linux/Lab
```

Creates:

```
College

└── SEM5

    └── Linux

        └── Lab
```

Even if none of the directories existed beforehand.

---

# Creating Hidden Directories

Directories starting with a dot (`.`) are hidden.

Example:

```bash
mkdir .config
```

View it:

```bash
ls -la
```

Output:

```
.config
```

---

# Creating Files

The simplest command:

```bash
touch
```

Syntax:

```bash
touch filename
```

Example:

```bash
touch notes.txt
```

Verify:

```bash
ls
```

Output:

```
notes.txt
```

---

# Creating Multiple Files

Example:

```bash
touch one.txt two.txt three.txt
```

Output:

```
one.txt
two.txt
three.txt
```

---

# Creating Files with Extensions

Linux doesn't require extensions, but they are useful.

Examples:

```bash
touch program.c
touch hello.py
touch index.html
touch style.css
touch script.sh
touch report.pdf
```

---

# Creating Files in Another Directory

Example:

```bash
touch Documents/linux-notes.txt
```

Or using an absolute path:

```bash
touch /home/student/Documents/linux-notes.txt
```

---

# Updating File Timestamps

If the file already exists:

```bash
touch notes.txt
```

The modification timestamp is updated.

We'll explore timestamps in a later chapter.

---

# Combining mkdir and touch

Example:

```bash
mkdir Linux

touch Linux/readme.md
```

Result:

```
Linux

└── readme.md
```

---

# Using Relative Paths

Current directory:

```
/home/student
```

Command:

```bash
mkdir Projects
```

Creates:

```
/home/student/Projects
```

---

# Using Absolute Paths

Command:

```bash
mkdir /home/student/Linux
```

No matter where you currently are, the directory is created in `/home/student`.

---

# File Naming Rules

Good names:

```
notes.txt
linux_commands.md
python.py
shell_script.sh
```

Avoid:

```
my file.txt
$$$$.txt
abc????
```

Prefer:

```
my_file.txt
```

or

```
my-file.txt
```

---

# Case Sensitivity

Linux distinguishes uppercase and lowercase letters.

Example:

```bash
touch file.txt
touch File.txt
touch FILE.txt
```

Result:

```
file.txt
File.txt
FILE.txt
```

These are **three different files**.

---

# Common Mistakes

## Forgetting Quotes Around Spaces

Incorrect:

```bash
touch My File.txt
```

This creates two files:

```
My
File.txt
```

Correct:

```bash
touch "My File.txt"
```

---

## Using Windows Paths

Incorrect:

```bash
cd C:\Users\Student
```

Correct:

```bash
cd /home/student
```

---

## Forgetting the `-p` Option

Incorrect:

```bash
mkdir Linux/Shell/Scripts
```

If parent directories don't exist, the command fails.

Correct:

```bash
mkdir -p Linux/Shell/Scripts
```

---

# Best Practices

- Use meaningful file names.
- Avoid spaces in file names.
- Use lowercase names where possible.
- Organize related files into directories.
- Use `mkdir -p` for nested structures.
- Verify your work with `ls` or `tree`.

---

# Summary

In this chapter, you learned:

- What files and directories are
- How to create directories using `mkdir`
- How to create nested directories with `mkdir -p`
- How to create files using `touch`
- How to use relative and absolute paths
- File naming conventions
- Common mistakes to avoid

---

# Practice Lab

## Exercise 1

Create this directory structure:

```
LinuxPractice

├── Notes
├── Scripts
├── Projects
└── Backup
```

---

## Exercise 2

Inside `Notes`, create:

```
chapter1.md
chapter2.md
chapter3.md
```

---

## Exercise 3

Create the following nested structure using a **single command**:

```
College

└── SEM5

    └── Linux

        └── Assignments
```

---

## Exercise 4

Create these files:

```
hello.c
main.cpp
app.py
index.html
style.css
```

---

## Exercise 5

Create a hidden directory:

```
.secret
```

Verify it using:

```bash
ls -la
```

---

## Challenge

Without using the graphical interface, create this complete structure:

```
Portfolio

├── HTML

│   ├── index.html
│   └── about.html

├── CSS

│   └── style.css

├── JS

│   └── app.js

└── README.md
```

---

# Interview Questions

1. What is the difference between a file and a directory?
2. What does the `mkdir` command do?
3. Explain the purpose of the `-p` option.
4. How do you create multiple files with one command?
5. What is the purpose of the `touch` command?
6. Explain absolute and relative paths.
7. Why is Linux case-sensitive?
8. How do you create hidden files or directories?
9. Why should spaces be avoided in file names?
10. How can you verify that a directory was created successfully?

---

# What's Next?

In **Part 2**, you'll learn:

- `cp` (Copy files and directories)
- `mv` (Move and rename files)
- Renaming directories
- Copying entire directory trees
- Wildcards (`*`, `?`, `[]`)
- Real-world examples
- Common mistakes
- 20+ hands-on exercises
