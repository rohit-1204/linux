
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
---

# Part 2 - Copying, Moving, and Renaming Files & Directories

> In this section, you will learn how to:
>
> - Copy files
> - Copy directories
> - Rename files
> - Move files
> - Move directories
> - Use wildcards
> - Preserve file attributes
> - Avoid common mistakes

---

# Introduction

Creating files is only the beginning.

In real-world Linux systems, you constantly need to:

- Copy configuration files
- Move log files
- Rename scripts
- Backup directories
- Organize projects

Linux provides two primary commands:

```
cp
mv
```

---

# The cp Command

`cp` stands for **Copy**.

It creates a duplicate of a file or directory.

Original remains unchanged.

```
Original
    │
    ├──────────► Copy
```

---

# Command Syntax

```bash
cp [OPTIONS] SOURCE DESTINATION
```

Example:

```bash
cp notes.txt backup.txt
```

Result:

```
notes.txt
backup.txt
```

Both files now exist.

---

# Copying a Single File

Create a file:

```bash
touch report.txt
```

Copy it:

```bash
cp report.txt report_backup.txt
```

Verify:

```bash
ls
```

Output:

```
report.txt
report_backup.txt
```

---

# Copy File into Another Directory

Example structure:

```
Projects/

Documents/
```

Command:

```bash
cp report.txt Documents/
```

Result:

```
Documents

└── report.txt
```

The original still exists.

---

# Copy Multiple Files

Syntax:

```bash
cp file1 file2 file3 destination/
```

Example:

```bash
cp one.txt two.txt three.txt Backup/
```

Result:

```
Backup

├── one.txt
├── two.txt
└── three.txt
```

---

# Interactive Copy

Prevent accidental overwrite.

```bash
cp -i report.txt Backup/
```

If the file exists:

```
cp: overwrite 'Backup/report.txt'?
```

Answer:

```
y
```

or

```
n
```

---

# Verbose Copy

Show every copied file.

```bash
cp -v report.txt Backup/
```

Output:

```
'report.txt' -> 'Backup/report.txt'
```

Useful for backups.

---

# Preserve File Attributes

```bash
cp -p report.txt Backup/
```

Preserves:

- Permissions
- Ownership
- Timestamp

Useful when copying configuration files.

---

# Recursive Copy

Directories require:

```bash
cp -r directory destination
```

Example:

```
Projects

├── HTML
├── CSS
└── JS
```

Copy:

```bash
cp -r Projects Backup
```

Result:

```
Backup

└── Projects
```

---

# Recursive + Verbose

```bash
cp -rv Projects Backup
```

Output:

```
Projects -> Backup/Projects
Projects/index.html
Projects/style.css
```

---

# Recursive + Preserve

```bash
cp -rp Projects Backup
```

Preserves:

- Permissions
- Dates
- Ownership

---

# Common cp Options

| Option | Meaning |
|---------|---------|
| -r | Recursive |
| -R | Recursive |
| -i | Interactive |
| -v | Verbose |
| -p | Preserve attributes |
| -f | Force overwrite |
| -n | Never overwrite |

---

# The mv Command

`mv` means **Move**.

Unlike `cp`:

```
Original

↓

Moved

Original disappears
```

---

# Move a File

Example:

```bash
mv report.txt Documents/
```

Result:

```
Documents

└── report.txt
```

Original location:

```
(empty)
```

---

# Rename a File

Moving inside the same directory changes the name.

Example:

```bash
mv report.txt final_report.txt
```

Result:

```
final_report.txt
```

---

# Rename Multiple Files

Linux does not have a built-in command for batch renaming.

You'll learn advanced methods later using:

- rename
- find
- bash scripting

---

# Move Multiple Files

Example:

```bash
mv one.txt two.txt three.txt Backup/
```

Result:

```
Backup

├── one.txt
├── two.txt
└── three.txt
```

---

# Move a Directory

Example:

```
Projects
```

Move:

```bash
mv Projects Documents/
```

Result:

```
Documents

└── Projects
```

---

# Rename a Directory

Example:

```bash
mv Projects LinuxProjects
```

Result:

```
LinuxProjects
```

---

# Interactive Move

```bash
mv -i report.txt Backup/
```

Linux asks before overwriting.

---

# Verbose Move

```bash
mv -v report.txt Backup/
```

Output:

```
renamed 'report.txt' -> 'Backup/report.txt'
```

---

# Force Move

```bash
mv -f report.txt Backup/
```

Overwrites existing files without asking.

Use carefully.

---

# Understanding Wildcards

Wildcards help match multiple filenames.

Instead of typing every filename individually.

---

# The * Wildcard

Matches:

```
Anything
```

Example:

```
one.txt
two.txt
three.txt
notes.txt
```

Copy all text files:

```bash
cp *.txt Backup/
```

---

# Match All Files

```bash
cp * Backup/
```

Copies every non-hidden file.

---

# The ? Wildcard

Matches:

```
Exactly one character
```

Example:

```
a.txt
b.txt
c.txt
```

Command:

```bash
ls ?.txt
```

Output:

```
a.txt
b.txt
c.txt
```

---

# Character Ranges

Example:

```bash
ls file[1-5].txt
```

Matches:

```
file1.txt
file2.txt
file3.txt
file4.txt
file5.txt
```

---

# Alphabet Range

```bash
ls [a-z]*
```

Shows files beginning with lowercase letters.

---

# Combining Wildcards

Example:

```
report1.txt
report2.txt
report3.txt
```

Copy:

```bash
cp report*.txt Backup/
```

---

# Real World Example

Project:

```
Website

├── HTML
├── CSS
├── JS
└── Images
```

Backup:

```bash
cp -rv Website Website_Backup
```

Output:

```
Website -> Website_Backup
```

---

# Another Example

Rename:

```
draft.txt
```

to

```
final.txt
```

Command:

```bash
mv draft.txt final.txt
```

---

# Common Mistakes

## Forgetting -r

Incorrect:

```bash
cp Projects Backup
```

Output:

```
cp: omitting directory 'Projects'
```

Correct:

```bash
cp -r Projects Backup
```

---

## Overwriting Important Files

Command:

```bash
cp report.txt Backup/
```

Existing file overwritten.

Safer:

```bash
cp -i report.txt Backup/
```

---

## Confusing cp and mv

Remember:

```
cp

Original remains.
```

```
mv

Original disappears.
```

---

# Best Practices

✔ Use `cp -i`

✔ Use `cp -rv`

✔ Verify after copying

```bash
ls
```

✔ Keep backups

✔ Avoid `mv -f` unless necessary

---

# Summary

You learned:

- Copying files
- Copying directories
- Recursive copy
- Moving files
- Moving directories
- Renaming
- Wildcards
- Common mistakes

---

# Practice Lab

## Exercise 1

Create:

```
Practice

├── Files
└── Backup
```

---

## Exercise 2

Create:

```
file1.txt
file2.txt
file3.txt
```

Copy all files into Backup using one command.

---

## Exercise 3

Rename:

```
file1.txt
```

to

```
notes.txt
```

---

## Exercise 4

Move:

```
notes.txt
```

to

```
Backup/
```

---

## Exercise 5

Create:

```
Project

├── HTML
├── CSS
└── JS
```

Copy the entire Project directory into Backup.

---

## Exercise 6

Use:

```bash
cp -v
```

Observe the output.

---

## Exercise 7

Create:

```
test1.txt
test2.txt
test3.txt
```

Copy all files beginning with:

```
test
```

using a wildcard.

---

## Challenge

Build this structure:

```
Portfolio

├── HTML

├── CSS

├── JS

└── Images
```

Create sample files inside each directory.

Then:

- Copy the entire Portfolio directory.
- Rename the copy to `Portfolio_Backup`.
- Move `Portfolio_Backup` into a directory named `Archives`.

---

# Interview Questions

1. What is the difference between `cp` and `mv`?
2. Why is `cp -r` required for directories?
3. What does `cp -p` preserve?
4. Explain the `-i` option.
5. What is the purpose of the `-v` option?
6. What does the `*` wildcard match?
7. What does the `?` wildcard match?
8. How do you rename a file in Linux?
9. How do you move multiple files at once?
10. What happens if `mv` moves a file within the same directory using a new name?

---

# What's Next?

In **Part 3**, you'll learn:

- `rm`
- `rmdir`
- Safe file deletion
- Recursive deletion
- Force deletion
- Empty directories
- Recovering deleted files (limitations)
- File safety best practices
- Real-world cleanup examples

  ---

# Part 3 - Deleting Files and Directories

> **In this section, you will learn:**
>
> - How to delete files safely
> - How to remove empty directories
> - How to delete non-empty directories
> - Force deletion
> - Recursive deletion
> - Understanding risks of `rm`
> - Best practices for safe deletion

---

# Introduction

Creating and copying files is easy.

Managing storage also requires removing files that are:

- No longer needed
- Temporary
- Duplicate
- Outdated
- Corrupted

Linux provides several commands for deleting files and directories.

| Command | Purpose |
|----------|----------|
| rm | Remove files |
| rmdir | Remove empty directories |
| unlink | Remove a single file |
| shred | Securely overwrite and delete files |

The most commonly used command is:

```bash
rm
```

---

# ⚠️ Important Warning

Unlike Windows,

Linux **does not move deleted files to the Recycle Bin** when using terminal commands.

Once deleted using `rm`, recovery is difficult or impossible.

Always double-check before pressing **Enter**.

---

# The rm Command

`rm` stands for:

> **Remove**

Syntax:

```bash
rm filename
```

Example:

```bash
touch notes.txt
```

Delete it:

```bash
rm notes.txt
```

Verify:

```bash
ls
```

Output:

```
(no notes.txt)
```

---

# Delete Multiple Files

Example:

```bash
rm file1.txt file2.txt file3.txt
```

All files are removed.

---

# Delete Using Wildcards

Create files:

```bash
touch test1.txt test2.txt test3.txt
```

Delete:

```bash
rm test*
```

Deletes:

```
test1.txt
test2.txt
test3.txt
```

---

# Delete All Text Files

```bash
rm *.txt
```

Deletes every file ending with:

```
.txt
```

---

# Interactive Deletion

Use:

```bash
rm -i notes.txt
```

Output:

```
rm: remove regular file 'notes.txt'?
```

Type:

```
y
```

or

```
n
```

This is much safer.

---

# Verbose Mode

```bash
rm -v notes.txt
```

Output:

```
removed 'notes.txt'
```

Useful in scripts.

---

# Force Deletion

```bash
rm -f notes.txt
```

Meaning:

- Don't ask for confirmation.
- Ignore missing files.

⚠️ Be careful.

---

# Recursive Deletion

Suppose:

```
Projects

├── HTML
├── CSS
└── JS
```

Delete using:

```bash
rm -r Projects
```

Everything inside is deleted.

---

# Force Recursive Delete

The famous command:

```bash
rm -rf Projects
```

Meaning:

```
-r
```

Recursive

```
-f
```

Force

Deletes everything without confirmation.

---

# ⚠️ Never Run This

```bash
rm -rf /
```

This attempts to delete the entire filesystem.

Modern Linux systems usually protect against this with safeguards, but **never run destructive commands unless you fully understand them**.

---

# Common rm Options

| Option | Meaning |
|----------|----------|
| -r | Recursive |
| -R | Recursive |
| -f | Force |
| -i | Interactive |
| -v | Verbose |
| -d | Remove empty directory |

---

# Removing Empty Directories

Command:

```bash
rmdir EmptyFolder
```

Works only if:

```
EmptyFolder
```

contains nothing.

---

# Example

Create:

```bash
mkdir Test
```

Remove:

```bash
rmdir Test
```

Success.

---

# What if Directory Isn't Empty?

Structure:

```
Test

└── notes.txt
```

Run:

```bash
rmdir Test
```

Output:

```
Directory not empty
```

Use:

```bash
rm -r Test
```

---

# Delete Empty Parent Directories

Example:

```
College

└── SEM5

    └── Linux
```

If all are empty:

```bash
rmdir -p College/SEM5/Linux
```

Removes:

```
Linux

↓

SEM5

↓

College
```

---

# Difference Between rm and rmdir

| rm | rmdir |
|----|--------|
| Removes files | Removes directories |
| Removes non-empty directories | Removes only empty directories |
| More powerful | Safer |

---

# The unlink Command

Syntax:

```bash
unlink filename
```

Example:

```bash
unlink notes.txt
```

Removes exactly one file.

Cannot remove directories.

---

# Secure Deletion

Deleting with:

```bash
rm
```

removes filesystem references, but data may still exist on the disk until overwritten.

To overwrite file contents before removing them, you can use:

```bash
shred
```

Example:

```bash
shred -u secrets.txt
```

Options:

- `-u` → Remove file after overwriting.

> **Note:** On modern SSDs and journaling filesystems, secure deletion is more complex due to wear leveling and other storage mechanisms. `shred` does not guarantee complete data destruction on every storage device.

---

# Common Mistakes

## Mistake 1

Deleting everything accidentally.

Incorrect:

```bash
rm *
```

Without checking:

```bash
pwd
```

Always verify your location first.

---

## Mistake 2

Using:

```bash
rm -rf
```

without understanding.

Always verify:

```bash
ls
```

first.

---

## Mistake 3

Running commands as root.

Example:

```bash
sudo rm -rf project
```

Always confirm the target path.

---

# Safety Tips

Before deleting:

Check location:

```bash
pwd
```

List files:

```bash
ls
```

Use interactive mode:

```bash
rm -i
```

Backup important files.

---

# Real-World Example

Project:

```
Website

├── index.html
├── style.css
├── script.js
└── images/
```

Delete only JavaScript:

```bash
rm script.js
```

Delete images directory:

```bash
rm -r images
```

---

# Cleaning Temporary Files

Delete log files:

```bash
rm *.log
```

Delete backup files:

```bash
rm *.bak
```

Delete temporary files:

```bash
rm *.tmp
```

---

# Verify Deletion

After deleting:

```bash
ls
```

or

```bash
tree
```

Confirm the files or directories are gone.

---

# Best Practices

✅ Check with:

```bash
pwd
```

before deleting.

✅ Prefer:

```bash
rm -i
```

for important files.

✅ Backup before mass deletion.

✅ Avoid `sudo rm -rf` unless absolutely necessary.

✅ Review wildcard patterns before pressing Enter.

---

# Summary

You learned:

- `rm`
- `rmdir`
- `unlink`
- `shred`
- Interactive deletion
- Recursive deletion
- Force deletion
- Secure deletion basics
- Safety tips

---

# Practice Lab

## Exercise 1

Create:

```bash
mkdir Practice
cd Practice
touch file1.txt file2.txt file3.txt
```

Delete:

```
file2.txt
```

---

## Exercise 2

Create:

```
Logs

├── app.log
├── error.log
└── system.log
```

Delete all log files using a wildcard.

---

## Exercise 3

Create:

```
Projects

└── Linux

    └── Shell
```

Delete the entire `Projects` directory recursively.

---

## Exercise 4

Create:

```bash
mkdir EmptyFolder
```

Remove it using:

```bash
rmdir EmptyFolder
```

---

## Exercise 5

Create:

```
Notes

└── linux.txt
```

Try:

```bash
rmdir Notes
```

Observe the error.

Now remove it correctly.

---

## Exercise 6

Create:

```bash
touch secret.txt
```

Delete it using:

```bash
unlink secret.txt
```

---

## Exercise 7

Create:

```bash
touch backup1.bak backup2.bak backup3.bak
```

Delete all backup files with a single command.

---

# Mini Challenge

Build:

```
Training

├── Module1

│   ├── notes.txt
│   └── practice.txt

├── Module2

│   └── test.txt

└── Temp

    ├── temp1.tmp
    └── temp2.tmp
```

Tasks:

1. Delete only `.tmp` files.
2. Remove the empty `Temp` directory.
3. Rename `Module2` to `Assignments`.
4. Delete the entire `Training` directory recursively.

---

# Interview Questions

1. What is the difference between `rm` and `rmdir`?
2. Why does `rmdir` fail on non-empty directories?
3. Explain `rm -r`.
4. Explain `rm -rf`.
5. What does `rm -i` do?
6. What does `rm -f` do?
7. What is `unlink`?
8. What is `shred` used for?
9. Why should you avoid running `rm` as root unnecessarily?
10. What precautions should you take before deleting files?

---

# What's Next?

In **Part 4**, you'll learn:

- Viewing file contents with `cat`, `less`, `more`
- Displaying the beginning and end of files with `head` and `tail`
- Numbering lines with `nl`
- Counting lines, words, and bytes with `wc`
- Monitoring log files in real time
- Practical examples and exercises

  ---

# Part 4 - Viewing File Contents

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - View file contents
> - Read very large files efficiently
> - Display the beginning and end of files
> - Count lines, words, and characters
> - Sort file contents
> - Remove duplicate lines
> - Display line numbers
> - Monitor log files in real time

---

# Introduction

Linux provides many commands for reading files.

Each command is designed for a different purpose.

| Command | Purpose |
|----------|---------|
| cat | Display entire file |
| less | Read large files |
| more | Read files page by page |
| head | Display first lines |
| tail | Display last lines |
| nl | Display line numbers |
| wc | Count lines, words, bytes |
| sort | Sort lines |
| uniq | Remove duplicate lines |

---

# Sample File

Create a practice file.

```bash
cat > students.txt
```

Type:

```text
Alice
Bob
Charlie
David
Emma
Frank
Grace
Henry
Isabella
Jack
```

Press:

```
Ctrl + D
```

Save the file.

---

# The cat Command

`cat` stands for **Concatenate**.

Although it can combine files, it is most commonly used to display file contents.

Syntax

```bash
cat filename
```

Example

```bash
cat students.txt
```

Output

```text
Alice
Bob
Charlie
David
Emma
Frank
Grace
Henry
Isabella
Jack
```

---

# Display Multiple Files

Create another file.

```bash
touch teachers.txt
```

Add content.

```bash
echo "Professor John" > teachers.txt
echo "Professor Alice" >> teachers.txt
```

Display both files.

```bash
cat students.txt teachers.txt
```

---

# Create a File Using cat

```bash
cat > notes.txt
```

Type:

```text
Linux is amazing.
Practice every day.
```

Press:

```
Ctrl + D
```

Verify:

```bash
cat notes.txt
```

---

# Append Using cat

```bash
cat >> notes.txt
```

Add:

```text
Learn shell scripting.
```

Press:

```
Ctrl + D
```

---

# Number Lines

```bash
cat -n students.txt
```

Output

```text
1  Alice
2  Bob
3  Charlie
4  David
```

---

# Display Special Characters

```bash
cat -A students.txt
```

Useful for debugging files with hidden characters.

Example output

```text
Alice$
Bob$
Charlie$
```

`$` represents the end of each line.

---

# The less Command

`less` is the preferred tool for reading large files.

Syntax

```bash
less filename
```

Example

```bash
less students.txt
```

Advantages

- Doesn't load the entire file into memory.
- Allows forward and backward movement.
- Search support.
- Efficient for log files.

---

# Navigation in less

| Key | Action |
|------|--------|
| Space | Next page |
| b | Previous page |
| Enter | Next line |
| G | Last line |
| g | First line |
| /text | Search |
| n | Next search result |
| N | Previous search result |
| q | Quit |

---

# Searching in less

Open:

```bash
less students.txt
```

Search:

```text
Grace
```

Press:

```
Enter
```

Move to next result.

```
n
```

---

# The more Command

Older pager.

```bash
more students.txt
```

Features

- Scroll forward
- No backward scrolling on many systems

Modern Linux users generally prefer `less`.

---

# head Command

Displays the beginning of a file.

Syntax

```bash
head filename
```

Example

```bash
head students.txt
```

Default:

First 10 lines.

---

# Show Specific Number of Lines

```bash
head -5 students.txt
```

Output

```text
Alice
Bob
Charlie
David
Emma
```

---

# tail Command

Displays the end of a file.

Syntax

```bash
tail filename
```

Example

```bash
tail students.txt
```

Default:

Last 10 lines.

---

# Display Last 3 Lines

```bash
tail -3 students.txt
```

Output

```text
Henry
Isabella
Jack
```

---

# Monitor a Log File

One of the most useful Linux commands.

```bash
tail -f /var/log/syslog
```

or

```bash
tail -f /var/log/auth.log
```

`-f`

means

```
Follow
```

The terminal updates automatically as new lines are added.

Press:

```
Ctrl + C
```

to stop.

---

# Real World Example

Watch a web server log.

```bash
tail -f /var/log/nginx/access.log
```

As users visit the website, new entries appear instantly.

---

# The nl Command

Displays line numbers.

```bash
nl students.txt
```

Output

```text
1 Alice
2 Bob
3 Charlie
```

Useful when editing configuration files.

---

# The wc Command

`wc`

stands for

```
Word Count
```

Syntax

```bash
wc filename
```

Example

```bash
wc students.txt
```

Output

```text
10 10 62 students.txt
```

Meaning

```
Lines
Words
Bytes
```

---

# Useful wc Options

Count lines

```bash
wc -l students.txt
```

Count words

```bash
wc -w students.txt
```

Count characters

```bash
wc -m students.txt
```

Count bytes

```bash
wc -c students.txt
```

---

# sort Command

Sorts lines alphabetically.

Example

Create file.

```bash
cat > fruits.txt
```

```
Orange
Apple
Banana
Mango
Grapes
```

Sort.

```bash
sort fruits.txt
```

Output

```text
Apple
Banana
Grapes
Mango
Orange
```

---

# Reverse Sort

```bash
sort -r fruits.txt
```

Output

```text
Orange
Mango
Grapes
Banana
Apple
```

---

# Numeric Sort

File

```
10
2
25
1
100
```

Command

```bash
sort -n numbers.txt
```

Output

```text
1
2
10
25
100
```

---

# uniq Command

Removes consecutive duplicate lines.

Example

```
Apple
Apple
Banana
Banana
Orange
```

Run

```bash
uniq fruits.txt
```

Output

```text
Apple
Banana
Orange
```

---

# Count Duplicate Lines

```bash
uniq -c fruits.txt
```

Output

```text
2 Apple
2 Banana
1 Orange
```

---

# Combine sort and uniq

Since `uniq` only removes adjacent duplicates, it's common to sort first.

```bash
sort fruits.txt | uniq
```

Or count duplicates:

```bash
sort fruits.txt | uniq -c
```

---

# Compare cat, more, and less

| Feature | cat | more | less |
|---------|-----|------|------|
| Small files | ✅ | ✅ | ✅ |
| Large files | ❌ | ⚠️ | ✅ |
| Search | ❌ | Limited | ✅ |
| Backward scroll | ❌ | Limited | ✅ |
| Efficient | ❌ | Moderate | ✅ |

---

# Best Practices

✔ Use `cat` for small files.

✔ Use `less` for large files.

✔ Use `tail -f` for logs.

✔ Use `wc` to analyze file size.

✔ Use `sort | uniq` for duplicate removal.

✔ Learn keyboard shortcuts inside `less`.

---

# Common Mistakes

❌ Using `cat` on a huge log file.

Instead:

```bash
less logfile.log
```

---

❌ Forgetting `sort` before `uniq`.

Incorrect

```bash
uniq file.txt
```

Correct

```bash
sort file.txt | uniq
```

---

❌ Using `tail` instead of `head`.

Remember:

```
head

Beginning
```

```
tail

End
```

---

# Summary

You learned

- cat
- less
- more
- head
- tail
- nl
- wc
- sort
- uniq

You also learned when to use each command.

---

# Practice Lab

## Exercise 1

Create:

```bash
touch names.txt
```

Add ten names.

Display them using:

```bash
cat names.txt
```

---

## Exercise 2

Display line numbers.

```bash
nl names.txt
```

---

## Exercise 3

Display only the first five lines.

```bash
head -5 names.txt
```

---

## Exercise 4

Display the last three lines.

```bash
tail -3 names.txt
```

---

## Exercise 5

Count:

- Lines
- Words
- Characters

using `wc`.

---

## Exercise 6

Create an unsorted fruit list.

Sort it alphabetically.

---

## Exercise 7

Create duplicate entries.

Use:

```bash
sort fruits.txt | uniq -c
```

---

## Exercise 8

Open a large system file.

```bash
less /etc/services
```

Practice:

- Search
- Scroll
- Quit

---

# Mini Challenge

Create a file called:

```
employees.txt
```

Requirements:

- Add 20 employee names.
- Display line numbers.
- Sort alphabetically.
- Count total lines.
- Show first 5 names.
- Show last 5 names.
- Add duplicate names.
- Count duplicates using `uniq -c`.

---

# Interview Questions

1. What is the purpose of `cat`?
2. Why is `less` preferred over `more`?
3. What does `head -5` do?
4. What is `tail -f` used for?
5. What information does `wc` provide?
6. Why should `sort` be used before `uniq`?
7. What is the difference between `cat -n` and `nl`?
8. Which command is best for reading large log files?
9. How do you display only the last 20 lines of a file?
10. Explain a real-world use case for `tail -f`.

---

# What's Next?

In **Part 5**, you'll learn one of the most powerful topics in Linux:

- `find`
- `locate`
- `which`
- `whereis`
- `basename`
- `dirname`
- `realpath`
- `stat`
- `tree`

These commands will help you search, inspect, and understand files and directories efficiently.


---

# Part 5A – Searching Files & Directories

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Search files efficiently using `find`
> - Search files quickly using `locate`
> - Find executable programs using `which`
> - Find binary, source, and manual pages using `whereis`
> - Use search filters like name, type, size, owner, and time
> - Execute commands on search results
> - Follow Linux search best practices

---

# Introduction

As your Linux system grows, manually searching for files becomes difficult.

Linux provides several powerful search utilities.

| Command | Purpose |
|----------|----------|
| `find` | Search files and directories using many conditions |
| `locate` | Search files using a pre-built database |
| `which` | Locate executable commands |
| `whereis` | Find binaries, source code, and man pages |

---

# Understanding the find Command

The **find** command recursively searches directories.

It is one of the most powerful commands in Linux.

Syntax:

```bash
find [PATH] [OPTIONS] [EXPRESSION]
```

Example:

```bash
find . -name "notes.txt"
```

Meaning:

- `.` → Search current directory
- `-name` → Search by filename
- `"notes.txt"` → File name to search

---

# Directory Search Example

Suppose your directory structure is:

```
Projects/

├── HTML
│   └── index.html
│
├── CSS
│   └── style.css
│
├── JS
│   └── app.js
│
└── README.md
```

Command:

```bash
find . -name "README.md"
```

Output:

```
./Projects/README.md
```

---

# Search by Exact Name

```bash
find . -name "report.txt"
```

Finds only:

```
report.txt
```

---

# Case-Insensitive Search

Instead of:

```bash
report.txt
Report.txt
REPORT.TXT
```

Use:

```bash
find . -iname "report.txt"
```

`-iname`

means:

```
Ignore case
```

---

# Search Using Wildcards

Find all text files:

```bash
find . -name "*.txt"
```

Output:

```
notes.txt
report.txt
data.txt
```

---

Find Markdown files:

```bash
find . -name "*.md"
```

---

Find shell scripts:

```bash
find . -name "*.sh"
```

---

# Search by File Type

Linux identifies different file types.

| Option | Type |
|---------|------|
| `f` | File |
| `d` | Directory |
| `l` | Symbolic Link |

Search directories only:

```bash
find . -type d
```

Output:

```
Projects
Projects/HTML
Projects/CSS
Projects/JS
```

---

Search regular files:

```bash
find . -type f
```

---

# Search Inside a Specific Directory

Search only inside Documents.

```bash
find ~/Documents -name "*.pdf"
```

---

Search inside `/etc`.

```bash
find /etc -name "*.conf"
```

---

# Search by Size

Find files larger than 10 MB.

```bash
find . -size +10M
```

Find files smaller than 1 MB.

```bash
find . -size -1M
```

Find exactly 100 MB.

```bash
find . -size 100M
```

---

# Size Units

| Unit | Meaning |
|------|----------|
| c | Bytes |
| k | Kilobytes |
| M | Megabytes |
| G | Gigabytes |

Examples:

```bash
find . -size +500k
```

```bash
find . -size +2G
```

---

# Search by Empty Files

```bash
find . -empty
```

Useful for cleanup.

---

# Search by Owner

Find files owned by user:

```bash
find . -user student
```

---

# Search by Group

```bash
find . -group developers
```

---

# Search by Permissions

Find files with permission:

```bash
find . -perm 644
```

Find executable files:

```bash
find . -perm /111
```

---

# Search by Modification Time

Modified within last day:

```bash
find . -mtime -1
```

Modified more than seven days ago:

```bash
find . -mtime +7
```

---

# Search by Access Time

```bash
find . -atime -5
```

Accessed within last five days.

---

# Search by Creation Time

Some Linux file systems support:

```bash
find . -ctime -2
```

---

# Search Multiple Conditions

Example:

Find all shell scripts larger than 1 MB.

```bash
find . -name "*.sh" -size +1M
```

---

Find PDF files inside Documents.

```bash
find ~/Documents -type f -name "*.pdf"
```

---

# Execute Commands on Search Results

Delete all log files.

```bash
find . -name "*.log" -delete
```

---

List detailed information.

```bash
find . -name "*.txt" -exec ls -l {} \;
```

Explanation:

```
{} → Current file

\; → End of command
```

---

Open every text file.

```bash
find . -name "*.txt" -exec cat {} \;
```

---

# Find and Remove Empty Files

```bash
find . -type f -empty -delete
```

---

# Limit Search Depth

Current directory only:

```bash
find . -maxdepth 1
```

Maximum three levels.

```bash
find . -maxdepth 3
```

---

# Exclude Directories

Skip `.git`.

```bash
find . -path "./.git" -prune -o -name "*.py" -print
```

---

# The locate Command

Unlike `find`, `locate` searches a database instead of scanning the filesystem.

Much faster.

Syntax:

```bash
locate filename
```

Example:

```bash
locate passwd
```

Output:

```
/etc/passwd
/usr/share/doc/passwd
```

---

# Updating the locate Database

If a newly created file doesn't appear:

```bash
sudo updatedb
```

Then search again.

---

# locate vs find

| Feature | find | locate |
|----------|------|---------|
| Speed | Slower | Very Fast |
| Real-time | Yes | No |
| Database Required | No | Yes |
| Search Accuracy | Current Files | Database Entries |

---

# The which Command

Finds executable programs in your PATH.

Syntax:

```bash
which command
```

Example:

```bash
which python3
```

Output:

```
/usr/bin/python3
```

---

More examples:

```bash
which bash
```

```bash
which git
```

```bash
which ls
```

---

If the command doesn't exist:

```bash
which hello
```

Output:

```
(no output)
```

---

# The whereis Command

Shows:

- Binary
- Source
- Manual pages

Syntax:

```bash
whereis command
```

Example:

```bash
whereis bash
```

Output:

```
bash:
/usr/bin/bash
/usr/share/man/man1/bash.1.gz
```

---

Another example:

```bash
whereis python3
```

---

# which vs whereis

| Feature | which | whereis |
|----------|--------|----------|
| Executable Path | ✅ | ✅ |
| Source Files | ❌ | ✅ |
| Manual Pages | ❌ | ✅ |
| Uses PATH | ✅ | No |

---

# Real-World Examples

Find all Python files:

```bash
find ~/Projects -name "*.py"
```

Find all log files larger than 100 MB:

```bash
find /var/log -name "*.log" -size +100M
```

Find all empty directories:

```bash
find . -type d -empty
```

Locate the Git executable:

```bash
which git
```

Find Git binary and manual:

```bash
whereis git
```

---

# Best Practices

✅ Prefer `find` for accurate, real-time searches.

✅ Use `locate` when speed matters.

✅ Update the `locate` database regularly.

✅ Test your `find` command before adding `-delete`.

✅ Combine filters to reduce unnecessary results.

---

# Common Mistakes

❌ Running:

```bash
find / -name "*.log"
```

without `sudo`.

Many directories will return:

```
Permission denied
```

---

❌ Using:

```bash
find . -delete
```

without checking the results first.

Always test:

```bash
find . -name "*.tmp"
```

before adding:

```bash
-delete
```

---

❌ Forgetting to update the `locate` database.

```bash
sudo updatedb
```

---

# Summary

In this section, you learned:

- `find`
- `locate`
- `which`
- `whereis`
- Searching by name
- Searching by type
- Searching by size
- Searching by permissions
- Searching by owner
- Executing commands on search results
- Safe search practices

---

# Practice Lab

## Exercise 1

Create:

```bash
mkdir SearchLab
cd SearchLab

touch notes.txt
touch report.pdf
touch script.sh
touch image.png
```

Find all `.txt` files.

---

## Exercise 2

Find only directories.

```bash
find . -type d
```

---

## Exercise 3

Create an empty file.

```bash
touch empty.txt
```

Search for empty files.

---

## Exercise 4

Find all shell scripts.

```bash
find . -name "*.sh"
```

---

## Exercise 5

Locate the Python executable.

```bash
which python3
```

---

## Exercise 6

Find the Bash binary and man page.

```bash
whereis bash
```

---

## Exercise 7

Update the locate database and search for:

```bash
passwd
```

---

# Interview Questions

1. What is the difference between `find` and `locate`?
2. Why is `locate` faster than `find`?
3. What does `-type f` mean?
4. How do you search for directories only?
5. Explain `-iname`.
6. What is the purpose of `which`?
7. What information does `whereis` provide?
8. How do you search for files larger than 1 GB?
9. What does `-exec` do in the `find` command?
10. Why should you test a `find` command before using `-delete`?

---

# What's Next?

In **Part 5B**, you'll learn:

- `basename`
- `dirname`
- `realpath`
- `stat`
- `tree`
- File metadata
- Directory visualization
- Mini project
- Cheat sheet
- Final chapter summary


  ---

# Part 5B-1 – Path Utilities & File Information

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand Linux file paths
> - Extract filenames from paths
> - Extract directory names from paths
> - Convert relative paths into absolute paths
> - View detailed file metadata
> - Display directory structures in a tree format

---

# Introduction

Linux provides several utilities for working with file paths and metadata.

These commands are especially useful in:

- Shell scripting
- System administration
- DevOps automation
- Debugging
- File management

| Command | Purpose |
|----------|---------|
| `basename` | Extract filename from a path |
| `dirname` | Extract directory from a path |
| `realpath` | Show absolute path |
| `stat` | Display detailed file information |
| `tree` | Display directory structure |

---

# Understanding Linux Paths

Consider the following file:

```
/home/student/Documents/Linux/notes.md
```

This path contains:

```
/

└── home

    └── student

        └── Documents

            └── Linux

                └── notes.md
```

The complete path is called an **Absolute Path**.

---

# Absolute vs Relative Paths

Absolute Path

```text
/home/student/Documents/Linux/notes.md
```

Always starts with:

```text
/
```

Relative Path

```text
Documents/Linux/notes.md
```

Starts from the current directory.

---

# basename Command

`basename` extracts only the filename from a path.

Syntax

```bash
basename PATH
```

Example

```bash
basename /home/student/Documents/Linux/notes.md
```

Output

```text
notes.md
```

---

# More Examples

```bash
basename /etc/passwd
```

Output

```text
passwd
```

---

```bash
basename /usr/bin/python3
```

Output

```text
python3
```

---

# Remove File Extension

Syntax

```bash
basename FILE EXTENSION
```

Example

```bash
basename report.txt .txt
```

Output

```text
report
```

---

Example

```bash
basename backup.tar.gz .gz
```

Output

```text
backup.tar
```

Notice only the specified extension is removed.

---

# Real World Example

Suppose a script receives:

```text
/home/student/photos/image001.jpg
```

Extract filename:

```bash
basename /home/student/photos/image001.jpg
```

Output

```text
image001.jpg
```

Useful in shell scripts.

---

# dirname Command

`dirname` extracts only the directory path.

Syntax

```bash
dirname PATH
```

Example

```bash
dirname /home/student/Documents/Linux/notes.md
```

Output

```text
/home/student/Documents/Linux
```

---

# More Examples

```bash
dirname /etc/passwd
```

Output

```text
/etc
```

---

```bash
dirname /usr/bin/python3
```

Output

```text
/usr/bin
```

---

# Visual Example

Path

```text
/home/student/Documents/report.pdf
```

```
dirname

↓

/home/student/Documents
```

```
basename

↓

report.pdf
```

---

# Combining dirname and basename

Input

```text
/home/student/Linux/script.sh
```

Commands

```bash
dirname /home/student/Linux/script.sh
```

Output

```text
/home/student/Linux
```

---

```bash
basename /home/student/Linux/script.sh
```

Output

```text
script.sh
```

---

# realpath Command

`realpath` converts a relative path into a complete absolute path.

Syntax

```bash
realpath FILE
```

Example

Current directory

```text
/home/student
```

Command

```bash
realpath notes.txt
```

Output

```text
/home/student/notes.txt
```

---

# Another Example

Current directory

```text
/home/student/Documents
```

Command

```bash
realpath ../Downloads
```

Output

```text
/home/student/Downloads
```

---

# Why realpath is Useful

Shell scripts often receive relative paths.

Using:

```bash
realpath
```

ensures the script always works with the full path.

---

# stat Command

One of the most useful Linux commands.

Displays detailed file metadata.

Syntax

```bash
stat filename
```

Example

```bash
stat notes.txt
```

Sample Output

```text
File: notes.txt
Size: 1520
Blocks: 8
IO Block: 4096
File: Regular File
Device: 802h
Inode: 345671
Links: 1

Access: 2026-07-03
Modify: 2026-07-03
Change: 2026-07-03
```

---

# Understanding stat Output

| Field | Description |
|---------|-------------|
| File | File name |
| Size | File size |
| Blocks | Disk blocks used |
| File Type | Regular file, directory, link |
| Inode | Unique file identifier |
| Links | Number of hard links |
| Access | Last access time |
| Modify | Last content modification |
| Change | Last metadata modification |

---

# File Size Example

```bash
stat report.pdf
```

Output

```text
Size: 2048576
```

Meaning

```
2 MB
```

approximately.

---

# Check Directory Information

```bash
stat Documents
```

Directories also have metadata.

---

# Display Only File Size

Using format options:

```bash
stat -c %s notes.txt
```

Output

```text
1520
```

---

# Display Only Permissions

```bash
stat -c %A notes.txt
```

Example

```text
-rw-r--r--
```

We'll study permissions in detail later.

---

# tree Command

Displays directories in a tree structure.

Install (if required)

Ubuntu

```bash
sudo apt install tree
```

RHEL/CentOS

```bash
sudo dnf install tree
```

---

# Basic Usage

```bash
tree
```

Example Output

```text
Projects

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

# Display Only Directories

```bash
tree -d
```

Output

```text
Projects

├── HTML

├── CSS

└── JS
```

---

# Limit Tree Depth

Show only two levels.

```bash
tree -L 2
```

Output

```text
Projects

├── HTML

├── CSS

├── JS

└── Images
```

---

# Include Hidden Files

```bash
tree -a
```

Shows

```
.git

.env

.config
```

---

# Display File Sizes

```bash
tree -h
```

Example

```text
README.md (2 KB)

style.css (5 KB)
```

---

# Display Number of Files

```bash
tree
```

Bottom Output

```text
5 directories

18 files
```

---

# Compare Commands

| Command | Purpose |
|----------|----------|
| basename | Extract filename |
| dirname | Extract directory |
| realpath | Convert to absolute path |
| stat | Display metadata |
| tree | Visualize directory structure |

---

# Real-World Example

Suppose your project is:

```text
Portfolio/

├── HTML

├── CSS

├── JS

└── Images
```

Display structure

```bash
tree Portfolio
```

Find absolute path

```bash
realpath Portfolio
```

Check metadata

```bash
stat Portfolio
```

Extract project name

```bash
basename ~/Projects/Portfolio
```

Output

```text
Portfolio
```

---

# Best Practices

✅ Use `realpath` in shell scripts.

✅ Use `tree` to understand project structures.

✅ Use `stat` when troubleshooting file metadata.

✅ Use `basename` and `dirname` instead of manually parsing paths.

---

# Common Mistakes

❌ Assuming `basename` removes all extensions.

Example

```bash
basename backup.tar.gz .gz
```

Output

```text
backup.tar
```

Not

```text
backup
```

---

❌ Using `tree` without installing it.

If you see:

```text
tree: command not found
```

Install the package.

---

❌ Confusing `stat` timestamps.

Remember:

- **Access** → Last read
- **Modify** → File content changed
- **Change** → Metadata changed

---

# Summary

In this section, you learned:

- `basename`
- `dirname`
- `realpath`
- `stat`
- `tree`
- Linux path handling
- File metadata
- Directory visualization

---

# Coming Next

In **Part 5B-2**, you'll learn:

- Understanding file metadata in detail
- Introduction to inodes
- Practical file inspection
- Practice Labs
- Mini Project
- Cheat Sheet
- Interview Questions
- Final Chapter Summary


---

# Part 5B-2 – File Metadata, Inodes, Cheat Sheet & Mini Project

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand Linux file metadata
> - Learn what an inode is
> - View inode information
> - Understand timestamps
> - Analyze directory structures
> - Complete a real-world practice project
> - Review all commands learned in Chapter 05

---

# Understanding File Metadata

Every file in Linux has two major parts.

```
+----------------------------+
|        File Name           |
+----------------------------+
              │
              ▼
+----------------------------+
|          Inode             |
+----------------------------+
              │
              ▼
+----------------------------+
|        File Data           |
+----------------------------+
```

The **filename** is simply a label.

The **inode** stores all important information about the file.

---

# What is an Inode?

An **inode** (Index Node) is a data structure used by the Linux filesystem.

Every file and directory has an inode number.

The inode stores:

- File type
- File permissions
- Owner
- Group
- File size
- Number of hard links
- Access time
- Modification time
- Change time
- Disk block locations

**Important:** The inode **does not** store the filename.

---

# Visual Representation

```
Filename

notes.txt
      │
      ▼
+--------------------+
| Inode #123456      |
+--------------------+
| Owner              |
| Permissions        |
| Size               |
| Time Stamps        |
| Disk Blocks        |
+--------------------+
      │
      ▼
Actual File Data
```

---

# View Inode Number

Use:

```bash
ls -i
```

Example:

```text
348721 notes.txt
```

The first number is the inode.

---

# View Detailed Metadata

```bash
stat notes.txt
```

Example:

```text
File: notes.txt
Size: 2048
Blocks: 8
IO Block: 4096
Inode: 348721
Links: 1
Access: 2026-07-03
Modify: 2026-07-03
Change: 2026-07-03
```

---

# Understanding Linux Timestamps

Linux maintains three important timestamps.

| Timestamp | Meaning |
|-----------|---------|
| Access Time (atime) | Last time the file was read |
| Modify Time (mtime) | Last time the file content changed |
| Change Time (ctime) | Last time metadata changed |

---

# Access Time (atime)

Example:

```bash
cat notes.txt
```

Reading the file updates the access time.

Check:

```bash
stat notes.txt
```

---

# Modify Time (mtime)

Edit the file:

```bash
nano notes.txt
```

Save it.

The modification time changes because the file content changed.

---

# Change Time (ctime)

Run:

```bash
chmod +x notes.txt
```

The content stays the same.

However,

Permissions changed.

Therefore,

```
ctime
```

changes.

---

# File Permissions Preview

Example:

```bash
-rw-r--r--
```

Breakdown:

```
-

Regular file

rw-

Owner permissions

r--

Group permissions

r--

Others permissions
```

A full permissions chapter will cover this in detail.

---

# File Types

Linux recognizes several file types.

| Symbol | File Type |
|---------|-----------|
| - | Regular File |
| d | Directory |
| l | Symbolic Link |
| c | Character Device |
| b | Block Device |
| p | Named Pipe |
| s | Socket |

Example:

```bash
ls -l
```

Output:

```text
drwxr-xr-x Documents
-rw-r--r-- notes.txt
lrwxrwxrwx python -> python3
```

---

# Viewing File Information

Display inode numbers.

```bash
ls -i
```

Display hidden files.

```bash
ls -la
```

Display human-readable sizes.

```bash
ls -lh
```

Display recursively.

```bash
ls -R
```

---

# Understanding Directory Metadata

Directories also have metadata.

Example:

```bash
stat Documents
```

Output:

```text
File: Documents
Size: 4096
Links: 5
```

Directories themselves are files.

---

# Understanding File Size

Display size.

```bash
stat notes.txt
```

or

```bash
ls -lh notes.txt
```

Example:

```text
2.0K
```

---

# Check Absolute Path

```bash
realpath notes.txt
```

Output:

```text
/home/student/notes.txt
```

---

# Visualizing a Project

Project:

```text
Portfolio/

├── HTML

│   ├── index.html

│   └── about.html

├── CSS

│   └── style.css

├── JS

│   └── app.js

├── Images

│   ├── logo.png

│   └── banner.jpg

└── README.md
```

Display:

```bash
tree Portfolio
```

---

# Real World Scenario

Suppose someone reports:

```
The application cannot find config.json
```

Steps:

Locate the file.

```bash
find . -name "config.json"
```

Find absolute path.

```bash
realpath config.json
```

View metadata.

```bash
stat config.json
```

Display directory.

```bash
dirname $(realpath config.json)
```

Display filename.

```bash
basename $(realpath config.json)
```

---

# Command Cheat Sheet

## Navigation

```bash
pwd
cd
ls
```

---

## Create

```bash
mkdir
touch
```

---

## Copy

```bash
cp
cp -r
```

---

## Move

```bash
mv
```

---

## Delete

```bash
rm
rm -r
rmdir
```

---

## View Files

```bash
cat
less
more
head
tail
nl
wc
sort
uniq
```

---

## Search

```bash
find
locate
which
whereis
```

---

## Path Utilities

```bash
basename
dirname
realpath
```

---

## File Information

```bash
stat
tree
ls -l
ls -lh
ls -la
```

---

# Best Practices

✅ Use meaningful filenames.

✅ Keep projects organized.

✅ Verify before deleting.

✅ Use `find` before `rm`.

✅ Use `tree` to understand directory layouts.

✅ Use `stat` when troubleshooting.

✅ Prefer absolute paths in scripts.

---

# Common Mistakes

❌ Forgetting the current directory.

Always check:

```bash
pwd
```

---

❌ Deleting files without verification.

Safer:

```bash
ls
```

before

```bash
rm
```

---

❌ Ignoring hidden files.

Remember:

```bash
ls -la
```

---

❌ Confusing directories and files.

Remember:

```
File

contains data
```

```
Directory

contains filenames
```

---

# Mini Project

## Project: Organize a Student Workspace

### Step 1

Create the following structure.

```text
StudentWorkspace

├── Assignments

│   ├── Linux

│   ├── Python

│   └── Java

├── Notes

├── Projects

└── Backup
```

---

### Step 2

Create sample files.

```bash
touch Notes/linux.md
touch Notes/python.md

touch Projects/project1.txt
touch Projects/project2.txt
```

---

### Step 3

Copy Notes into Backup.

```bash
cp -r Notes Backup
```

---

### Step 4

Rename:

```
project1.txt
```

to

```
linux-project.txt
```

---

### Step 5

Search.

Find every Markdown file.

```bash
find . -name "*.md"
```

---

### Step 6

Display metadata.

```bash
stat Notes/linux.md
```

---

### Step 7

Display project tree.

```bash
tree StudentWorkspace
```

---

### Step 8

Display inode numbers.

```bash
ls -i
```

---

# Practice Lab

## Exercise 1

Find all directories.

```bash
find . -type d
```

---

## Exercise 2

Find all empty files.

```bash
find . -empty
```

---

## Exercise 3

Display inode numbers.

```bash
ls -i
```

---

## Exercise 4

Display metadata of every file.

```bash
stat *
```

---

## Exercise 5

Display directory tree.

```bash
tree
```

---

## Exercise 6

Display only the filename.

```bash
basename /home/student/report.pdf
```

---

## Exercise 7

Display only the directory.

```bash
dirname /home/student/report.pdf
```

---

## Exercise 8

Convert a relative path into an absolute path.

```bash
realpath report.pdf
```

---

# Interview Questions

1. What is an inode?
2. Does an inode store the filename?
3. What is the difference between `basename` and `dirname`?
4. What is `realpath` used for?
5. Explain `stat`.
6. What is the purpose of `tree`?
7. Explain the difference between **atime**, **mtime**, and **ctime**.
8. How do you display inode numbers?
9. What command displays detailed file metadata?
10. Why are absolute paths preferred in scripts?

---

# Chapter Summary

Congratulations! 🎉

You have completed **Chapter 05 – File and Directory Commands**.

In this chapter, you learned:

- Creating files and directories
- Navigating the filesystem
- Copying and moving files
- Renaming files and directories
- Deleting files safely
- Viewing file contents
- Searching files and directories
- Understanding file paths
- Viewing file metadata
- Working with directory trees
- Understanding Linux inodes
- Using professional Linux file management techniques

These commands form the foundation of Linux system administration, shell scripting, DevOps, and software development.

---

# What's Next?

In **Chapter 06 – File Permissions & Ownership**, you will learn:

- Linux permission model
- Users and groups
- `chmod`
- `chown`
- `chgrp`
- Numeric permissions
- Symbolic permissions
- Special permissions (SUID, SGID, Sticky Bit)
- `umask`
- Real-world permission scenarios
- Security best practices
- Practice labs and mini projects


