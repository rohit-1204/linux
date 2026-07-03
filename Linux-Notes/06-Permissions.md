# Chapter 06 - File Permissions and Ownership

---

# Part 1A - Linux Security Model, Users & Groups

## Section 1 - Introduction to Linux Permissions

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand why Linux permissions exist.
> - Learn the Linux security model.
> - Understand users and groups.
> - Know why every file has an owner.
> - Understand the principle of least privilege.
> - Prepare for learning file permissions.

---

# Introduction

Linux is a **multi-user operating system**.

Unlike operating systems designed primarily for a single user, Linux allows multiple users to access the same computer simultaneously.

Each user has:

- A username
- A password
- A home directory
- Personal files
- Individual permissions

This makes Linux secure, reliable, and suitable for servers where hundreds or even thousands of users may be connected at the same time.

---

# Why Linux Needs Permissions

Imagine a company server with the following users:

```
Alice (HR)

Bob (Developer)

Charlie (Manager)

David (Intern)
```

All users work on the same Linux server.

Without permissions:

```
Everyone can

Read files

Modify files

Delete files

Run programs

Access confidential information
```

This would create serious security problems.

Linux solves this using a permission system.

---

# Example Scenario

Suppose the server contains:

```
/company

├── HR

│   └── salaries.xlsx

├── Development

│   └── app.py

├── Finance

│   └── budget.xlsx

└── Public

    └── notice.txt
```

Desired permissions:

| User | Allowed Access |
|---------|---------------|
| HR | HR folder |
| Developers | Development folder |
| Finance | Finance folder |
| Everyone | Public folder |

Linux permissions make this possible.

---

# Linux Security Model

Linux security is based on three concepts.

```
User

↓

Group

↓

Permissions
```

Every file and directory has:

- An owner (user)
- An owner group
- A permission set

Together these determine who can access the file.

---

# The Three Security Components

```
+-------------------------+
|        User             |
+-------------------------+

            │

            ▼

+-------------------------+
|        Group            |
+-------------------------+

            │

            ▼

+-------------------------+
|     Permissions         |
+-------------------------+
```

Whenever someone tries to access a file, Linux checks these components before allowing access.

---

# Authentication vs Authorization

Many beginners confuse these two terms.

## Authentication

Authentication answers the question:

```
Who are you?
```

Example:

```
Username:

student

Password:

********
```

If the credentials are correct, Linux allows the user to log in.

---

## Authorization

Authorization answers the question:

```
What are you allowed to do?
```

For example:

```
Read file

Yes

Modify file

No

Delete file

No

Execute program

Yes
```

Permissions control authorization.

---

# Principle of Least Privilege

Linux follows an important security principle.

**Give users only the permissions they actually need.**

Example:

An intern needs to read documentation.

They should **not** have permission to:

- Delete system files
- Install software
- Change server settings
- Access payroll data

This minimizes accidental mistakes and improves security.

---

# Real-World Example

Consider a web server.

```
Web Developer

↓

Can edit website files
```

```
Database Administrator

↓

Can manage databases
```

```
Guest User

↓

Can only read public files
```

Each role receives different permissions based on its responsibilities.

---

# Linux is a Multi-User Operating System

Unlike personal computers that often have one primary user, Linux is designed from the ground up to support many users.

For example:

```
Server

├── User1

├── User2

├── User3

├── User4

└── User5
```

All users can work at the same time without interfering with each other's files.

---

# File Ownership

Every file belongs to someone.

Example:

```
report.pdf

Owner:

Alice
```

Another example:

```
backup.sh

Owner:

root
```

Ownership is one of the first things Linux checks before allowing access.

---

# Directory Ownership

Directories also have owners.

Example:

```
Projects/

Owner:

Bob
```

The directory owner controls who can create, rename, or delete files inside the directory (subject to permissions).

---

# Why Ownership Matters

Suppose Alice creates:

```
salary.xlsx
```

Should Bob be able to delete it?

Usually **No**.

Ownership prevents unauthorized access.

---

# Security Layers

Linux security can be viewed as multiple layers.

```
User Login

↓

Authentication

↓

Ownership Check

↓

Permission Check

↓

Access Granted or Denied
```

If any check fails, access is denied.

---

# Typical Permission Flow

```
User requests a file

↓

Linux checks the owner

↓

Linux checks the user's group

↓

Linux checks permissions

↓

Allow or Deny
```

This process happens every time a file is accessed.

---

# Advantages of Linux Permissions

Linux permissions provide several benefits.

- Protect sensitive files
- Prevent accidental deletion
- Allow safe multi-user environments
- Improve server security
- Separate responsibilities
- Reduce security risks

---

# Common Examples

A configuration file:

```
/etc/passwd
```

should be readable by users but not writable.

A system executable:

```
/usr/bin/bash
```

should be executable by everyone but modifiable only by administrators.

A personal document:

```
/home/student/notes.txt
```

should normally be accessible only to its owner.

---

# Key Concepts to Remember

Every file has:

- An owner
- An associated group
- Permissions

Linux checks these before granting access.

---

# Summary

In this section, you learned:

- Why Linux uses permissions
- The Linux security model
- Authentication vs authorization
- The principle of least privilege
- File ownership
- Directory ownership
- Multi-user concepts
- Permission checking process

---

# Practice Questions

1. Why does Linux need file permissions?
2. What is the difference between authentication and authorization?
3. What is the principle of least privilege?
4. Why does every file have an owner?
5. Why is Linux considered a multi-user operating system?

---

# What's Next?

In **Part 1A – Section 2**, you'll learn:

- Linux Users
- Root User
- System Users
- Regular Users
- User IDs (UID)
- Home Directories
- Login Shells
- The `/etc/passwd` file

---

# Part 1A - Linux Security Model, Users & Groups

## Section 2 - Linux Users

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand what a Linux user is.
> - Learn different types of Linux users.
> - Understand User IDs (UIDs).
> - Learn about home directories.
> - Understand login shells.
> - Explore the `/etc/passwd` file.
> - View information about the currently logged-in user.

---

# Introduction

Everything in Linux revolves around **users**.

Every action performed on a Linux system is executed by a user.

Examples include:

- Creating files
- Deleting files
- Installing software
- Running programs
- Managing services
- Accessing the internet

Linux keeps track of **who performed each action**.

---

# What is a User?

A **user** is an account that allows a person or a service to interact with the Linux operating system.

Each user has:

- A unique username
- A unique User ID (UID)
- A primary group
- A home directory
- A login shell
- Permissions

Example:

```
Username : student
UID      : 1000
Group    : student
Home     : /home/student
Shell    : /bin/bash
```

---

# Why Does Linux Use Users?

Imagine a computer shared by five people.

```
Computer

├── Alice
├── Bob
├── Charlie
├── David
└── Emma
```

Each person should have:

- Their own files
- Their own settings
- Their own password
- Their own applications
- Their own permissions

Users make this possible.

---

# Types of Linux Users

Linux mainly has three categories of users.

```
Linux Users

├── Root User
├── System Users
└── Regular Users
```

Each type serves a different purpose.

---

# 1. Root User

The **root** user is the administrator of the Linux system.

Username:

```text
root
```

UID:

```text
0
```

The root user has unrestricted access to the entire system.

Root can:

- Read any file
- Delete any file
- Install software
- Remove users
- Change passwords
- Modify system settings
- Shut down the system

Example:

```bash
sudo apt update
```

This command runs with root privileges.

---

# Why Be Careful with Root?

Because root can do **anything**, mistakes can be dangerous.

For example:

```bash
rm -rf important_directory
```

or

```bash
sudo rm -rf /
```

could cause severe damage to the system.

**Best Practice:** Use `sudo` only when administrative privileges are required.

---

# 2. System Users

System users are created automatically by Linux during installation.

These users run background services.

Examples:

| User | Purpose |
|------|----------|
| root | Administrator |
| daemon | Background services |
| bin | System binaries |
| nobody | Restricted service account |
| www-data | Web server processes |
| mysql | MySQL Database Server |
| postgres | PostgreSQL Database |
| nginx | Nginx Web Server |

System users usually **do not log in interactively**.

---

# Example

When the Nginx web server is installed, Linux creates:

```text
www-data
```

Instead of running as root, Nginx runs as the `www-data` user.

This improves security.

---

# 3. Regular Users

Regular users are created by administrators.

Examples:

```
student
john
alice
developer
```

A regular user typically:

- Can access their own files
- Cannot modify system files
- Cannot install system software (without sudo)
- Has a personal home directory

---

# Home Directory

Every regular user receives a home directory.

Example:

```
/home/student
```

Inside the home directory:

```
student/

├── Documents
├── Downloads
├── Pictures
├── Music
├── Videos
└── Desktop
```

Users usually store personal files here.

---

# Why Home Directories Matter

Suppose two users exist.

```
Alice

/home/alice
```

```
Bob

/home/bob
```

Alice normally cannot modify Bob's files unless permissions allow it.

---

# User IDs (UID)

Linux identifies users internally using **User IDs (UIDs)**.

Example:

| Username | UID |
|----------|-----|
| root | 0 |
| daemon | 1 |
| bin | 2 |
| student | 1000 |
| developer | 1001 |

Although humans use usernames, Linux primarily works with UIDs.

---

# Typical UID Ranges

| UID Range | Purpose |
|-----------|----------|
| 0 | Root user |
| 1–999 | System users (may vary by distribution) |
| 1000+ | Regular users |

Different Linux distributions may use slightly different ranges.

---

# View Your Username

Display the current user.

```bash
whoami
```

Example output:

```text
student
```

---

# View Your UID

```bash
id
```

Example:

```text
uid=1000(student)
gid=1000(student)
groups=1000(student)
```

---

# Display Only UID

```bash
id -u
```

Example:

```text
1000
```

---

# Display Only Groups

```bash
id -Gn
```

Example:

```text
student sudo docker
```

---

# Login Shell

Every user has a **default shell**.

Common shells include:

| Shell | Path |
|--------|------|
| Bash | /bin/bash |
| Zsh | /bin/zsh |
| Fish | /usr/bin/fish |
| Sh | /bin/sh |

View your shell:

```bash
echo $SHELL
```

Example:

```text
/bin/bash
```

---

# What is a Shell?

The shell acts as a bridge between the user and the Linux kernel.

```
User

↓

Shell

↓

Kernel

↓

Hardware
```

Commands typed by the user are interpreted by the shell before being executed.

---

# The `/etc/passwd` File

Linux stores user account information in:

```text
/etc/passwd
```

View it:

```bash
cat /etc/passwd
```

Sample entry:

```text
student:x:1000:1000:Student User:/home/student:/bin/bash
```

---

# Understanding `/etc/passwd`

Example:

```text
student:x:1000:1000:Student User:/home/student:/bin/bash
```

Breakdown:

| Field | Meaning |
|--------|---------|
| student | Username |
| x | Password placeholder |
| 1000 | UID |
| 1000 | GID |
| Student User | Description |
| /home/student | Home directory |
| /bin/bash | Login shell |

---

# Password Storage

Modern Linux systems **do not** store passwords in `/etc/passwd`.

Passwords are stored securely in:

```text
/etc/shadow
```

Only privileged users (such as root) can read this file.

---

# Useful User Commands

Display current username:

```bash
whoami
```

Display user information:

```bash
id
```

Display home directory:

```bash
echo $HOME
```

Display login shell:

```bash
echo $SHELL
```

Display current working directory:

```bash
pwd
```

---

# Real-World Example

Suppose Alice logs in.

```bash
whoami
```

Output:

```text
alice
```

Check user details:

```bash
id
```

Output:

```text
uid=1001(alice)
gid=1001(alice)
groups=1001(alice),27(sudo)
```

Check home directory:

```bash
echo $HOME
```

Output:

```text
/home/alice
```

---

# Best Practices

✅ Use a regular user account for daily work.

✅ Use `sudo` only when necessary.

✅ Never log in as root for routine tasks.

✅ Keep your home directory organized.

✅ Learn the `id` command—it is frequently used by Linux administrators.

---

# Common Mistakes

❌ Logging in as root for everyday tasks.

❌ Confusing usernames with UIDs.

❌ Editing `/etc/passwd` without understanding its structure.

❌ Assuming every user has administrative privileges.

---

# Summary

In this section, you learned:

- What a Linux user is
- Types of Linux users
- Root user
- System users
- Regular users
- User IDs (UIDs)
- Home directories
- Login shells
- `/etc/passwd`
- `/etc/shadow`
- Useful user-related commands

---

# Practice Lab

## Exercise 1

Display your username.

```bash
whoami
```

---

## Exercise 2

Display your user information.

```bash
id
```

---

## Exercise 3

Display only your UID.

```bash
id -u
```

---

## Exercise 4

Display your home directory.

```bash
echo $HOME
```

---

## Exercise 5

Display your default shell.

```bash
echo $SHELL
```

---

## Exercise 6

View the `/etc/passwd` file.

```bash
cat /etc/passwd
```

Identify:

- Username
- UID
- Home directory
- Login shell

---

## Exercise 7

Count the number of user entries.

```bash
wc -l /etc/passwd
```

---

# Interview Questions

1. What is a Linux user?
2. What is the difference between root, system, and regular users?
3. What is the UID of the root user?
4. Why are UIDs used instead of usernames internally?
5. What is the purpose of a home directory?
6. What information is stored in `/etc/passwd`?
7. Where are passwords stored in modern Linux systems?
8. What command displays the current username?
9. What command displays your UID and group information?
10. Why should you avoid logging in as root for everyday tasks?

---

# What's Next?

In **Part 1A – Section 3**, you'll learn:

- Linux Groups
- Primary Groups
- Secondary Groups
- Group IDs (GIDs)
- `/etc/group`
- Group management concepts
- Why groups simplify permission management

---

# Part 1A - Linux Security Model, Users & Groups

## Section 3 - Linux Groups

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand what Linux groups are.
> - Learn why groups are used.
> - Understand Primary and Secondary Groups.
> - Learn about Group IDs (GIDs).
> - Explore the `/etc/group` file.
> - Display group information.
> - Understand group-based permissions.

---

# Introduction

Imagine a company with hundreds of employees.

Instead of assigning permissions to each employee individually, Linux allows administrators to organize users into **groups**.

For example:

```
Company

├── Developers
├── HR
├── Finance
├── Marketing
└── Managers
```

Permissions can then be assigned to an entire group instead of every individual user.

This makes Linux administration much easier.

---

# What is a Group?

A **group** is a collection of users.

Users in the same group can share access to files and directories.

Example:

```
Developers

├── Alice
├── Bob
├── Charlie
└── David
```

Instead of giving permissions separately to Alice, Bob, Charlie, and David, Linux grants permissions to the **Developers** group.

---

# Why Groups are Important

Suppose you have:

```
50 Developers
20 HR Employees
15 Finance Employees
```

Without groups:

```
Assign permissions

↓

One user at a time
```

With groups:

```
Assign permissions

↓

Entire group gets access
```

This saves time and reduces mistakes.

---

# Real-World Example

A company server contains:

```
/company

├── HR
├── Development
├── Finance
└── Public
```

Permissions:

```
HR Group

↓

Access HR folder
```

```
Developers Group

↓

Access Development folder
```

```
Everyone

↓

Access Public folder
```

Groups make this simple.

---

# Types of Groups

Every Linux user has:

```
Primary Group

+

Secondary Groups
```

---

# Primary Group

A **Primary Group** is the user's default group.

Example:

```
User

student

↓

Primary Group

student
```

Whenever the user creates a new file, the file normally belongs to the user's primary group.

---

# Example

User:

```
student
```

Primary Group:

```
student
```

Create a file.

```bash
touch notes.txt
```

Check ownership.

```bash
ls -l
```

Output:

```text
-rw-r--r-- 1 student student notes.txt
```

Notice:

```
Owner

student
```

Group

```
student
```

---

# Secondary Groups

Users can belong to multiple additional groups.

Example:

```
User

Alice

Primary Group

developers

Secondary Groups

docker
sudo
git
```

Alice now has permissions from all of these groups.

---

# Visual Representation

```
Alice

├── Primary Group
│
└── developers

├── Secondary Group
│
└── docker

├── Secondary Group
│
└── sudo

└── Secondary Group

    git
```

---

# Why Secondary Groups?

Suppose Alice is a developer.

She also needs to:

- Use Docker
- Administer servers
- Access Git repositories

Instead of creating duplicate accounts,

Linux simply adds Alice to multiple groups.

---

# Group IDs (GID)

Like users have UIDs,

Groups have **Group IDs (GIDs)**.

Example:

| Group | GID |
|--------|-----|
| root | 0 |
| daemon | 1 |
| sudo | 27 |
| student | 1000 |
| developers | 1001 |

Linux internally uses GIDs rather than group names.

---

# View Group Information

Display your groups.

```bash
groups
```

Example:

```text
student sudo docker
```

---

Display detailed information.

```bash
id
```

Output:

```text
uid=1000(student)

gid=1000(student)

groups=1000(student),27(sudo),998(docker)
```

---

Display only group names.

```bash
id -Gn
```

Example:

```text
student sudo docker
```

---

Display only GIDs.

```bash
id -G
```

Example:

```text
1000 27 998
```

---

# The `/etc/group` File

Linux stores group information in:

```text
/etc/group
```

View it:

```bash
cat /etc/group
```

Sample:

```text
sudo:x:27:student

developers:x:1001:alice,bob
```

---

# Understanding `/etc/group`

Example:

```text
developers:x:1001:alice,bob
```

Meaning:

| Field | Description |
|--------|-------------|
| developers | Group name |
| x | Password placeholder |
| 1001 | Group ID (GID) |
| alice,bob | Members |

---

# Primary vs Secondary Groups

| Feature | Primary Group | Secondary Group |
|----------|---------------|-----------------|
| Default Group | Yes | No |
| Assigned at User Creation | Yes | Optional |
| Used for New Files | Yes | Usually No |
| Multiple Allowed | No | Yes |

---

# Example Scenario

```
Alice

Primary Group

developers

Secondary Groups

docker
sudo
```

File created:

```bash
touch app.py
```

Ownership:

```text
Owner : alice

Group : developers
```

The file belongs to the **primary group** by default.

---

# Sharing Files Using Groups

Suppose two developers need access to the same project.

```
Project/

├── Alice
└── Bob
```

Both belong to:

```
developers
```

Assign the project directory to the developers group.

Now both users can collaborate without changing individual permissions for every file.

---

# Common Linux Groups

| Group | Purpose |
|--------|----------|
| root | System Administrator |
| sudo | Administrative privileges |
| wheel | Administrator group (RHEL/CentOS) |
| docker | Docker access |
| audio | Audio devices |
| video | Video devices |
| lp | Printing services |
| www-data | Web server |
| mysql | MySQL Server |

---

# Best Practices

✅ Use groups instead of assigning permissions to each user.

✅ Keep related users in the same group.

✅ Remove users from groups they no longer need.

✅ Follow the Principle of Least Privilege.

---

# Common Mistakes

❌ Giving every user sudo access.

❌ Forgetting to remove users from old groups.

❌ Confusing Primary Groups with Secondary Groups.

❌ Editing `/etc/group` manually without understanding its format.

---

# Summary

In this section, you learned:

- What Linux groups are
- Why groups are important
- Primary Groups
- Secondary Groups
- Group IDs (GIDs)
- `/etc/group`
- Viewing group information
- Group-based collaboration

---

# Practice Lab

## Exercise 1

Display your groups.

```bash
groups
```

---

## Exercise 2

Display detailed user information.

```bash
id
```

---

## Exercise 3

Display only group names.

```bash
id -Gn
```

---

## Exercise 4

Display only GIDs.

```bash
id -G
```

---

## Exercise 5

View the group database.

```bash
cat /etc/group
```

Find:

- sudo
- root
- your primary group

---

## Exercise 6

Count the number of groups.

```bash
wc -l /etc/group
```

---

## Exercise 7

Identify:

- Your primary group
- Your secondary groups

using:

```bash
id
```

---

# Interview Questions

1. What is a Linux group?
2. Why are groups used instead of assigning permissions individually?
3. What is the difference between a Primary Group and a Secondary Group?
4. What is a GID?
5. Where is group information stored?
6. Which command displays the groups a user belongs to?
7. Which command displays only group names?
8. What happens when a user creates a new file?
9. Why is the `sudo` group important?
10. Explain a real-world example where groups simplify permission management.

---

# What's Next?

In **Part 1A – Section 4**, you'll learn:

- File Ownership
- User Ownership
- Group Ownership
- Ownership Commands
- `ls -l` Breakdown
- Understanding Owner and Group Fields
- Real-world ownership examples

---

# Part 1A - Linux Security Model, Users & Groups

## Section 4 - File Ownership

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand file ownership in Linux.
> - Learn the difference between user ownership and group ownership.
> - View ownership information.
> - Understand why ownership is important.
> - Learn basic ownership commands.
> - Prepare for `chown` and `chgrp` in the next chapter.

---

# Introduction

Every file and directory in Linux has an **owner**.

Linux uses ownership to determine:

- Who can read a file
- Who can modify a file
- Who can delete a file
- Who can execute a file

Ownership is one of the first things Linux checks before granting access.

---

# Every File Has Two Owners

Every file stores two ownership values.

```
File

↓

User Owner

↓

Group Owner
```

Example

```
notes.txt

Owner : student

Group : developers
```

Linux checks both values when deciding whether access should be allowed.

---

# Visual Representation

```
notes.txt

+-------------------------+
| User Owner : student    |
+-------------------------+
| Group Owner: developers |
+-------------------------+
| Permissions             |
+-------------------------+
```

---

# User Ownership

The **User Owner** is the person who owns the file.

Usually,

the user who creates the file becomes its owner.

Example

```bash
touch report.txt
```

Display details.

```bash
ls -l report.txt
```

Output

```text
-rw-r--r-- 1 student student 0 Jul 3 10:30 report.txt
```

Owner

```
student
```

---

# Group Ownership

Every file also belongs to a group.

Usually,

this is the creator's **primary group**.

Example

```
Owner

student

Group

student
```

---

# Real Example

User:

```
alice
```

Primary Group:

```
developers
```

Create:

```bash
touch app.py
```

Check:

```bash
ls -l app.py
```

Output

```text
-rw-r--r-- 1 alice developers 0 Jul 3 10:45 app.py
```

Notice:

Owner

```
alice
```

Group

```
developers
```

---

# Why Group Ownership Exists

Suppose three developers work together.

```
Alice

Bob

Charlie
```

All belong to

```
developers
```

Project directory:

```
Project/

├── app.py

├── index.html

└── config.json
```

Instead of giving permissions to every user,

Linux simply assigns the directory to

```
developers
```

Every member of the group can now work with the project (depending on permissions).

---

# Viewing Ownership

Use

```bash
ls -l
```

Example

```text
-rw-r--r-- 1 student student 2048 Jul 3 notes.txt
```

Breakdown

```
-rw-r--r--

Permissions

↓

1

Number of hard links

↓

student

Owner

↓

student

Group

↓

2048

File Size

↓

Jul 3

Modification Date

↓

notes.txt

Filename
```

---

# Understanding the Owner Field

Example

```text
-rw-r--r--

student

developers

notes.txt
```

Owner

```
student
```

Only the owner (or root) can normally change permissions.

---

# Understanding the Group Field

Example

```text
-rw-r--r--

student

developers

notes.txt
```

Group

```
developers
```

Members of the developers group receive the group permissions assigned to the file.

---

# Checking Ownership of a Directory

Example

```bash
ls -ld Projects
```

Output

```text
drwxr-xr-x 2 alice developers 4096 Jul 3 Projects
```

Owner

```
alice
```

Group

```
developers
```

---

# Ownership vs Permissions

Many beginners confuse these concepts.

Ownership answers

```
Who owns this file?
```

Permissions answer

```
What are they allowed to do?
```

Linux checks ownership first,

then applies the appropriate permission set.

---

# Root User and Ownership

The **root** user can:

- Change ownership
- Read any file
- Modify any file
- Delete any file

Example

```bash
sudo chown alice report.txt
```

Changes the owner to Alice.

---

# Viewing Current User

Check who you are.

```bash
whoami
```

Example

```text
student
```

---

# Display Complete Information

```bash
id
```

Output

```text
uid=1000(student)

gid=1000(student)

groups=1000(student),27(sudo)
```

This helps you understand why Linux grants certain permissions.

---

# Changing Ownership (Preview)

Linux provides the `chown` command.

Syntax

```bash
sudo chown USER FILE
```

Example

```bash
sudo chown alice report.txt
```

New owner

```
alice
```

---

# Changing Group Ownership (Preview)

Linux provides the `chgrp` command.

Syntax

```bash
chgrp GROUP FILE
```

Example

```bash
chgrp developers report.txt
```

Now

Group

```
developers
```

---

# Change Both Owner and Group

```bash
sudo chown alice:developers report.txt
```

Owner

```
alice
```

Group

```
developers
```

---

# Recursive Ownership

Change ownership of an entire directory.

```bash
sudo chown -R alice:developers Project
```

Everything inside

```
Project
```

receives the new owner and group.

---

# Real-World Example

Project structure

```
Website

├── index.html

├── style.css

├── app.js

└── images
```

Ownership

```
Owner

www-data

Group

www-data
```

The web server can access and serve the files.

---

# Why Ownership Matters

Suppose Bob owns

```
salary.xlsx
```

Alice tries to modify it.

Linux checks

```
Owner?

↓

No

↓

Group?

↓

Maybe

↓

Permissions?

↓

Allowed or Denied
```

Ownership is the first step in access control.

---

# Best Practices

✅ Keep users as owners of their personal files.

✅ Use groups for shared projects.

✅ Use `sudo chown` carefully.

✅ Verify ownership using:

```bash
ls -l
```

before changing it.

---

# Common Mistakes

❌ Changing ownership accidentally.

Example

```bash
sudo chown -R root /
```

This can break the system.

---

❌ Giving ownership to the wrong user.

Always verify with

```bash
ls -l
```

---

❌ Confusing owner with permissions.

Remember

Ownership identifies **who** owns the file.

Permissions determine **what** each category can do.

---

# Summary

You learned:

- User ownership
- Group ownership
- Why ownership exists
- Viewing ownership
- Understanding `ls -l`
- Basic `chown`
- Basic `chgrp`
- Recursive ownership
- Real-world ownership examples

---

# Practice Lab

## Exercise 1

Create a file.

```bash
touch report.txt
```

Display ownership.

```bash
ls -l report.txt
```

---

## Exercise 2

Create a directory.

```bash
mkdir Projects
```

Check ownership.

```bash
ls -ld Projects
```

---

## Exercise 3

Display your username.

```bash
whoami
```

---

## Exercise 4

Display UID and groups.

```bash
id
```

---

## Exercise 5

(Requires sudo)

Create another user.

```bash
sudo adduser demo
```

Change ownership.

```bash
sudo chown demo report.txt
```

Verify.

```bash
ls -l report.txt
```

---

## Exercise 6

Change the group.

```bash
sudo chgrp demo report.txt
```

Verify.

---

## Exercise 7

Create:

```
Workspace/

├── Docs

├── Code

└── Images
```

Use recursive ownership.

```bash
sudo chown -R demo:demo Workspace
```

---

# Interview Questions

1. What is file ownership?
2. What is the difference between user ownership and group ownership?
3. Which command displays ownership information?
4. Who becomes the owner of a newly created file?
5. Why is group ownership useful?
6. What command changes file ownership?
7. What command changes group ownership?
8. What does `chown -R` do?
9. Why can the root user change ownership?
10. Explain the difference between ownership and permissions.

---

# What's Next?

In **Part 1A – Section 5**, you'll learn one of the most important Linux topics:

- Understanding `ls -l`
- Permission string (`-rw-r--r--`)
- File types
- Owner, Group, and Others
- Permission fields
- Reading Linux permission output like a system administrator

---

# Part 1A - Linux Security Model, Users & Groups

# Section 5 - Understanding `ls -l` and Permission Fields

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand the output of `ls -l`
> - Decode Linux permission strings
> - Identify file types
> - Understand owner, group, and others
> - Interpret every field displayed by `ls -l`
> - Read Linux permissions like a System Administrator

---

# Introduction

One of the most important Linux commands is:

```bash
ls -l
```

This command displays detailed information about files and directories.

Example:

```bash
ls -l
```

Output:

```text
-rw-r--r-- 1 student developers 2048 Jul 3 10:45 report.txt
```

At first glance, this may look confusing.

By the end of this section, you'll understand **every character**.

---

# Structure of `ls -l` Output

Example:

```text
-rw-r--r-- 1 student developers 2048 Jul 3 10:45 report.txt
```

Breakdown:

```text
-rw-r--r--   1   student   developers   2048   Jul 3 10:45   report.txt

│            │      │          │          │          │             │
│            │      │          │          │          │             └── Filename
│            │      │          │          │          └────────────── Last Modified
│            │      │          │          └──────────────────────── File Size
│            │      │          └─────────────────────────────────── Group Owner
│            │      └────────────────────────────────────────────── User Owner
│            └───────────────────────────────────────────────────── Hard Links
└────────────────────────────────────────────────────────────────── Permissions
```

---

# The Seven Fields

| Field | Meaning |
|---------|----------|
| Permissions | Access rights |
| Hard Links | Number of hard links |
| Owner | User owner |
| Group | Group owner |
| Size | File size in bytes |
| Date | Last modification date |
| Name | File or directory name |

---

# Field 1 - Permissions

Example:

```text
-rw-r--r--
```

This field contains **10 characters**.

```
-rw-r--r--
```

Let's break it down.

---

# Character 1 - File Type

The first character tells Linux what type of file it is.

| Symbol | Meaning |
|---------|----------|
| `-` | Regular File |
| `d` | Directory |
| `l` | Symbolic Link |
| `c` | Character Device |
| `b` | Block Device |
| `p` | Named Pipe |
| `s` | Socket |

Example:

```
-rw-r--r--
```

Means:

```
Regular File
```

---

Example:

```text
drwxr-xr-x
```

Means:

```
Directory
```

---

Example:

```text
lrwxrwxrwx
```

Means:

```
Symbolic Link
```

---

# Characters 2–4 - Owner Permissions

Example:

```text
-rwx------
```

Breakdown:

```
Owner

r

Read

w

Write

x

Execute
```

Owner has full access.

---

# Characters 5–7 - Group Permissions

Example:

```text
-rwxr-x---
```

Group permissions:

```
r

Read

-

No Write

x

Execute
```

---

# Characters 8–10 - Others Permissions

Example:

```text
-rwxr-xr--
```

Others have:

```
r

Read

-

No Write

-

No Execute
```

---

# Visual Breakdown

```
-rwxr-xr--

│││ │││ │││

│││ │││ ││└── Others Execute

│││ │││ │└── Others Write

│││ │││ └── Others Read

│││ ││└──── Group Execute

│││ │└───── Group Write

│││ └────── Group Read

││└──────── Owner Execute

│└───────── Owner Write

└────────── Owner Read
```

---

# Understanding `r`, `w`, and `x`

| Symbol | Meaning |
|---------|----------|
| `r` | Read |
| `w` | Write |
| `x` | Execute |
| `-` | Permission not granted |

---

# Example 1

```text
-rw-r--r--
```

Meaning:

Owner

```
Read

Write
```

Group

```
Read
```

Others

```
Read
```

---

# Example 2

```text
-rwx------
```

Meaning:

Owner

```
Read

Write

Execute
```

Group

```
No Access
```

Others

```
No Access
```

---

# Example 3

```text
drwxr-xr-x
```

Directory

Owner

```
rwx
```

Group

```
r-x
```

Others

```
r-x
```

---

# Field 2 - Hard Links

Example:

```text
1
```

This represents the number of **hard links** pointing to the file.

Example:

```text
-rw-r--r-- 3 student developers report.txt
```

Meaning:

```
Three hard links
```

We'll study hard links in a later chapter.

---

# Field 3 - User Owner

Example:

```text
student
```

This is the owner of the file.

Only the owner (or root) can normally change permissions.

---

# Field 4 - Group Owner

Example:

```text
developers
```

Members of this group receive the group permissions.

---

# Field 5 - File Size

Example:

```text
2048
```

This is the file size in **bytes**.

Display human-readable sizes:

```bash
ls -lh
```

Example:

```text
2.0K report.txt
```

---

# Field 6 - Last Modified Date

Example:

```text
Jul 3 10:45
```

This is the last time the **contents** of the file changed.

---

# Field 7 - File Name

Example:

```text
report.txt
```

This is simply the file name.

---

# Directory Example

```bash
ls -ld Documents
```

Output:

```text
drwxr-xr-x 2 student student 4096 Jul 3 Documents
```

Notice:

```
d

means

Directory
```

---

# Symbolic Link Example

```bash
ls -l python
```

Output:

```text
lrwxrwxrwx 1 root root 7 Jul 3 python -> python3
```

```
l

means

Symbolic Link
```

---

# Device File Example

```bash
ls -l /dev/null
```

Output:

```text
crw-rw-rw-
```

```
c

means

Character Device
```

---

# Viewing Hidden Files

```bash
ls -la
```

Example:

```text
.bashrc

.profile

.gitconfig
```

---

# Human Readable Sizes

Instead of

```text
2048576
```

Use:

```bash
ls -lh
```

Output:

```text
2.0M
```

---

# Recursive Listing

```bash
ls -lR
```

Displays files inside all subdirectories.

---

# Real-World Example

Suppose:

```text
-rwxr-x--- 1 alice developers 812 app.sh
```

Interpretation:

| Property | Value |
|----------|-------|
| File Type | Regular File |
| Owner | alice |
| Group | developers |
| Owner Permissions | Read, Write, Execute |
| Group Permissions | Read, Execute |
| Others Permissions | None |
| Size | 812 bytes |

---

# Best Practices

✅ Use `ls -l` before modifying permissions.

✅ Use `ls -lh` for readable file sizes.

✅ Use `ls -la` to include hidden files.

✅ Always verify file ownership before changing permissions.

---

# Common Mistakes

❌ Confusing the first character with permissions.

Remember:

```
First Character

=

File Type
```

---

❌ Assuming every `rwx` applies to everyone.

Permissions are divided into:

- Owner
- Group
- Others

---

❌ Ignoring hidden files.

Always use:

```bash
ls -la
```

when troubleshooting.

---

# Summary

You learned:

- Structure of `ls -l`
- File types
- Owner field
- Group field
- Hard links
- File size
- Modification date
- File name
- Permission string basics

---

# Practice Lab

## Exercise 1

Display detailed file information.

```bash
ls -l
```

---

## Exercise 2

Display hidden files.

```bash
ls -la
```

---

## Exercise 3

Display human-readable file sizes.

```bash
ls -lh
```

---

## Exercise 4

Display only a directory's details.

```bash
ls -ld Documents
```

---

## Exercise 5

Identify:

- File Type
- Owner
- Group
- Size
- Date
- Permissions

for five different files.

---

## Exercise 6

List all files recursively.

```bash
ls -lR
```

---

# Interview Questions

1. What does `ls -l` display?
2. What does the first character of the permission string represent?
3. What does `d` indicate?
4. What does `l` indicate?
5. What do the owner, group, and others fields mean?
6. What is the purpose of the hard links field?
7. Which command shows hidden files?
8. Which command displays human-readable file sizes?
9. How can you display only directory information?
10. Explain the output of:

```text
-rwxr-xr--
```

---

# Part 1A Completed ✅

Congratulations!

You have completed **Part 1A** of **Chapter 06**.

You now understand:

- Linux Security Model
- Users
- Groups
- File Ownership
- Group Ownership
- `ls -l` Output
- File Types
- Permission Fields

These concepts form the foundation for the next part, where you'll learn how to **change permissions** using `chmod`.

---

# What's Next?

## Part 1B – Understanding `r`, `w`, and `x` Permissions

Topics include:

- Read (`r`) Permission
- Write (`w`) Permission
- Execute (`x`) Permission
- File Permissions vs Directory Permissions
- Real-world Permission Examples
- Permission Matrix
- Introduction to `chmod`

# Chapter 06 - File Permissions and Ownership

---

# Part 1B - Understanding Read, Write, and Execute Permissions

## Section 1 - Introduction to Linux Permissions (`r`, `w`, `x`)

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand Linux permission bits.
> - Learn the meaning of `r`, `w`, and `x`.
> - Understand why permissions are divided into Owner, Group, and Others.
> - Learn how Linux checks permissions.
> - Interpret permission strings confidently.

---

# Introduction

Linux protects every file and directory using **permissions**.

Permissions determine:

- Who can read a file
- Who can modify a file
- Who can execute a program
- Who can access a directory

Every file and directory has a permission string.

Example:

```text
-rwxr-xr--
```

This string tells Linux exactly **who can do what**.

---

# Why Permissions Matter

Imagine a company server.

```
Company Server

├── Payroll.xlsx
├── Employees.db
├── Website/
└── Public/
```

Without permissions:

- Anyone could delete payroll files.
- Anyone could modify the company website.
- Anyone could read confidential information.

Linux prevents this by assigning permissions.

---

# The Permission Model

Every permission is divided into **three categories**.

```
Permissions

├── Owner
├── Group
└── Others
```

Each category can have:

- Read (`r`)
- Write (`w`)
- Execute (`x`)

---

# Visual Representation

```
-rwxr-xr--

│││ │││ │││

│││ │││ │└── Others Execute

│││ │││ └── Others Write

│││ ││└──── Others Read

│││ │└───── Group Execute

│││ └────── Group Write

││└──────── Group Read

│└───────── Owner Execute

└────────── Owner Read
```

---

# The Three Permission Types

| Symbol | Name | Meaning |
|---------|------|----------|
| r | Read | View contents |
| w | Write | Modify contents |
| x | Execute | Run as a program or enter a directory |

---

# Read Permission (`r`)

Read permission allows a user to **view** the contents of a file.

Example:

```bash
cat notes.txt
```

If you have read permission:

```
✓ File opens successfully
```

Without read permission:

```text
Permission denied
```

---

# Read Permission Example

Permissions:

```text
-r--r-----
```

Owner:

```
Read
```

Group:

```
Read
```

Others:

```
No Access
```

---

# Commands That Need Read Permission

```bash
cat file.txt
```

```bash
less file.txt
```

```bash
more file.txt
```

```bash
head file.txt
```

```bash
tail file.txt
```

```bash
grep keyword file.txt
```

All require **read permission**.

---

# Write Permission (`w`)

Write permission allows a user to **modify** a file.

Example:

```bash
nano notes.txt
```

If write permission exists:

```
✓ File can be edited
```

Without it:

```
Permission denied
```

---

# What Write Permission Allows

A user can:

- Edit content
- Save changes
- Truncate the file
- Append new data

Example:

```bash
echo "Linux" >> notes.txt
```

Requires write permission.

---

# Write Permission Example

Permissions:

```text
-rw-r-----
```

Owner:

```
Read

Write
```

Group:

```
Read
```

Others:

```
No Access
```

---

# Execute Permission (`x`)

Execute permission allows Linux to run a file as a program or script.

Example:

```bash
./backup.sh
```

If execute permission exists:

```
Program runs
```

Otherwise:

```text
Permission denied
```

---

# Example

File:

```
backup.sh
```

Permissions:

```text
-rwxr-xr-x
```

Run:

```bash
./backup.sh
```

Output:

```
Backup Complete
```

---

# Without Execute Permission

Permissions:

```text
-rw-r--r--
```

Run:

```bash
./backup.sh
```

Output:

```text
Permission denied
```

---

# Why Execute Permission is Important

Linux treats scripts like programs.

Examples:

```bash
script.sh
```

```bash
install.sh
```

```bash
deploy.sh
```

These files require execute permission before they can run.

---

# Permission Matrix

| Permission | Read | Write | Execute |
|-------------|------|--------|----------|
| View file | ✅ | ❌ | ❌ |
| Edit file | ✅ | ✅ | ❌ |
| Run program | ❌ | ❌ | ✅ |

---

# Owner Permissions

Example:

```text
-rwx------
```

Owner can:

- Read
- Write
- Execute

Group:

```
No Access
```

Others:

```
No Access
```

---

# Group Permissions

Example:

```text
-rwxr-x---
```

Owner:

```
rwx
```

Group:

```
r-x
```

Others:

```
No Access
```

---

# Others Permissions

Example:

```text
-rwxr-xr--
```

Others:

```
Read only
```

Cannot:

- Edit
- Execute

---

# Complete Example

Permission string:

```text
-rwxrw-r--
```

Breakdown:

Owner:

```
Read

Write

Execute
```

Group:

```
Read

Write
```

Others:

```
Read
```

---

# How Linux Checks Permissions

Suppose Alice tries to open a file.

```
Alice

↓

Is Alice the Owner?

↓

YES

↓

Use Owner Permissions
```

If **No**:

```
Is Alice in the Group?

↓

YES

↓

Use Group Permissions
```

If **No**:

```
Use Others Permissions
```

Linux checks **only one category** in this order:

1. Owner
2. Group
3. Others

---

# Real-World Example

File:

```text
-rwxr-----
```

Owner:

```
alice
```

Group:

```
developers
```

User:

```
Bob
```

Bob belongs to:

```
developers
```

Linux checks:

```
Owner?

No

↓

Group?

Yes

↓

Apply Group Permissions

↓

Read Allowed

Write Not Allowed

Execute Not Allowed
```

---

# Common Permission Combinations

| Permission | Meaning |
|------------|----------|
| `rwx` | Full Access |
| `rw-` | Read + Write |
| `r-x` | Read + Execute |
| `r--` | Read Only |
| `--x` | Execute Only |
| `---` | No Access |

---

# Best Practices

✅ Give users only the permissions they need.

✅ Avoid giving execute permission unnecessarily.

✅ Use groups for shared access.

✅ Review permissions regularly.

---

# Common Mistakes

❌ Giving everyone full permissions.

Example:

```text
-rwxrwxrwx
```

This can be a serious security risk.

---

❌ Assuming execute permission is needed for every file.

Text documents usually **do not** need execute permission.

---

❌ Confusing file permissions with directory permissions.

Directory permissions work differently (covered in the next section).

---

# Summary

You learned:

- Read permission (`r`)
- Write permission (`w`)
- Execute permission (`x`)
- Owner permissions
- Group permissions
- Others permissions
- Permission evaluation order
- Common permission combinations

---

# Practice Lab

## Exercise 1

Display file permissions.

```bash
ls -l
```

---

## Exercise 2

Find files with execute permission.

```bash
find . -executable
```

---

## Exercise 3

Identify the meaning of:

```text
-rwxr-xr--
```

---

## Exercise 4

Can the group edit this file?

```text
-rw-r--r--
```

Explain your answer.

---

## Exercise 5

Can others execute this file?

```text
-rwxr-xr-x
```

---

# Interview Questions

1. What do `r`, `w`, and `x` represent?
2. What is execute permission used for?
3. What happens if a script does not have execute permission?
4. In what order does Linux check permissions?
5. What is the difference between Owner, Group, and Others?
6. Is `rwxrwxrwx` a good permission setting? Why or why not?

---

# What's Next?

In **Part 1B – Section 2**, you'll learn:

- File Permissions vs Directory Permissions
- How `r`, `w`, and `x` behave differently on directories
- Real-world permission scenarios
- Common interview questions


# Chapter 06 - File Permissions and Ownership

---

# Part 1B - Understanding Read, Write, and Execute Permissions

# Section 2 - File Permissions vs Directory Permissions

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand the difference between file and directory permissions.
> - Learn how `r`, `w`, and `x` behave differently for files and directories.
> - Understand why directory permissions are often confusing.
> - Learn common real-world permission scenarios.
> - Practice interpreting permissions.

---

# Introduction

Many beginners think that permissions work the same way for **files** and **directories**.

**They do not.**

Although both use:

```
r
w
x
```

their meanings are different.

Understanding this difference is one of the most important Linux concepts.

---

# File vs Directory

A **file** stores data.

Examples:

```
report.pdf

notes.txt

script.sh

photo.jpg
```

A **directory** stores references (entries) to files and other directories.

Example:

```
Projects/

├── app.py

├── config.json

└── README.md
```

---

# Permission Comparison

| Permission | File | Directory |
|------------|------|-----------|
| Read (r) | Read file contents | List directory contents |
| Write (w) | Modify file contents | Create/Delete/Rename files |
| Execute (x) | Run file as a program | Enter (access) the directory |

---

# File Read Permission (`r`)

Read permission allows you to **view the contents** of a file.

Example:

```bash
cat notes.txt
```

Without read permission:

```text
cat: notes.txt: Permission denied
```

---

# File Write Permission (`w`)

Write permission allows you to modify a file.

Example:

```bash
nano notes.txt
```

You can:

- Edit
- Save
- Append text

Example:

```bash
echo "Linux" >> notes.txt
```

---

# File Execute Permission (`x`)

Execute permission allows Linux to run the file.

Example:

```bash
./backup.sh
```

Without execute permission:

```text
bash: ./backup.sh: Permission denied
```

---

# Directory Read Permission (`r`)

For directories,

Read means:

> **View the directory listing.**

Example:

```bash
ls Documents
```

If read permission exists:

```
Documents

notes.txt

report.pdf

images
```

Without read permission:

```
Permission denied
```

---

# Directory Write Permission (`w`)

Write permission on a directory **does not** mean editing the directory itself.

Instead,

it allows:

- Create files
- Delete files
- Rename files
- Move files

Example:

```bash
touch report.txt
```

Requires:

```
Directory Write Permission
```

---

# Directory Execute Permission (`x`)

This is the most misunderstood permission.

Execute on a directory means:

```
You may ENTER the directory.
```

Example:

```bash
cd Documents
```

Without execute permission:

```text
bash: cd: Documents: Permission denied
```

---

# Visual Example

```
Documents/

├── file1.txt

├── file2.txt

└── Images
```

Permission:

```
Read

↓

See filenames
```

```
Execute

↓

Enter directory
```

```
Write

↓

Create/Delete files
```

---

# Directory Permission Matrix

| Permission | Meaning |
|------------|---------|
| r | List directory contents |
| w | Create/Delete/Rename files |
| x | Enter directory |

---

# Example 1

Directory:

```
Projects
```

Permissions:

```text
drwx------
```

Owner can:

```
Read

Write

Enter
```

Others:

```
No Access
```

---

# Example 2

Permissions:

```text
dr-xr-xr-x
```

Everyone can:

- List files
- Enter directory

Nobody can:

- Create files
- Delete files

---

# Example 3

Permissions:

```text
d-wx------
```

Owner can:

- Enter directory
- Create/Delete files

Cannot:

- List files

This is unusual but possible.

---

# Read Without Execute

Directory:

```text
dr--------
```

You can:

```
See names
```

Cannot:

```
Open files

Enter directory
```

---

# Execute Without Read

Directory:

```text
d--x------
```

You can:

```
Enter the directory
```

But you cannot:

```
List files
```

However,

if you already know a filename,

you may access it directly (provided you have the necessary file permissions).

Example:

```bash
cat Documents/report.txt
```

This works only if:

- You know the filename.
- The file itself grants read permission.
- The directory grants execute permission.

---

# Read + Execute

Directory:

```text
dr-x------
```

You can:

- Enter directory
- List files

Cannot:

- Create files
- Delete files

---

# Read + Write (Without Execute)

Permissions:

```text
drw-------
```

You can:

```
See filenames
```

But:

```
Cannot enter the directory
```

This combination is rarely useful.

---

# Full Access

Permissions:

```text
drwx------
```

Owner can:

- List files
- Enter directory
- Create files
- Delete files
- Rename files

---

# File vs Directory Summary

## File

```
r

↓

Read contents
```

```
w

↓

Modify contents
```

```
x

↓

Execute program
```

---

## Directory

```
r

↓

List files
```

```
w

↓

Create/Delete/Rename
```

```
x

↓

Enter directory
```

---

# Real-World Scenario

Project:

```
Website/

├── index.html

├── style.css

└── app.js
```

Permissions:

```text
drwxr-xr-x
```

Developers can:

- Enter project
- Read files

Only the owner can:

- Modify directory contents

---

# Practical Examples

## List Files

```bash
ls Projects
```

Requires:

```
Directory Read
```

---

## Enter Directory

```bash
cd Projects
```

Requires:

```
Directory Execute
```

---

## Create File

```bash
touch Projects/test.txt
```

Requires:

```
Directory Write

+

Directory Execute
```

---

## Delete File

```bash
rm Projects/test.txt
```

Requires:

```
Directory Write

+

Directory Execute
```

Notice:

Deleting a file depends on the **directory permissions**, not the file's write permission.

---

# Common Mistakes

## Mistake 1

Thinking execute means "run" for directories.

Wrong.

For directories,

Execute means:

```
Enter
```

---

## Mistake 2

Thinking write permission on a file allows deleting it.

Deletion depends on:

```
Directory Write Permission
```

---

## Mistake 3

Confusing file and directory permissions.

Remember:

Files store data.

Directories store filenames.

---

# Best Practices

✅ Give execute permission only to scripts and programs.

✅ Use directory write permission carefully.

✅ Verify permissions before troubleshooting access issues.

✅ Remember that deleting a file depends on directory permissions.

---

# Practice Lab

## Exercise 1

Create a directory.

```bash
mkdir Practice
```

Display permissions.

```bash
ls -ld Practice
```

---

## Exercise 2

Create a file.

```bash
touch Practice/demo.txt
```

List directory.

```bash
ls Practice
```

---

## Exercise 3

Enter directory.

```bash
cd Practice
```

---

## Exercise 4

Display detailed information.

```bash
ls -l
```

---

## Exercise 5

Answer:

For

```text
dr-xr-xr-x
```

Can users:

- Enter directory?
- Create files?
- Delete files?
- List contents?

Explain.

---

## Exercise 6

Explain:

```text
-rw-r--r--
```

vs

```text
drw-r--r--
```

What changes?

---

# Interview Questions

1. Why do file and directory permissions behave differently?
2. What does read permission mean for a directory?
3. What does execute permission mean for a directory?
4. Why can deleting a file depend on directory permissions?
5. Can you enter a directory without execute permission?
6. Can you list a directory without read permission?
7. Why is execute permission important for directories?
8. What is the difference between file write permission and directory write permission?
9. Explain `drwxr-xr-x`.
10. Explain `dr-x------`.

---

# Summary

In this section, you learned:

- File permissions
- Directory permissions
- Read, Write, Execute differences
- Permission matrix
- Real-world examples
- Common mistakes
- Best practices
- Practical labs

---

# What's Next?

In **Part 1B – Section 3**, you'll learn:

- Numeric Permissions (Octal)
- Binary Representation
- Permission Values
- `777`, `755`, `644`, `600`
- How Linux calculates permissions
- Foundation for the `chmod` command

# Chapter 06 - File Permissions and Ownership

---

# Part 1B - Understanding Read, Write, and Execute Permissions

# Section 3 - Numeric Permissions (Octal Representation)

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand numeric (octal) permissions.
> - Learn how Linux converts `rwx` into numbers.
> - Calculate permission values manually.
> - Understand common permission values like `755`, `644`, `600`, and `777`.
> - Prepare for using the `chmod` command.

---

# Introduction

Linux permissions can be represented in **two ways**:

1. Symbolic representation
2. Numeric (Octal) representation

Example:

Symbolic:

```text
-rwxr-xr--
```

Numeric:

```text
754
```

Both represent the **same permissions**.

---

# Why Numeric Permissions?

Instead of writing:

```text
rwxr-xr-x
```

You can simply write:

```text
755
```

This makes permission management faster and easier.

Example:

```bash
chmod 755 script.sh
```

---

# Permission Values

Each permission has a numeric value.

| Permission | Symbol | Value |
|------------|--------|------:|
| Read | `r` | 4 |
| Write | `w` | 2 |
| Execute | `x` | 1 |
| No Permission | `-` | 0 |

Remember:

```text
Read    = 4
Write   = 2
Execute = 1
```

---

# Why These Numbers?

Linux uses **binary bits** internally.

```
Read

100

↓

4
```

```
Write

010

↓

2
```

```
Execute

001

↓

1
```

Together:

```
111

↓

7
```

---

# Binary Representation

| Binary | Permission | Decimal |
|---------|------------|---------|
| 000 | --- | 0 |
| 001 | --x | 1 |
| 010 | -w- | 2 |
| 011 | -wx | 3 |
| 100 | r-- | 4 |
| 101 | r-x | 5 |
| 110 | rw- | 6 |
| 111 | rwx | 7 |

---

# How Linux Calculates Permissions

Example:

```
rw-
```

Calculation:

```
Read

4

+

Write

2

+

Execute

0

=

6
```

Therefore:

```
rw-

↓

6
```

---

Another example:

```
r-x
```

Calculation:

```
Read

4

+

Execute

1

=

5
```

Result:

```
r-x

↓

5
```

---

Example:

```
rwx
```

Calculation:

```
4 + 2 + 1 = 7
```

---

Example:

```
r--
```

Calculation:

```
4 + 0 + 0 = 4
```

---

Example:

```
-w-
```

Calculation:

```
0 + 2 + 0 = 2
```

---

Example:

```
--x
```

Calculation:

```
0 + 0 + 1 = 1
```

---

# Owner, Group, Others

Permissions are divided into three parts.

```
Owner

Group

Others
```

Each part gets its own number.

Example:

```
rwx

r-x

r-x
```

Convert:

```
rwx

↓

7
```

```
r-x

↓

5
```

```
r-x

↓

5
```

Result:

```text
755
```

---

# Example 1

Permission string:

```text
-rwxr-xr-x
```

Owner:

```
rwx

↓

7
```

Group:

```
r-x

↓

5
```

Others:

```
r-x

↓

5
```

Final value:

```text
755
```

---

# Example 2

Permission string:

```text
-rw-r--r--
```

Owner:

```
rw-

↓

6
```

Group:

```
r--

↓

4
```

Others:

```
r--

↓

4
```

Final value:

```text
644
```

---

# Example 3

Permission string:

```text
-rw-------
```

Owner:

```
rw-

↓

6
```

Group:

```
---

↓

0
```

Others:

```
---

↓

0
```

Final value:

```text
600
```

---

# Example 4

Permission string:

```text
-rwx------
```

Owner:

```
rwx

↓

7
```

Group:

```
---

↓

0
```

Others:

```
---

↓

0
```

Result:

```text
700
```

---

# Example 5

Permission string:

```text
-rwxrwxrwx
```

Owner:

```
7
```

Group:

```
7
```

Others:

```
7
```

Result:

```text
777
```

---

# Common Permission Values

| Numeric | Symbolic | Meaning |
|----------|----------|---------|
| 777 | rwxrwxrwx | Everyone has full access |
| 755 | rwxr-xr-x | Owner full, others read & execute |
| 750 | rwxr-x--- | Owner full, group read & execute |
| 700 | rwx------ | Owner only |
| 666 | rw-rw-rw- | Everyone can read & write |
| 644 | rw-r--r-- | Owner read & write, others read |
| 640 | rw-r----- | Owner read & write, group read |
| 600 | rw------- | Private file |

---

# Visual Table

| Owner | Group | Others | Numeric |
|--------|-------|--------|---------|
| rwx | rwx | rwx | 777 |
| rwx | r-x | r-x | 755 |
| rw- | r-- | r-- | 644 |
| rw- | --- | --- | 600 |
| rwx | --- | --- | 700 |

---

# Real-World Examples

## Web Server Files

```
644
```

Reason:

- Owner edits files.
- Everyone can read them.
- No one else can modify them.

---

## Shell Script

```
755
```

Reason:

Owner can modify.

Everyone can execute.

---

## Private SSH Key

```
600
```

Reason:

Only the owner should have access.

---

## Home Directory

```
700
```

Reason:

Only the owner can access it.

---

# Converting Symbolic to Numeric

Example:

```text
rwxrw-r--
```

Owner:

```
rwx

↓

7
```

Group:

```
rw-

↓

6
```

Others:

```
r--

↓

4
```

Final answer:

```text
764
```

---

# Converting Numeric to Symbolic

Example:

```
754
```

Owner:

```
7

↓

rwx
```

Group:

```
5

↓

r-x
```

Others:

```
4

↓

r--
```

Final:

```text
rwxr-xr--
```

---

# Memory Trick

Remember these values:

```
r = 4

w = 2

x = 1
```

Then simply add them.

```
rwx

↓

4 + 2 + 1

↓

7
```

---

# Best Practices

✅ Use `644` for normal files.

✅ Use `755` for executable scripts.

✅ Use `700` for private directories.

✅ Use `600` for sensitive files like SSH keys.

❌ Avoid `777` unless absolutely necessary.

---

# Common Mistakes

### Mistake 1

Using:

```text
777
```

for everything.

This allows everyone to modify files.

---

### Mistake 2

Forgetting execute permission on scripts.

```
644

↓

Cannot execute
```

Use:

```
755
```

instead.

---

### Mistake 3

Giving execute permission to text documents.

Example:

```
notes.txt

755
```

Text files normally do **not** need execute permission.

---

# Practice Lab

## Exercise 1

Convert:

```
rwxr-xr--
```

into numeric form.

---

## Exercise 2

Convert:

```
644
```

into symbolic form.

---

## Exercise 3

Calculate:

```
rw-r-----
```

---

## Exercise 4

Calculate:

```
rwx------
```

---

## Exercise 5

Identify suitable permissions for:

- Website HTML file
- Bash script
- Private SSH key
- Home directory

Explain your choices.

---

# Interview Questions

1. Why does Linux use numeric permissions?
2. What are the numeric values of `r`, `w`, and `x`?
3. Convert `rwxr-xr-x` to numeric.
4. Convert `640` to symbolic.
5. Why is `777` considered insecure?
6. Why is `600` recommended for SSH private keys?
7. What permission is commonly used for executable scripts?
8. What permission is commonly used for normal text files?
9. Explain how Linux calculates permission values.
10. What does `755` mean?

---

# Summary

You learned:

- Numeric permissions (Octal)
- Binary representation
- Permission calculations
- Symbolic ↔ Numeric conversion
- Common permission values
- Best practices
- Real-world examples

---

# What's Next?

In **Part 1B – Section 4**, you'll learn:

- The `chmod` command
- Symbolic mode (`u`, `g`, `o`, `a`)
- Numeric mode (`755`, `644`, etc.)
- Recursive permissions
- Real-world `chmod` examples
- Common mistakes and troubleshooting



# Chapter 06 - File Permissions and Ownership

---

# Part 1B - Understanding Read, Write, and Execute Permissions

# Section 4 - The `chmod` Command

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Understand the purpose of the `chmod` command.
> - Change permissions using numeric mode.
> - Change permissions using symbolic mode.
> - Apply permissions recursively.
> - Verify permission changes.
> - Follow best practices when modifying permissions.

---

# Introduction

So far, you've learned how Linux **represents** permissions.

Now it's time to **change** them.

Linux provides the **`chmod`** (Change Mode) command for modifying file and directory permissions.

Example:

```bash
chmod 755 script.sh
```

This changes the permissions of `script.sh`.

---

# What is `chmod`?

`chmod` stands for:

```text
CHange MODe
```

It modifies the permission bits of files and directories.

You can use it in two ways:

- Numeric (Octal) Mode
- Symbolic Mode

---

# Syntax

## Numeric Mode

```bash
chmod PERMISSION FILE
```

Example:

```bash
chmod 644 notes.txt
```

---

## Symbolic Mode

```bash
chmod [who][operator][permission] FILE
```

Example:

```bash
chmod u+x script.sh
```

---

# Checking Current Permissions

Before changing permissions, check the current values.

```bash
ls -l script.sh
```

Example:

```text
-rw-r--r-- script.sh
```

---

After changing permissions:

```bash
chmod 755 script.sh
```

Verify:

```bash
ls -l script.sh
```

Output:

```text
-rwxr-xr-x script.sh
```

---

# Numeric Mode

Numeric mode uses **octal values**.

Example:

```bash
chmod 755 script.sh
```

Meaning:

| User | Permission |
|------|------------|
| Owner | rwx |
| Group | r-x |
| Others | r-x |

---

# Common Numeric Permissions

| Permission | Meaning |
|------------|----------|
| 777 | Full access for everyone |
| 755 | Executable file |
| 700 | Private executable |
| 644 | Normal text file |
| 600 | Private file |

---

# Example 1

Create a file.

```bash
touch notes.txt
```

Current permissions:

```bash
ls -l notes.txt
```

Output:

```text
-rw-r--r--
```

Change:

```bash
chmod 600 notes.txt
```

Verify:

```text
-rw-------
```

---

# Example 2

Create a shell script.

```bash
touch backup.sh
```

Make it executable.

```bash
chmod 755 backup.sh
```

Verify:

```text
-rwxr-xr-x
```

---

# Symbolic Mode

Symbolic mode is easier when changing only specific permissions.

Instead of remembering numbers,

you specify:

- Who
- Operation
- Permission

---

# The "Who" Values

| Symbol | Meaning |
|---------|----------|
| u | User (Owner) |
| g | Group |
| o | Others |
| a | All |

---

# The Operators

| Operator | Meaning |
|-----------|----------|
| + | Add permission |
| - | Remove permission |
| = | Set exact permission |

---

# Permission Symbols

| Symbol | Meaning |
|---------|----------|
| r | Read |
| w | Write |
| x | Execute |

---

# Adding Execute Permission

Example:

```bash
chmod u+x script.sh
```

Meaning:

```
Owner

↓

Add Execute
```

---

# Removing Write Permission

```bash
chmod g-w report.txt
```

Meaning:

```
Group

↓

Remove Write
```

---

# Give Read Permission to Others

```bash
chmod o+r notes.txt
```

---

# Remove Execute from Everyone

```bash
chmod a-x script.sh
```

---

# Set Exact Permissions

```bash
chmod u=rw file.txt
```

Owner now has:

```
Read

Write
```

Any previous execute permission is removed.

---

# Multiple Changes at Once

Example:

```bash
chmod u+rwx,g+rx,o+r script.sh
```

Meaning:

Owner:

```
Read

Write

Execute
```

Group:

```
Read

Execute
```

Others:

```
Read
```

---

# Recursive Permissions

Directories often contain many files.

Instead of changing each one manually,

use:

```bash
chmod -R 755 Project
```

The `-R` option means:

```
Recursive
```

Every file and directory inside `Project` will receive the new permissions.

---

# Example

Directory:

```
Website/

├── index.html

├── css/

├── js/

└── images/
```

Command:

```bash
chmod -R 755 Website
```

Everything inside is updated.

---

# Verify Changes

Always check the results.

```bash
ls -l
```

or

```bash
ls -lR
```

---

# Real-World Examples

## Make a Script Executable

Before:

```text
-rw-r--r--
```

Command:

```bash
chmod +x deploy.sh
```

After:

```text
-rwxr-xr-x
```

---

## Protect a Private File

```bash
chmod 600 id_rsa
```

Only the owner can read and write.

---

## Share a Script

```bash
chmod 755 backup.sh
```

Everyone can execute it,

only the owner can modify it.

---

## Protect a Home Directory

```bash
chmod 700 /home/student
```

Only the owner can access the directory.

---

# Difference Between Numeric and Symbolic Mode

| Numeric | Symbolic |
|----------|----------|
| Uses numbers | Uses letters |
| Replaces permissions | Adds or removes specific permissions |
| Faster for full changes | Better for small changes |

Example:

Numeric:

```bash
chmod 644 file.txt
```

Symbolic:

```bash
chmod g+w file.txt
```

---

# Common Mistakes

## Mistake 1

Using:

```bash
chmod 777 *
```

This gives everyone full control.

Avoid unless absolutely necessary.

---

## Mistake 2

Forgetting execute permission.

Example:

```bash
./script.sh
```

Output:

```text
Permission denied
```

Solution:

```bash
chmod +x script.sh
```

---

## Mistake 3

Using recursive permissions carelessly.

Example:

```bash
chmod -R 777 /
```

This is extremely dangerous and can compromise the entire system.

---

## Mistake 4

Changing permissions without checking them.

Always verify with:

```bash
ls -l
```

---

# Best Practices

✅ Use `644` for normal files.

✅ Use `755` for executable scripts.

✅ Use `700` for private directories.

✅ Use `600` for sensitive files.

✅ Verify changes after running `chmod`.

❌ Avoid `777` whenever possible.

---

# Practice Lab

## Exercise 1

Create a file.

```bash
touch demo.txt
```

Change permissions.

```bash
chmod 600 demo.txt
```

Verify.

---

## Exercise 2

Create a script.

```bash
touch hello.sh
```

Make it executable.

```bash
chmod +x hello.sh
```

Verify.

---

## Exercise 3

Remove write permission from the group.

```bash
chmod g-w hello.sh
```

---

## Exercise 4

Give read permission to others.

```bash
chmod o+r hello.sh
```

---

## Exercise 5

Create a directory.

```bash
mkdir Project
```

Create files inside.

Apply recursive permissions.

```bash
chmod -R 755 Project
```

Verify.

---

## Exercise 6

Convert these symbolic commands into numeric equivalents.

```bash
chmod u+rwx,g+rx,o+rx app.sh
```

What numeric permission does this represent?

---

# Interview Questions

1. What does `chmod` stand for?
2. What is the difference between numeric and symbolic mode?
3. What does `chmod 755 file` do?
4. What does `chmod +x script.sh` do?
5. What does `chmod -R` mean?
6. Why should `777` be avoided?
7. How do you remove write permission from a group?
8. Which command makes a script executable?
9. How do you verify permission changes?
10. Which permission is commonly used for private files?

---

# Summary

In this section, you learned:

- What `chmod` is
- Numeric mode
- Symbolic mode
- Recursive permission changes
- Permission verification
- Best practices
- Common mistakes
- Real-world examples

---

# What's Next?

In **Part 1B – Section 5**, you'll complete this part with a comprehensive hands-on lab that includes:

- 25+ practical exercises
- Real-world permission scenarios
- Mini project
- Troubleshooting permission errors
- Interview-based challenges
- Chapter revision and cheat sheet


# Chapter 06 - File Permissions and Ownership

---

# Part 1B - Understanding Read, Write, and Execute Permissions

# Section 5 - Hands-on Practice Lab, Mini Project & Chapter Revision

> **Learning Objectives**
>
> After completing this section, you will be able to:
>
> - Apply Linux permissions in real-world scenarios.
> - Use `chmod` confidently.
> - Troubleshoot permission-related errors.
> - Complete a mini project.
> - Revise the entire chapter.
> - Prepare for Linux interviews and certifications.

---

# Introduction

Learning Linux permissions requires **practice**.

In this section, you'll complete hands-on exercises that simulate real system administration tasks.

> **Recommended Practice Environment**
>
> - Ubuntu VM
> - VirtualBox
> - VMware
> - WSL2 (Windows Subsystem for Linux)
> - Any Linux server

---

# Lab 1 - Viewing Permissions

## Exercise 1

Create a practice directory.

```bash
mkdir PermissionLab
cd PermissionLab
```

---

## Exercise 2

Create some files.

```bash
touch file1.txt
touch file2.txt
touch script.sh
```

---

## Exercise 3

View permissions.

```bash
ls -l
```

Expected Output:

```text
-rw-r--r-- file1.txt
-rw-r--r-- file2.txt
-rw-r--r-- script.sh
```

---

# Lab 2 - Making Scripts Executable

Check permissions.

```bash
ls -l script.sh
```

Try running it.

```bash
./script.sh
```

Output:

```text
Permission denied
```

Now add execute permission.

```bash
chmod +x script.sh
```

Verify.

```bash
ls -l script.sh
```

Expected:

```text
-rwxr-xr-x
```

Run again.

```bash
./script.sh
```

---

# Lab 3 - Numeric Permissions

Set:

```bash
chmod 600 file1.txt
```

Verify.

```bash
ls -l file1.txt
```

Expected:

```text
-rw-------
```

---

Set:

```bash
chmod 644 file2.txt
```

Verify.

```bash
ls -l file2.txt
```

Expected:

```text
-rw-r--r--
```

---

Set:

```bash
chmod 755 script.sh
```

Verify.

---

# Lab 4 - Symbolic Permissions

Remove execute permission.

```bash
chmod u-x script.sh
```

Verify.

---

Add execute permission back.

```bash
chmod u+x script.sh
```

---

Remove write permission from group.

```bash
chmod g-w script.sh
```

---

Give read permission to others.

```bash
chmod o+r script.sh
```

---

# Lab 5 - Directory Permissions

Create directories.

```bash
mkdir Project
mkdir Private
```

View permissions.

```bash
ls -ld Project Private
```

---

Make Project public.

```bash
chmod 755 Project
```

---

Make Private secure.

```bash
chmod 700 Private
```

Verify.

---

# Lab 6 - Recursive Permissions

Create folders.

```bash
mkdir Website
cd Website

mkdir css js images

touch index.html
touch css/style.css
touch js/app.js

cd ..
```

Display structure.

```bash
tree Website
```

Apply recursive permissions.

```bash
chmod -R 755 Website
```

Verify.

```bash
ls -lR Website
```

---

# Lab 7 - Permission Conversion

Convert the following.

## Exercise 1

```text
rwxr-xr-x
```

Answer:

```text
755
```

---

## Exercise 2

```text
rw-r--r--
```

Answer:

```text
644
```

---

## Exercise 3

```text
rw-------
```

Answer:

```text
600
```

---

## Exercise 4

```text
700
```

Answer:

```text
rwx------
```

---

## Exercise 5

```text
754
```

Answer:

```text
rwxr-xr--
```

---

# Lab 8 - Reading Permission Strings

Interpret:

```text
-rwxr-x---
```

Answer:

- File
- Owner: Read, Write, Execute
- Group: Read, Execute
- Others: No Access

---

Interpret:

```text
drwxr-xr-x
```

Answer:

- Directory
- Owner: Full Access
- Group: Read, Execute
- Others: Read, Execute

---

# Lab 9 - Real-World Scenarios

## Scenario 1

A shell script should:

- Run for everyone
- Only owner can edit

Correct permission:

```text
755
```

---

## Scenario 2

SSH Private Key

Only owner should access it.

Correct permission:

```text
600
```

---

## Scenario 3

Website HTML files

Owner edits them.

Everyone reads them.

Correct permission:

```text
644
```

---

## Scenario 4

Private Home Directory

Only owner should access.

Correct permission:

```text
700
```

---

# Lab 10 - Troubleshooting

## Problem 1

```text
Permission denied
```

Possible causes:

- Missing execute permission
- Missing read permission
- Missing directory execute permission

Check:

```bash
ls -l
```

---

## Problem 2

Cannot execute script.

Solution:

```bash
chmod +x script.sh
```

---

## Problem 3

Cannot enter directory.

Solution:

Check execute permission.

```bash
ls -ld DirectoryName
```

---

## Problem 4

Cannot modify file.

Check:

- File write permission
- File owner
- Group membership

---

# Mini Project - Secure Company Folder

## Objective

Create the following structure.

```text
Company/

├── HR/

├── Finance/

├── Development/

└── Public/
```

---

## Step 1

Create directories.

```bash
mkdir -p Company/{HR,Finance,Development,Public}
```

---

## Step 2

Assign permissions.

HR

```bash
chmod 700 Company/HR
```

Finance

```bash
chmod 700 Company/Finance
```

Development

```bash
chmod 755 Company/Development
```

Public

```bash
chmod 755 Company/Public
```

---

## Step 3

Verify.

```bash
ls -ld Company/*
```

---

# Mini Project Challenge

Create this structure.

```text
WebServer/

├── html/

├── css/

├── js/

├── images/

└── scripts/
```

Requirements:

- HTML files → `644`
- CSS → `644`
- JS → `644`
- Shell scripts → `755`
- Images → `644`
- Directories → `755`

---

# Quick Revision

## File Permission Values

| Permission | Value |
|------------|------:|
| Read | 4 |
| Write | 2 |
| Execute | 1 |

---

## Common Permission Numbers

| Number | Symbolic | Usage |
|---------|----------|-------|
| 777 | rwxrwxrwx | Avoid in production |
| 755 | rwxr-xr-x | Scripts & directories |
| 700 | rwx------ | Private directory |
| 644 | rw-r--r-- | Regular files |
| 600 | rw------- | Sensitive files |

---

## `chmod` Cheat Sheet

| Command | Purpose |
|----------|---------|
| `chmod 755 file` | Full owner access, read/execute for others |
| `chmod 644 file` | Standard file permissions |
| `chmod 600 file` | Private file |
| `chmod +x file` | Add execute permission |
| `chmod -x file` | Remove execute permission |
| `chmod g+w file` | Add write permission to group |
| `chmod o-r file` | Remove read permission from others |
| `chmod -R 755 dir` | Apply recursively |

---

# Common Commands

```bash
ls -l
```

View permissions.

---

```bash
ls -ld Directory
```

View directory permissions.

---

```bash
chmod 755 script.sh
```

Set numeric permissions.

---

```bash
chmod +x script.sh
```

Make executable.

---

```bash
chmod -R 755 Project
```

Recursive permission change.

---

# Chapter Summary

Congratulations! 🎉

You have completed **Chapter 06 – File Permissions and Ownership**.

You now understand:

- Linux Security Model
- Users
- Groups
- File Ownership
- Group Ownership
- Permission Strings
- `ls -l`
- File Types
- Read, Write, Execute Permissions
- File vs Directory Permissions
- Numeric (Octal) Permissions
- Binary Permission Values
- `chmod`
- Symbolic Mode
- Numeric Mode
- Recursive Permissions
- Real-world Permission Management
- Permission Troubleshooting

---

# Interview Questions

1. What is the purpose of Linux permissions?
2. Explain the difference between Owner, Group, and Others.
3. What does `755` mean?
4. What does `644` mean?
5. Why should `777` generally be avoided?
6. What is the difference between file and directory permissions?
7. What does execute permission mean for a directory?
8. What command changes file permissions?
9. What does `chmod -R` do?
10. Explain the output of:

```text
-rwxr-xr--
```

11. How does Linux decide which permission set (Owner, Group, or Others) to use?
12. What permission should an SSH private key have?
13. Why is `755` commonly used for scripts?
14. How do you make a file executable?
15. What is the difference between symbolic and numeric modes in `chmod`?

---

# Final Challenge

Create the following structure **without referring to your notes**:

```text
LinuxPractice/

├── Documents/
│   ├── notes.txt
│   └── report.pdf
│
├── Scripts/
│   ├── backup.sh
│   └── deploy.sh
│
├── Private/
│   └── secrets.txt
│
└── Public/
    └── readme.txt
```

Apply the following permissions:

| Item | Permission |
|------|------------|
| Directories | `755` |
| `notes.txt` | `644` |
| `report.pdf` | `644` |
| `backup.sh` | `755` |
| `deploy.sh` | `755` |
| `secrets.txt` | `600` |
| `readme.txt` | `644` |

Verify everything using:

```bash
ls -lR LinuxPractice
```

If your output matches the expected permissions, you've mastered the fundamentals of Linux file permissions.

---

# What's Next?

## Chapter 07 - User and Group Management

In the next chapter, you'll learn:

- Creating Users (`useradd`, `adduser`)
- Deleting Users (`userdel`)
- Modifying Users (`usermod`)
- Creating Groups (`groupadd`)
- Deleting Groups (`groupdel`)
- Managing Group Membership
- Password Management (`passwd`)
- User Account Locking & Expiration
- `sudo` Configuration
- `/etc/passwd`, `/etc/shadow`, and `/etc/group` in depth
- User Management Best Practices
