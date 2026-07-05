
# Linux Notes
# Chapter 03 - Linux File System (Part 1)

> Level: Beginner
> Reading Time: 45–60 Minutes
> Practice Time: 2–3 Hours

---

# Table of Contents

1. [Learning Objectives](#learning-objectives)
2. [What is a File System?](#what-is-a-file-system)
3. [Why File Systems Matter](#why-file-systems-matter)
4. [Linux File System Hierarchy (FHS)](#linux-file-system-hierarchy-fhs)
5. [Everything is a File](#everything-is-a-file)
6. [Understanding the Root Directory](#understanding-the-root-directory)
7. [Absolute vs Relative Paths](#absolute-vs-relative-paths)
8. [Present Working Directory (pwd)](#present-working-directory-pwd)
9. [Changing Directories (cd)](#changing-directories-cd)
10. [Listing Files (ls)](#listing-files-ls)
11. [Hidden Files](#hidden-files)
12. [File Naming Rules](#file-naming-rules)
13. [Directory Tree](#directory-tree)
14. [Summary](#summary)
15. [Practice Lab](#practice-lab)

---

# 1) Learning Objectives

After completing this chapter, you will be able to:

- Understand what a filesystem is.
- Navigate directories confidently.
- Understand Linux paths.
- Use `pwd`, `cd`, and `ls`.
- Understand hidden files.
- Read directory trees.
- Navigate without using the graphical interface.

---

# 2) What is a File System?

A **file system** is the method an operating system uses to organize, store, retrieve, and manage files on a storage device such as an SSD, HDD, or USB drive.

Think of your storage device as a huge library.

```
Library
│
├── Books
├── Shelves
├── Labels
└── Categories
```

Without organization, finding a book would be difficult.

Linux organizes data in a similar way.

```
Disk
│
├── Directories
├── Files
├── Metadata
└── Permissions
```

The file system keeps track of:

- File names
- File locations
- Permissions
- Owners
- Sizes
- Timestamps

Without a file system, your operating system wouldn't know where any data is stored.

---

# 3 Why Do We Need a File System?

Imagine a 1 TB SSD.

Without a filesystem:

- Files could overwrite each other.
- Data would become difficult to locate.
- Deleting a file would be nearly impossible.
- The operating system couldn't boot reliably.

A file system provides:

- Organization
- Security
- Performance
- Reliability

---

# 4 Popular Linux File Systems

| File System | Description |
|-------------|-------------|
| ext4 | Most common Linux filesystem |
| XFS | High-performance filesystem |
| Btrfs | Snapshots and advanced features |
| ZFS | Enterprise-grade filesystem |
| FAT32 | Cross-platform compatibility |
| NTFS | Windows filesystem (Linux can read/write it) |
| exFAT | USB drives and SD cards |

For this course, we'll mainly use **ext4**.

---

# 5 Linux File System Hierarchy Standard (FHS)

Linux follows the **Filesystem Hierarchy Standard (FHS)**.

Instead of using drive letters like Windows:

```
C:
D:
E:
```

Linux uses a **single directory tree**.

Everything starts from one location:

```
/
```

This is called the **root directory**.

---

# 6 Linux Directory Tree

```
/
├── bin
├── boot
├── dev
├── etc
├── home
├── lib
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin
├── srv
├── sys
├── tmp
├── usr
└── var
```

Every file and directory on the system exists somewhere under `/`.

---

# 7 Everything is a File

One of Linux's core design principles is:

> **Everything is treated as a file.**

Examples include:

| Resource | Represented As |
|----------|----------------|
| Documents | File |
| Directory | File-like object |
| Hard Disk | File |
| USB Device | File |
| Keyboard | Device file |
| Mouse | Device file |
| Terminal | File |
| Printer | File |

This uniform interface makes automation and scripting much easier.

---

# 8 The Root Directory (`/`)

The root directory is the highest level in the filesystem.

```
/
```

It is **not** the same as the **root user**.

- `/` → Top-level directory
- `root` → Administrator account

Example:

```
/
├── home
├── etc
└── var
```

Every path begins from `/`.

Examples:

```
/home
/etc
/usr
/var
```

---

# 9 Paths in Linux

A **path** tells Linux where a file or directory is located.

Example:

```
/home/student/Documents/report.txt
```

Think of it like a postal address.

```
Country
State
City
Street
House
```

Similarly:

```
/
home
student
Documents
report.txt
```

---

# Absolute Path

An **absolute path** starts from the root directory (`/`).

Examples:

```
/home/student
/etc/passwd
/usr/bin/python3
```

Absolute paths always begin with `/`.

No matter where you currently are, they point to the same location.

---

# Relative Path

A **relative path** starts from your current directory.

Suppose you're in:

```
/home/student
```

Then:

```
Documents
Downloads
Pictures
```

are all relative paths.

If you move to another directory, those relative paths may point somewhere else.

---

# Visual Example

Current directory:

```
/home/student
```

Directory structure:

```
home
└── student
    ├── Documents
    │    └── notes.txt
    └── Downloads
```

Absolute path:

```
/home/student/Documents/notes.txt
```

Relative path:

```
Documents/notes.txt
```

---

# Current Directory (`.`)

A single dot (`.`) refers to the **current directory**.

Example:

```bash
ls .
```

This lists the contents of the directory you are currently in.

---

# Parent Directory (`..`)

Two dots (`..`) refer to the **parent directory**.

Example:

```
/home/student/Documents
```

Using:

```bash
cd ..
```

moves you to:

```
/home/student
```

Using:

```bash
cd ../..
```

moves you to:

```
/home
```

---

# Home Directory (`~`)

The tilde (`~`) represents your home directory.

Example:

```bash
cd ~
```

or simply:

```bash
cd
```

Both commands take you to your home directory.

For example:

```
/home/student
```

---

# Present Working Directory (`pwd`)

`pwd` stands for **Print Working Directory**.

Syntax:

```bash
pwd
```

Example:

```bash
$ pwd
/home/student/Documents
```

This command tells you your current location in the filesystem.

---

# Practice with `pwd`

```bash
pwd
cd /
pwd
cd ~
pwd
```

Expected output:

```
/
```

then

```
/home/student
```

---

# Changing Directories (`cd`)

The `cd` command changes your current directory.

Syntax:

```bash
cd directory_name
```

---

## Move to Home

```bash
cd ~
```

---

## Move to Root

```bash
cd /
```

---

## Move Up One Directory

```bash
cd ..
```

---

## Move Up Two Directories

```bash
cd ../..
```

---

## Go to Previous Directory

```bash
cd -
```

Example:

```
/home/student

↓

/etc

↓

cd -

↓

/home/student
```

---

# Listing Files (`ls`)

The `ls` command displays the contents of a directory.

Syntax:

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
Videos
```

---

# Useful `ls` Options

## Long Listing

```bash
ls -l
```

Displays:

- Permissions
- Owner
- Group
- Size
- Date
- Filename

Example:

```
-rw-r--r-- 1 student student 1200 Jan 12 notes.txt
```

---

## Hidden Files

```bash
ls -a
```

Shows:

```
.
..
.bashrc
.profile
Documents
```

---

## Human Readable

```bash
ls -lh
```

Example:

```
1.2K
4.5M
800M
```

instead of

```
1200
4500000
800000000
```

---

## Combine Options

```bash
ls -lah
```

One of the most commonly used combinations.

---

# Hidden Files

Files beginning with a dot (`.`) are hidden.

Examples:

```
.bashrc
.profile
.gitignore
.ssh
```

These files often contain configuration settings.

---

# Why Hide Files?

Hidden files usually store:

- User preferences
- Shell configuration
- Application settings
- SSH keys
- Git configuration

Hiding them helps prevent accidental modification.

---

# File Naming Rules

Linux allows file names like:

```
notes.txt
hello.c
python_script.py
backup-2025.tar.gz
```

Avoid:

- Spaces (prefer `my_file.txt` over `my file.txt`)
- Special characters unless necessary
- Very long names

Linux filenames are **case-sensitive**.

Example:

```
File.txt
file.txt
FILE.txt
```

These are three different files.

---

# Case Sensitivity

Windows:

```
Report.docx
report.docx
```

Usually treated as the same file.

Linux:

```
Report.docx
report.docx
```

These are different.

Be careful when typing filenames.

---

# Directory Tree Example

```
/
└── home
    └── student
        ├── Desktop
        ├── Documents
        │     ├── Linux
        │     └── Python
        ├── Downloads
        ├── Pictures
        └── Videos
```

Understanding this tree structure is essential for navigating Linux.

---

# Summary

You learned:

- What a filesystem is.
- Why filesystems matter.
- The Linux Filesystem Hierarchy Standard (FHS).
- The root directory (`/`).
- Absolute and relative paths.
- The `pwd` command.
- The `cd` command.
- The `ls` command.
- Hidden files.
- Case sensitivity.
- File naming conventions.

---

# Practice Lab

## Lab 1

Open the terminal.

Run:

```bash
pwd
```

Record the output.

---

## Lab 2

Move to the root directory.

```bash
cd /
pwd
```

---

## Lab 3

Return to your home directory.

```bash
cd ~
pwd
```

---

## Lab 4

Move into the Documents directory.

```bash
cd Documents
pwd
```

If the directory doesn't exist, create it:

```bash
mkdir -p ~/Documents
cd ~/Documents
```

---

## Lab 5

Navigate back to your home directory using:

```bash
cd ..
```

---

## Lab 6

Return to the previous directory using:

```bash
cd -
```

---

## Lab 7

List all files, including hidden ones.

```bash
ls -la
```

Identify at least three hidden files.

---

## Lab 8

Create the following directory structure (you'll learn `mkdir` in detail later):

```bash
mkdir -p ~/linux-practice/{docs,scripts,projects}
```

Verify it:

```bash
ls ~/linux-practice
```

---

# Interview Questions

1. What is a filesystem?
2. What is the root directory?
3. What is the difference between an absolute and a relative path?
4. What does `pwd` do?
5. What does `cd ..` do?
6. What does `cd -` do?
7. Why are some files hidden?
8. Why is Linux case-sensitive?
9. What does the `~` symbol represent?
10. What is the purpose of the FHS (Filesystem Hierarchy Standard)?

---

# What's Next?

In **Part 2**, you'll explore every major top-level directory in Linux:

- `/bin`
- `/boot`
- `/dev`
- `/etc`
- `/home`
- `/lib`
- `/media`
- `/mnt`
- `/opt`
- `/proc`
- `/root`
- `/run`
- `/sbin`
- `/srv`
- `/sys`
- `/tmp`
- `/usr`
- `/var`

You'll learn what each directory contains, why it exists, and how it's used in real Linux systems.
