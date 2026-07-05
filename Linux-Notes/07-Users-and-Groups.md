---
Title: Chapter 07 - Users and Groups
Chapter: 07
Part: 1
Difficulty: Beginner
Estimated_time: 2 Hours
Prerequisites:
  - Linux File System
  - Linux Permissions
  - chmod
  - Basic Terminal Commands
---

# 👥 Chapter 07 - Users and Groups

> **"Linux is a multi-user operating system."**
>
> Understanding users and groups is one of the most important skills for every Linux Administrator, DevOps Engineer, Cloud Engineer, and Cyber Security Professional.

---

# 🎯 Learning Objectives

By the end of this part, you will be able to:

- ✅ Understand what a Linux user is
- ✅ Understand what a Linux group is
- ✅ Learn why Linux uses users and groups
- ✅ Understand multi-user architecture
- ✅ Learn user types
- ✅ Understand User IDs (UID)
- ✅ Understand Group IDs (GID)
- ✅ Learn the relationship between users and groups
- ✅ Visualize how Linux authenticates users

---

# 📖 Introduction

Unlike Windows (which is often used by a single person), Linux was designed from the beginning to allow **multiple users** to work on the same computer **at the same time**.

Imagine a university server.

```
                    Linux Server
                         │
     ┌──────────────┬──────────────┬──────────────┐
     │              │              │              │
   Alice          Bob          Charlie        Professor
```

Each user:

- Has their own username
- Has their own password
- Has their own files
- Has their own home directory
- Has their own permissions

Linux keeps everyone's data separated and secure.

---

# 🤔 Why Do We Need Users?

Imagine there were **no users**.

```
Linux Computer

Documents
Payroll.xlsx
Photos
Passwords.txt
Website Files
```

Everyone could:

- Delete files
- Modify files
- Read confidential data
- Install software
- Shut down the server

🚨 This would be a security disaster.

Linux solves this problem using **Users**.

---

# 👤 What is a User?

A **User** is an identity that Linux uses to determine:

- Who is logged in
- What files they own
- Which commands they can run
- What permissions they have

Think of a user as a **digital identity**.

```
Person
   │
Username
   │
Password
   │
Linux Account
```

---

# 🏢 Real-World Example

Imagine a company.

```
ABC Company

CEO
HR
Developers
Accountants
Interns
```

Each employee receives:

- Username
- Password
- Email
- Employee ID

Linux works in a very similar way.

---

# 👨‍💻 Example Users

```
alice

bob

john

student

ubuntu

root
```

Every one of these is a Linux user.

---

# 🛡️ What is the Root User?

The **root** user is the most powerful account in Linux.

```
root

↓

Super User

↓

Full Control
```

The root user can:

- Read every file
- Modify every file
- Delete every file
- Install software
- Create users
- Delete users
- Shut down the system
- Change passwords

---

# ⚠️ Be Careful with Root

Example:

```bash
sudo rm -rf /
```

This command attempts to delete almost everything on the system.

> **Never run commands you don't understand as `root` or with `sudo`.**

---

# 👥 What is a Group?

A **Group** is a collection of users.

Instead of assigning permissions to users one by one, Linux lets you assign permissions to a group.

```
Developers Group

├── Alice
├── Bob
├── Charlie
└── David
```

Now all developers can access the same project.

---

# 🎨 Why Groups Exist

Without groups:

```
Project

↓

Alice → Permission

Bob → Permission

Charlie → Permission

David → Permission
```

With groups:

```
Project

↓

Developers Group

↓

Everyone gets access
```

Much simpler!

---

# 🔄 Relationship Between Users and Groups

Every Linux user belongs to:

- One **Primary Group**
- Zero or more **Secondary Groups**

```
                Alice
                  │
       ┌──────────┴──────────┐
       │                     │
 Primary Group         Secondary Groups
    developers      docker, sudo, git
```

---

# 📌 Primary Group

Every user has **one** primary group.

Example:

```
User

alice

↓

Primary Group

developers
```

Files created by Alice will usually belong to this group.

---

# 📌 Secondary Groups

Users may belong to multiple additional groups.

```
Alice

├── developers
├── docker
├── sudo
└── git
```

This allows Alice to access multiple shared resources.

---

# 🆔 What is a UID?

Every user has a unique **User ID (UID)**.

Linux identifies users by their UID, not by their username.

```
Username

alice

↓

UID

1001
```

Think of the UID as an employee ID.

---

# 🆔 What is a GID?

Every group has a unique **Group ID (GID)**.

```
Group

developers

↓

GID

1001
```

---

# 📊 Example

| Username | UID | Primary Group | GID |
|----------|----:|---------------|----:|
| root | 0 | root | 0 |
| alice | 1000 | developers | 1000 |
| bob | 1001 | developers | 1000 |

---

# 🧠 How Linux Identifies a User

When you log in:

```
Username
      │
      ▼
Password
      │
      ▼
Authentication
      │
      ▼
UID + GID Loaded
      │
      ▼
Access Granted
```

Linux then checks permissions using the UID and GID.

---

# 📂 Home Directory

Every normal user gets a home directory.

Example:

```
/home/alice

/home/bob

/home/student
```

This is where personal files are stored.

```
/home/alice

├── Documents
├── Downloads
├── Pictures
├── Music
└── Desktop
```

---

# 🧰 System Users

Not every Linux user represents a human.

Many background services run using system accounts.

Examples:

```
mysql

www-data

nginx

postgres

daemon

nobody
```

These accounts improve security by limiting service permissions.

---

# 📋 User Types

```
Linux Users

├── Root User
├── Regular User
├── System User
└── Service User
```

| Type | Purpose |
|------|---------|
| Root | Full administrative control |
| Regular | Human users |
| System | Internal OS operations |
| Service | Run applications and services |

---

# 🔍 View Current User

```bash
whoami
```

Example:

```text
student
```

---

# 🔍 View UID and Groups

```bash
id
```

Example:

```text
uid=1000(student)
gid=1000(student)
groups=1000(student),27(sudo)
```

---

# 🌳 User & Group Relationship Diagram

```
                  Linux
                    │
        ┌───────────┴───────────┐
        │                       │
      Users                  Groups
        │                       │
        ├── Alice          developers
        ├── Bob            docker
        ├── Charlie        sudo
        └── David          git
```

---

# 💡 Key Takeaways

> ✅ A user is a digital identity.
>
> ✅ Every user has a unique UID.
>
> ✅ Every group has a unique GID.
>
> ✅ Every user belongs to at least one group.
>
> ✅ Root has unrestricted privileges.
>
> ✅ Groups simplify permission management.
>
> ✅ Linux uses UIDs and GIDs internally for access control.

---

# 🧪 Practice Lab

### Exercise 1

Display the current user.

```bash
whoami
```

---

### Exercise 2

Display UID, GID, and groups.

```bash
id
```

---

### Exercise 3

Display your home directory.

```bash
echo $HOME
```

---

### Exercise 4

Display your username.

```bash
echo $USER
```

---

### Exercise 5

List all users on the system.

```bash
cut -d: -f1 /etc/passwd
```

*(You'll learn about `/etc/passwd` later in this chapter.)*

---

# 📝 Interview Questions

1. What is a Linux user?
2. What is the purpose of groups?
3. What is the difference between UID and username?
4. What is the root user?
5. Why does Linux use groups?
6. What is a primary group?
7. What are secondary groups?
8. What is the default home directory for users?
9. What command displays your UID?
10. Name the four main types of Linux users.

---

# 📚 What's Next?

## Part 2 – User Management Commands

You'll learn how to:

- Create users (`useradd`, `adduser`)
- Modify users (`usermod`)
- Delete users (`userdel`)
- Change passwords (`passwd`)
- Lock and unlock user accounts
- Understand account expiration


---
title: Chapter 07 - Users and Groups
chapter: 07
part: 2
difficulty: Beginner
estimated_time: 3 Hours
---

# 👥 Chapter 07 - Users and Groups

# Part 2 - User Management Commands

> **"Managing users is one of the most common tasks for a Linux System Administrator."**

This section teaches you how to create, modify, lock, unlock, and delete users using Linux commands.

---

# 🎯 Learning Objectives

By the end of this section, you will be able to:

- ✅ Create new users
- ✅ Delete users
- ✅ Modify existing users
- ✅ Understand home directories
- ✅ Set login shells
- ✅ Lock and unlock accounts
- ✅ View user information
- ✅ Understand important command options
- ✅ Practice real-world user management

---

# 🗺️ User Management Workflow

```text
                     User Management

                            │
      ┌─────────────────────┼─────────────────────┐
      │                     │                     │
   Create User         Modify User         Delete User
      │                     │                     │
   useradd             usermod              userdel
      │                     │                     │
      └──────────────► Manage Account ◄──────────┘
```

---

# 👤 Creating Users

Linux provides two common commands:

```text
useradd
```

and

```text
adduser
```

Although both create users, they behave differently.

---

# 🆚 useradd vs adduser

| Feature | useradd | adduser |
|----------|---------|----------|
| Type | Low-level command | User-friendly script |
| Creates Home Directory | Not always | Yes |
| Interactive | No | Yes |
| Recommended for Beginners | ❌ | ✅ |
| Used in Automation | ✅ | Sometimes |

---

# 📦 Command: `useradd`

### Syntax

```bash
sudo useradd username
```

Example:

```bash
sudo useradd john
```

This creates the user **john**, but depending on the distribution, it **may not** create a home directory.

---

# 📦 Command: `adduser`

### Syntax

```bash
sudo adduser username
```

Example:

```bash
sudo adduser alice
```

Example Output:

```text
Adding user `alice' ...
Adding new group `alice' ...
Creating home directory `/home/alice' ...
Copying files from `/etc/skel' ...
Enter new UNIX password:
Retype new UNIX password:
```

---

# 🎨 What Happens When a User is Created?

```text
             adduser alice

                    │
                    ▼

          Create User Account

                    │
                    ▼

          Assign UID & GID

                    │
                    ▼

      Create Home Directory

                    │
                    ▼

      Copy Default Files

                    │
                    ▼

         Set Password

                    │
                    ▼

          User Ready
```

---

# 🏠 Home Directory

A home directory stores a user's personal files.

Example:

```text
/home/alice
```

View it:

```bash
ls /home
```

Example:

```text
alice
bob
student
```

---

# 📂 Default Files

When a new user is created, Linux copies files from:

```text
/etc/skel
```

These include:

```text
.bashrc

.profile

.bash_logout
```

View them:

```bash
ls -la /home/alice
```

---

# 🆔 Viewing User Information

Display user details.

```bash
id alice
```

Output:

```text
uid=1001(alice)
gid=1001(alice)
groups=1001(alice)
```

---

# 👀 Check if a User Exists

```bash
getent passwd alice
```

Example:

```text
alice:x:1001:1001:Alice:/home/alice:/bin/bash
```

---

# 📖 Understanding `/etc/passwd`

Example Entry:

```text
alice:x:1001:1001:Alice:/home/alice:/bin/bash
```

Breakdown:

```text
Username

↓

alice

↓

Password Placeholder

↓

x

↓

UID

↓

1001

↓

GID

↓

1001

↓

Comment

↓

Alice

↓

Home Directory

↓

/home/alice

↓

Login Shell

↓

/bin/bash
```

We'll study this file in detail later.

---

# 🛠️ Creating a User with a Home Directory

```bash
sudo useradd -m david
```

Option:

```text
-m
```

Meaning:

```
Create Home Directory
```

---

# 📝 Set a User Comment

```bash
sudo useradd -c "Backend Developer" david
```

Verify:

```bash
getent passwd david
```

---

# 🏠 Specify a Custom Home Directory

```bash
sudo useradd -m -d /developers/alice alice
```

Meaning:

```text
-d

↓

Custom Home Directory
```

---

# 🐚 Set a Login Shell

Default shell:

```text
/bin/bash
```

Specify another shell:

```bash
sudo useradd -m -s /bin/zsh alice
```

Other examples:

```text
/bin/bash

/bin/sh

/bin/zsh

/bin/fish
```

---

# 🔍 View Available Shells

```bash
cat /etc/shells
```

Example:

```text
/bin/sh
/bin/bash
/bin/zsh
/usr/bin/fish
```

---

# ✏️ Modify an Existing User

Command:

```bash
sudo usermod
```

Syntax:

```bash
sudo usermod [OPTIONS] username
```

---

# 📝 Change Login Name

```bash
sudo usermod -l newname oldname
```

Example:

```bash
sudo usermod -l david john
```

---

# 🏠 Change Home Directory

```bash
sudo usermod -d /home/newhome -m alice
```

Options:

```text
-d

↓

New Home Directory
```

```text
-m

↓

Move Existing Files
```

---

# 🐚 Change Login Shell

```bash
sudo usermod -s /bin/zsh alice
```

Verify:

```bash
getent passwd alice
```

---

# ➕ Add User to Another Group

```bash
sudo usermod -aG docker alice
```

Options:

```text
-a

↓

Append
```

```text
-G

↓

Secondary Group
```

---

# ⚠️ Common Mistake

Wrong:

```bash
sudo usermod -G docker alice
```

This **replaces** all existing secondary groups.

Correct:

```bash
sudo usermod -aG docker alice
```

Always use **`-aG`** when adding a user to a group.

---

# 🔒 Lock a User Account

```bash
sudo usermod -L alice
```

Result:

```
User cannot log in.
```

---

# 🔓 Unlock a User Account

```bash
sudo usermod -U alice
```

---

# 🚫 Delete a User

Command:

```bash
sudo userdel alice
```

This removes the user account **only**.

Home directory remains.

---

# 🗑️ Delete User and Home Directory

```bash
sudo userdel -r alice
```

Option:

```text
-r

↓

Remove Home Directory
```

---

# 📊 User Management Command Summary

| Command | Purpose |
|----------|---------|
| `useradd` | Create user |
| `adduser` | Interactive user creation |
| `usermod` | Modify user |
| `userdel` | Delete user |
| `id` | Display UID/GID |
| `getent passwd` | View user entry |
| `whoami` | Show current user |

---

# 🌍 Real-World Example

A new employee joins the company.

Steps:

```text
Employee Joins

        │

Create User

        │

Create Home Directory

        │

Assign Password

        │

Add to Developers Group

        │

Ready to Work
```

Commands:

```bash
sudo adduser john
sudo usermod -aG developers john
```

---

# 💡 Best Practices

✅ Use `adduser` for manual account creation.

✅ Use `useradd` in automation scripts.

✅ Always create a home directory.

✅ Remove unused accounts.

✅ Lock accounts instead of deleting them immediately.

✅ Verify changes with `id` or `getent passwd`.

---

# ❌ Common Mistakes

### Mistake 1

Deleting a user without removing the home directory.

```bash
sudo userdel alice
```

Files remain.

Use:

```bash
sudo userdel -r alice
```

---

### Mistake 2

Forgetting `-a` when adding groups.

Wrong:

```bash
sudo usermod -G docker alice
```

Correct:

```bash
sudo usermod -aG docker alice
```

---

### Mistake 3

Creating users without passwords.

Users cannot log in until a password is set.

---

# 🧪 Practice Lab

## Exercise 1

Create a user.

```bash
sudo adduser developer
```

---

## Exercise 2

View user details.

```bash
id developer
```

---

## Exercise 3

Display the home directory.

```bash
ls /home
```

---

## Exercise 4

Change the login shell.

```bash
sudo usermod -s /bin/bash developer
```

---

## Exercise 5

Lock the account.

```bash
sudo usermod -L developer
```

Unlock it.

```bash
sudo usermod -U developer
```

---

## Exercise 6

Delete the user and remove the home directory.

```bash
sudo userdel -r developer
```

---

# 📝 Interview Questions

1. What is the difference between `useradd` and `adduser`?
2. Which command creates a home directory?
3. What does the `-m` option do?
4. How do you change a user's login shell?
5. How do you lock a user account?
6. How do you unlock a user account?
7. What does `userdel -r` do?
8. Why should you use `-aG` with `usermod`?
9. Which file stores user account information?
10. Which command displays a user's UID and GID?

---

# 📚 What's Next?

## Part 3 - Group Management

You'll learn:

- Creating groups (`groupadd`)
- Deleting groups (`groupdel`)
- Modifying groups (`groupmod`)
- Viewing group information
- Primary vs Secondary Groups
- Adding and removing users from groups
- `/etc/group` explained
- Real-world group management

---
title: Chapter 07 - Users and Groups
chapter: 07
part: 3
difficulty: Beginner
estimated_time: 2.5 Hours
---

# 👥 Chapter 07 - Users and Groups

# Part 3 - Group Management

> **"Groups are the foundation of permission management in Linux."**

Instead of assigning permissions to every user individually, Linux allows you to assign permissions to **groups**. This makes administration easier, especially on servers with hundreds or thousands of users.

---

# 🎯 Learning Objectives

After completing this part, you will be able to:

- ✅ Understand Linux groups
- ✅ Create and delete groups
- ✅ Modify group names and IDs
- ✅ Add and remove users from groups
- ✅ Understand Primary vs Secondary Groups
- ✅ View group information
- ✅ Understand the `/etc/group` file
- ✅ Manage groups like a Linux System Administrator

---

# 🧭 Why Do We Need Groups?

Imagine a company with 100 employees.

```
                    Company Server

                           │

      ┌──────────────┬──────────────┬──────────────┐
      │              │              │
 Developers        HR Team      Finance Team
```

Without groups:

```
Project Folder

↓

Alice → Permission

Bob → Permission

Charlie → Permission

David → Permission

...

100 Users
```

Every permission must be assigned individually.

---

With groups:

```
Project Folder

↓

developers

↓

Everyone inside the group gets access.
```

✔ Simpler

✔ Easier

✔ More secure

---

# 📦 What is a Group?

A **Group** is a collection of users.

```
developers

├── Alice

├── Bob

├── Charlie

└── David
```

Instead of managing permissions user-by-user, Linux manages them group-by-group.

---

# 👤 Primary vs Secondary Groups

Every user belongs to:

```
                User

                  │

      ┌───────────┴───────────┐

      │                       │

 Primary Group         Secondary Groups
```

Example:

```
Alice

↓

Primary

developers

↓

Secondary

docker

sudo

git
```

---

# 🔹 Primary Group

Every user has **exactly one** primary group.

Example:

```bash
id alice
```

Output:

```text
uid=1001(alice)
gid=1001(developers)
groups=1001(developers),27(sudo),998(docker)
```

Primary Group:

```
developers
```

Files created by Alice normally belong to this group.

---

# 🔹 Secondary Groups

Users may belong to many additional groups.

Example:

```
Alice

├── developers

├── docker

├── sudo

└── git
```

These groups grant additional permissions.

---

# 🎨 Visual Relationship

```
                 Alice

                   │

        ┌──────────┴──────────┐

        │                     │

 Primary Group          Secondary Groups

 developers          docker

                     sudo

                     git
```

---

# 🏗️ Creating a Group

Command:

```bash
sudo groupadd developers
```

Verify:

```bash
getent group developers
```

Example:

```text
developers:x:1001:
```

---

# 📖 Understanding Group Entry

Example:

```text
developers:x:1001:
```

Breakdown:

```text
developers

↓

Group Name

↓

x

↓

Password Placeholder

↓

1001

↓

GID

↓

Members
```

---

# 👀 View All Groups

Display all groups.

```bash
cut -d: -f1 /etc/group
```

or

```bash
getent group
```

---

# 🔍 View Current User's Groups

```bash
groups
```

Example:

```text
student sudo docker
```

---

Or:

```bash
id
```

---

# ➕ Add User to a Group

Command:

```bash
sudo usermod -aG developers alice
```

Meaning:

```
Append

↓

developers

↓

to Alice
```

Verify:

```bash
groups alice
```

Example:

```text
alice : alice developers
```

---

# ⚠️ Why `-aG`?

Correct:

```bash
sudo usermod -aG docker alice
```

Incorrect:

```bash
sudo usermod -G docker alice
```

Without `-a`:

❌ Existing secondary groups are removed.

---

# ➖ Remove User from a Group

Command:

```bash
sudo gpasswd -d alice developers
```

Output:

```text
Removing user alice from group developers
```

Verify:

```bash
groups alice
```

---

# 📝 Change Group Name

Command:

```bash
sudo groupmod -n engineers developers
```

Meaning:

```
Rename

developers

↓

engineers
```

Verify:

```bash
getent group engineers
```

---

# 🔢 Change Group ID (GID)

Syntax:

```bash
sudo groupmod -g NEW_GID GROUP
```

Example:

```bash
sudo groupmod -g 2000 engineers
```

Verify:

```bash
getent group engineers
```

---

# ❌ Delete a Group

Command:

```bash
sudo groupdel engineers
```

Verify:

```bash
getent group engineers
```

If nothing is returned, the group has been removed.

---

# ⚠️ Can You Delete a Primary Group?

Usually **No**.

If the group is the **primary group** of an existing user:

```
groupdel

↓

Fails
```

Change the user's primary group first.

---

# 🔄 Change a User's Primary Group

Command:

```bash
sudo usermod -g developers alice
```

Verify:

```bash
id alice
```

---

# 📂 The `/etc/group` File

Linux stores group information in:

```text
/etc/group
```

View:

```bash
cat /etc/group
```

Example:

```text
developers:x:1001:alice,bob
```

---

# 📖 `/etc/group` Structure

```text
developers:x:1001:alice,bob
```

| Field | Meaning |
|--------|---------|
| developers | Group Name |
| x | Password Placeholder |
| 1001 | GID |
| alice,bob | Members |

---

# 🌍 Real-World Example

A company has:

```
Developers

HR

Finance

Managers
```

Permissions:

```
Website

↓

developers

Payroll

↓

HR

Reports

↓

Managers
```

Each department accesses only what it needs.

---

# 🧠 Group Permission Flow

```text
              User Requests Access

                       │

               Is User Owner?

                 Yes │ No

                     ▼

          Is User in File's Group?

                 Yes │ No

                     ▼

             Apply Group Permissions

                     │

                 Otherwise

                     ▼

             Apply Others Permissions
```

---

# 📊 Common Group Commands

| Command | Description |
|----------|-------------|
| `groupadd` | Create group |
| `groupdel` | Delete group |
| `groupmod` | Modify group |
| `groups` | Display user's groups |
| `id` | Display UID/GID |
| `getent group` | View group entry |
| `gpasswd -d` | Remove user from group |

---

# 💡 Best Practices

✅ Use groups instead of assigning permissions to individual users.

✅ Create separate groups for departments.

✅ Use meaningful group names.

Examples:

```
developers

hr

finance

marketing

admins
```

---

✅ Remove unused groups.

---

✅ Review memberships regularly.

```bash
groups username
```

---

# ❌ Common Mistakes

### Mistake 1

Using:

```bash
usermod -G
```

instead of:

```bash
usermod -aG
```

This removes existing secondary groups.

---

### Mistake 2

Deleting a group that is still used as a primary group.

---

### Mistake 3

Giving every user access to the `sudo` group.

Only trusted administrators should belong to `sudo`.

---

# 🧪 Practice Lab

## Exercise 1

Create a group.

```bash
sudo groupadd developers
```

---

## Exercise 2

View the group.

```bash
getent group developers
```

---

## Exercise 3

Create a new user.

```bash
sudo adduser alice
```

---

## Exercise 4

Add the user to the group.

```bash
sudo usermod -aG developers alice
```

Verify:

```bash
groups alice
```

---

## Exercise 5

Rename the group.

```bash
sudo groupmod -n engineers developers
```

---

## Exercise 6

Change the GID.

```bash
sudo groupmod -g 2000 engineers
```

---

## Exercise 7

Remove the user from the group.

```bash
sudo gpasswd -d alice engineers
```

---

## Exercise 8

Delete the group.

```bash
sudo groupdel engineers
```

---

# 🎯 Mini Challenge

Create the following structure:

```text
Groups

├── developers

├── testers

├── devops

└── hr
```

Create users:

```
alice

bob

charlie

david
```

Assign:

| User | Primary Group | Secondary Groups |
|------|---------------|------------------|
| alice | developers | docker |
| bob | testers | developers |
| charlie | devops | docker, sudo |
| david | hr | - |

Verify each assignment using:

```bash
id username
```

---

# 📝 Interview Questions

1. What is a Linux group?
2. Why are groups used?
3. What is the difference between a primary and a secondary group?
4. Which command creates a group?
5. Which command deletes a group?
6. How do you rename a group?
7. How do you change a group's GID?
8. What does `usermod -aG` do?
9. What file stores group information?
10. Why is `/etc/group` important?
11. Can a user belong to multiple groups?
12. How do you view the groups a user belongs to?

---

# 📚 Summary

In this part, you learned:

- Linux groups
- Primary vs Secondary Groups
- `groupadd`
- `groupmod`
- `groupdel`
- `gpasswd`
- `groups`
- `id`
- `/etc/group`
- Group administration best practices

---

# 🚀 What's Next?

## Part 4 – Password Management & Account Security

You'll learn:

- The `passwd` command
- Password aging
- Password expiration
- Locking passwords
- Unlocking passwords
- Force password changes
- `/etc/shadow`
- Secure password policies
- Real-world account security

---
title: Chapter 07 - Users and Groups
chapter: 07
part: 4
difficulty: Beginner → Intermediate
estimated_time: 3 Hours
---

# 🔐 Chapter 07 - Users and Groups

# Part 4 - Password Management & Account Security

> **"A user account is only as secure as its password."**

Linux provides powerful tools for password management, account expiration, password aging, and account locking. These features are essential for system administrators responsible for securing Linux servers.

---

# 🎯 Learning Objectives

After completing this part, you will be able to:

- ✅ Change user passwords
- ✅ Force password changes
- ✅ Lock and unlock user accounts
- ✅ Configure password aging
- ✅ Configure account expiration
- ✅ Understand `/etc/shadow`
- ✅ View password status
- ✅ Apply security best practices

---

# 🗺️ Password Management Overview

```text
                    User Account
                         │
        ┌────────────────┼────────────────┐
        │                │                │
    Password        Expiration       Account Lock
        │                │                │
     passwd          chage           passwd/usermod
```

---

# 🔑 Why Password Management Matters

Imagine a company server with hundreds of employees.

```
                    Company Server
                           │
        ┌──────────────────┴──────────────────┐
        │                                     │
   Strong Passwords                   Weak Passwords
        │                                     │
   Secure Accounts                  Easy to Hack
```

Weak passwords are one of the most common causes of security breaches.

---

# 🔐 The `passwd` Command

The primary command for managing passwords is:

```bash
passwd
```

---

## Change Your Own Password

```bash
passwd
```

Example:

```text
Changing password for student.
Current password:
New password:
Retype new password:
passwd: password updated successfully
```

---

## Change Another User's Password

Requires **root** or **sudo** privileges.

```bash
sudo passwd alice
```

Example:

```text
New password:
Retype new password:
passwd: password updated successfully
```

---

# 🎨 Password Change Flow

```text
User

 │

 ▼

passwd

 │

 ▼

Enter Current Password

 │

 ▼

Enter New Password

 │

 ▼

Confirm Password

 │

 ▼

Password Updated
```

---

# 👀 View Password Status

```bash
sudo passwd -S alice
```

Example:

```text
alice P 07/03/2026 0 99999 7 -1
```

---

## Understanding the Output

```text
alice

↓

Username

↓

P

↓

Password Status

↓

07/03/2026

↓

Last Password Change

↓

0

↓

Minimum Days

↓

99999

↓

Maximum Days

↓

7

↓

Warning Days
```

---

# Password Status Codes

| Code | Meaning |
|------|---------|
| P | Password is set |
| L | Account is locked |
| NP | No password set |

---

# 🔒 Lock a Password

Disable password login without deleting the account.

```bash
sudo passwd -l alice
```

Output:

```text
Locking password for user alice.
```

Verify:

```bash
sudo passwd -S alice
```

Output:

```text
alice L
```

---

# 🔓 Unlock a Password

```bash
sudo passwd -u alice
```

Output:

```text
Unlocking password for user alice.
```

---

# Difference Between Locking Password and Locking Account

| Action | Effect |
|---------|---------|
| `passwd -l` | Password authentication disabled |
| `usermod -L` | Locks user account |
| `passwd -u` | Unlocks password |
| `usermod -U` | Unlocks account |

---

# 📅 Password Aging

Linux can force users to change passwords after a certain number of days.

Command:

```bash
chage
```

---

# View Password Aging Information

```bash
sudo chage -l alice
```

Example:

```text
Last password change                                    : Jul 03, 2026
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 90
Number of days of warning before password expires       : 7
```

---

# 🎨 Password Aging Timeline

```text
Password Created

       │

       ▼

Valid

       │

       ▼

Warning Period

       │

       ▼

Expired

       │

       ▼

Password Must Be Changed
```

---

# Set Maximum Password Age

Example:

```bash
sudo chage -M 90 alice
```

Meaning:

```
Password expires after

90 days
```

---

# Set Minimum Password Age

```bash
sudo chage -m 7 alice
```

Meaning:

```
User must wait

7 days

before changing password again.
```

---

# Set Warning Days

```bash
sudo chage -W 10 alice
```

Meaning:

```
Warn user

10 days

before expiration.
```

---

# Force Password Change at Next Login

```bash
sudo chage -d 0 alice
```

Next login:

```text
You are required to change your password immediately.
```

---

# 📅 Account Expiration

Sometimes accounts should expire automatically.

Example:

Interns

Contract Employees

Temporary Staff

---

# Set Expiration Date

```bash
sudo chage -E 2026-12-31 alice
```

After this date:

```
Login Denied
```

---

# Remove Expiration

```bash
sudo chage -E -1 alice
```

Meaning:

```
Never expire
```

---

# 📖 The `/etc/shadow` File

Linux stores encrypted password information in:

```text
/etc/shadow
```

View (root only):

```bash
sudo cat /etc/shadow
```

Example:

```text
alice:$y$j9T$QbLr....:20272:0:90:7:::
```

---

# `/etc/shadow` Structure

```text
alice:$y$j9T$QbLr....:20272:0:90:7:::
```

| Field | Description |
|--------|-------------|
| Username | alice |
| Password Hash | Encrypted password |
| Last Password Change | Days since Jan 1, 1970 |
| Minimum Days | Before password can change |
| Maximum Days | Password lifetime |
| Warning Days | Days before expiration |
| Inactive Days | Disable after expiration |
| Expiration Date | Account expiration |

---

# 🔐 Why Password Hashes?

Linux **never stores plain-text passwords**.

Instead:

```text
Password

↓

Hash Function

↓

Encrypted Hash

↓

Stored in /etc/shadow
```

Example:

```
MyPassword123

↓

$y$j9T$UuF7...
```

Even administrators cannot retrieve the original password from the hash.

---

# 🔍 View Login Information

```bash
lastlog
```

Example:

```text
Username         Port     From             Latest
alice            pts/0    192.168.1.10     Fri Jul 03 10:30
```

---

# 🔍 View Currently Logged-in Users

```bash
who
```

Example:

```text
student  pts/0  Jul 03 09:10
```

---

Or:

```bash
w
```

Displays:

- Logged-in users
- Login time
- Idle time
- Running commands

---

# 🌍 Real-World Example

A company policy requires:

- Password expires every **90 days**
- Minimum age **7 days**
- Warning **10 days**
- Contractors expire after **6 months**

Commands:

```bash
sudo chage -M 90 alice
sudo chage -m 7 alice
sudo chage -W 10 alice
sudo chage -E 2026-12-31 alice
```

---

# 🛡️ Security Best Practices

✅ Use strong passwords.

Example:

```
P@ssw0rd!2026
```

---

✅ Enable password expiration.

---

✅ Lock unused accounts.

---

✅ Remove inactive users.

---

✅ Use SSH keys instead of passwords when possible.

---

✅ Never share passwords.

---

# ❌ Common Mistakes

### Mistake 1

Using weak passwords.

```
123456

password

admin

qwerty
```

Never use these.

---

### Mistake 2

Never changing passwords.

---

### Mistake 3

Leaving old employee accounts active.

---

### Mistake 4

Giving every user the same password.

---

# 🧪 Practice Lab

## Exercise 1

Change your password.

```bash
passwd
```

---

## Exercise 2

Create a test user.

```bash
sudo adduser trainee
```

---

## Exercise 3

Set a password.

```bash
sudo passwd trainee
```

---

## Exercise 4

View password status.

```bash
sudo passwd -S trainee
```

---

## Exercise 5

Lock the account.

```bash
sudo passwd -l trainee
```

Verify:

```bash
sudo passwd -S trainee
```

---

## Exercise 6

Unlock the account.

```bash
sudo passwd -u trainee
```

---

## Exercise 7

View password aging.

```bash
sudo chage -l trainee
```

---

## Exercise 8

Force a password change.

```bash
sudo chage -d 0 trainee
```

---

## Exercise 9

Set password expiration.

```bash
sudo chage -M 60 trainee
```

---

## Exercise 10

Expire the account.

```bash
sudo chage -E 2026-12-31 trainee
```

---

# 🎯 Mini Challenge

Configure a user named **developer** with the following security policy:

| Setting | Value |
|----------|-------|
| Password expires | 90 days |
| Minimum age | 7 days |
| Warning period | 10 days |
| Force password change | Next login |
| Account expiration | 2027-01-31 |

Verify all settings using:

```bash
sudo chage -l developer
```

---

# 📝 Interview Questions

1. What is the purpose of the `passwd` command?
2. What is the difference between `passwd -l` and `usermod -L`?
3. Which command displays password aging information?
4. How do you force a password change at the next login?
5. What file stores password hashes?
6. Why are passwords stored as hashes instead of plain text?
7. How do you set a password expiration period?
8. Which command displays the last login information?
9. What is the purpose of warning days?
10. How do you remove account expiration?

---

# 📚 Summary

In this part, you learned:

- Password management with `passwd`
- Locking and unlocking accounts
- Password aging using `chage`
- Account expiration
- `/etc/shadow`
- Password hashes
- Login monitoring
- Security best practices

---

# 🚀 What's Next?

## Part 5 – Important User & Group Configuration Files

You'll learn about the most important Linux account-related files:

- `/etc/passwd`
- `/etc/shadow`
- `/etc/group`
- `/etc/gshadow`
- `/etc/login.defs`
- `/etc/skel`
- `/etc/default/useradd`

You'll understand how Linux stores user and group information internally and how these files work together.


---
title: Chapter 07 - Users and Groups
chapter: 07
part: 5
difficulty: Intermediate
estimated_time: 3 Hours
---

# 📂 Chapter 07 - Users and Groups

# Part 5 - Important Configuration Files

> **"In Linux, everything is a file — including users, groups, and passwords."**

In this section, we go behind the commands and understand where Linux actually stores user and group information.

---

# 🎯 Learning Objectives

After completing this part, you will be able to:

- ✅ Understand `/etc/passwd`
- ✅ Understand `/etc/shadow`
- ✅ Understand `/etc/group`
- ✅ Understand `/etc/gshadow`
- ✅ Understand `/etc/login.defs`
- ✅ Understand `/etc/skel`
- ✅ Understand `/etc/default/useradd`
- ✅ Learn how Linux internally manages users & groups
- ✅ Safely inspect system authentication files

---

# 🧠 Why These Files Matter

When you run:

```bash
useradd alice
```

Linux does NOT just “create a user”.

It actually updates multiple files:

```
/etc/passwd
/etc/shadow
/etc/group
/etc/gshadow
/home/alice
```

---

# 🗺️ Internal Flow

```text
useradd alice
      │
      ▼
┌───────────────────────┐
│ /etc/passwd           │
│ /etc/shadow           │
│ /etc/group            │
│ /etc/gshadow          │
│ /home/alice           │
└───────────────────────┘
```

---

# 📘 1. /etc/passwd (User Database)

This file stores **basic user information**.

## View File

```bash
cat /etc/passwd
```

---

## Example Entry

```text
alice:x:1001:1001:Alice:/home/alice:/bin/bash
```

---

## 🔍 Breakdown

```
alice:x:1001:1001:Alice:/home/alice:/bin/bash
```

| Field | Meaning |
|------|--------|
| alice | Username |
| x | Password placeholder |
| 1001 | UID |
| 1001 | GID |
| Alice | Comment / Full name |
| /home/alice | Home directory |
| /bin/bash | Login shell |

---

## 🧠 Key Insight

> Password is NOT stored here anymore.

It is stored in `/etc/shadow`.

---

# 🔐 2. /etc/shadow (Secure Password Storage)

This is the MOST IMPORTANT security file.

## View File (root only)

```bash
sudo cat /etc/shadow
```

---

## Example Entry

```text
alice:$y$j9T$abc123...:20272:0:90:7:::
```

---

## 🔍 Breakdown

| Field | Meaning |
|------|--------|
| alice | Username |
| $y$j9T$... | Encrypted password hash |
| 20272 | Last password change |
| 0 | Minimum days |
| 90 | Maximum days |
| 7 | Warning days |
| (blank) | Inactive |
| (blank) | Expiry date |

---

## 🔐 Why It Exists

```
/etc/passwd → readable by everyone

/etc/shadow → readable only by root
```

Security separation.

---

# 👥 3. /etc/group (Group Database)

Stores group information.

## View File

```bash
cat /etc/group
```

---

## Example

```text
developers:x:1001:alice,bob
```

---

## Breakdown

| Field | Meaning |
|------|--------|
| developers | Group name |
| x | Password placeholder |
| 1001 | GID |
| alice,bob | Group members |

---

# 🔐 4. /etc/gshadow (Group Security File)

More secure version of `/etc/group`.

## View File

```bash
sudo cat /etc/gshadow
```

---

## Example

```text
developers:!::alice,bob
```

---

## Meaning

| Field | Meaning |
|------|--------|
| developers | Group name |
| ! | No group password |
| (admin list) | Group admins |
| alice,bob | Members |

---

# ⚙️ 5. /etc/login.defs (Login Policies)

Defines **default user policies**.

## View File

```bash
cat /etc/login.defs
```

---

## Important Settings

```text
PASS_MAX_DAYS   99999
PASS_MIN_DAYS   0
PASS_WARN_AGE   7
UID_MIN         1000
UID_MAX         60000
GID_MIN         1000
GID_MAX         60000
CREATE_HOME     yes
```

---

## 🧠 Meaning

| Setting | Purpose |
|--------|--------|
| PASS_MAX_DAYS | Password expiry |
| UID_MIN | Minimum UID for normal users |
| CREATE_HOME | Auto create home directory |

---

# 🏠 6. /etc/skel (Default Home Template)

When a new user is created, Linux copies files from here.

## View Files

```bash
ls -la /etc/skel
```

---

## Example

```text
.bashrc
.profile
.bash_logout
```

---

## Flow

```text
/etc/skel
     │
     ▼
useradd alice
     │
     ▼
/home/alice gets default files
```

---

# 🧑‍💻 7. /etc/default/useradd (Default User Settings)

Controls default behavior of `useradd`.

## View File

```bash
cat /etc/default/useradd
```

---

## Example

```text
GROUP=100
HOME=/home
INACTIVE=-1
SHELL=/bin/bash
SKEL=/etc/skel
```

---

## Meaning

| Setting | Description |
|--------|-------------|
| GROUP | Default group |
| HOME | Home directory base path |
| SHELL | Default shell |
| SKEL | Skeleton directory |

---

# 🔄 Full User Creation Flow

```text
useradd alice
      │
      ▼
1. /etc/passwd updated
2. /etc/shadow updated
3. /etc/group updated
4. /etc/gshadow updated
5. /etc/login.defs used
6. /etc/default/useradd used
7. /etc/skel copied
8. /home/alice created
```

---

# 🔍 Viewing User System Data

## Check user entry

```bash
getent passwd alice
```

---

## Check group entry

```bash
getent group developers
```

---

## Check password policy

```bash
sudo chage -l alice
```

---

# ⚠️ Important Warning

❌ NEVER edit these files manually:

- `/etc/passwd`
- `/etc/shadow`
- `/etc/group`
- `/etc/gshadow`

Use commands instead:

```bash
useradd
usermod
userdel
groupadd
passwd
chage
```

---

# 🧪 Practice Lab

## Exercise 1

View all users:

```bash
cat /etc/passwd
```

---

## Exercise 2

View all groups:

```bash
cat /etc/group
```

---

## Exercise 3

Find your user entry:

```bash
getent passwd $USER
```

---

## Exercise 4

View login policies:

```bash
cat /etc/login.defs
```

---

## Exercise 5

Inspect skeleton directory:

```bash
ls -la /etc/skel
```

---

## Exercise 6

Create a user and verify files created:

```bash
sudo adduser testuser
```

Then check:

```bash
ls /home/testuser
```

---

# 🎯 Mini Challenge

Create a user and trace everything:

```bash
sudo adduser devops
```

Now verify:

- `/etc/passwd` entry
- `/etc/shadow` entry
- `/etc/group` entry
- Home directory
- Default shell
- Password policy using `chage`

---

# 🧠 Interview Questions

1. What is stored in `/etc/passwd`?
2. Why is `/etc/shadow needed`?
3. What is `/etc/group` used for?
4. What is `/etc/gshadow`?
5. What is `/etc/skel`?
6. What is `/etc/login.defs`?
7. What happens when a user is created?
8. Why should you not edit system files manually?
9. What is stored in `/etc/default/useradd`?
10. Which file stores password hashes?

---

# 📌 Summary

In this part, you learned:

- Internal Linux user system design
- `/etc/passwd`
- `/etc/shadow`
- `/etc/group`
- `/etc/gshadow`
- `/etc/login.defs`
- `/etc/skel`
- `/etc/default/useradd`
- User creation lifecycle
- Security separation model

---

# 🚀 What's Next?

## Part 6 – sudo & Administrative Access

You will learn:

- What is `sudo`
- How privilege escalation works
- `/etc/sudoers` file
- `visudo`
- Granting admin access
- Best security practices
- Limiting root access safely

---
title: Chapter 07 - Users and Groups
chapter: 07
part: 6
difficulty: Intermediate
estimated_time: 3 Hours
---

# 🔑 Chapter 07 - Users and Groups

# Part 6 - sudo & Administrative Access

> **"In Linux, root is powerful — but sudo is safer."**

Instead of logging in as root, Linux uses `sudo` to temporarily grant administrative privileges to trusted users.

---

# 🎯 Learning Objectives

After completing this part, you will be able to:

- ✅ Understand the root user vs sudo
- ✅ Use `sudo` safely
- ✅ Configure sudo access
- ✅ Understand `/etc/sudoers`
- ✅ Use `visudo` properly
- ✅ Add users to sudo privileges
- ✅ Limit administrative access
- ✅ Follow best security practices

---

# 🧠 Why sudo Exists

Direct root login is dangerous.

```
Root User
   │
   ▼
Unlimited Power ⚠️
   │
   ▼
System Risk
```

A small mistake can break the entire system:

```bash
rm -rf /
```

---

# 🛡️ sudo Concept

Instead of logging in as root:

```
Normal User
      │
      ▼
sudo command
      │
      ▼
Temporary Root Access
```

---

# 👤 Root vs sudo User

| Feature | root | sudo user |
|--------|------|-----------|
| Full system access | ✅ | ⚠️ (temporary) |
| Login required | yes | no (uses sudo) |
| Risk level | very high | controlled |
| Audit logging | limited | yes |

---

# ⚡ Using sudo

## Basic Syntax

```bash
sudo command
```

---

## Example

```bash
sudo apt update
```

---

## Run as root shell

```bash
sudo -i
```

or

```bash
sudo su -
```

---

# 🔐 How sudo Works

```text
User runs command
       │
       ▼
Check /etc/sudoers
       │
       ▼
Is user allowed?
       │
   ┌───┴────┐
   │        │
  YES      NO
   │        │
   ▼        ▼
Run as root  Denied
```

---

# 📂 /etc/sudoers File

This file controls sudo permissions.

## View (DO NOT edit directly)

```bash
sudo cat /etc/sudoers
```

---

# ⚠️ IMPORTANT RULE

❌ Never edit `/etc/sudoers` directly

✔ Always use:

```bash
visudo
```

---

# 🛠️ visudo Command

```bash
sudo visudo
```

Why?

- Checks syntax errors
- Prevents system lockout
- Safe editing

---

# 👥 Grant sudo Access

## Method 1: Add user to sudo group (Ubuntu/Debian)

```bash
sudo usermod -aG sudo alice
```

---

## Method 2: Add user to wheel group (RHEL/CentOS)

```bash
sudo usermod -aG wheel alice
```

---

# 🔍 Verify sudo Access

```bash
groups alice
```

Example:

```text
alice : alice sudo
```

---

# 🧪 Test sudo Access

Switch user:

```bash
su - alice
```

Run:

```bash
sudo whoami
```

Output:

```text
root
```

---

# 🔑 sudo Authentication Flow

```text
User runs sudo command

         │

     Enter password

         │

 Check permissions

         │

     Allowed?

   ┌─────┴─────┐
   │           │
  YES         NO
   │           │
   ▼           ▼

Run as root   Denied
```

---

# 🧾 Logging sudo Activity

Every sudo command is logged:

```bash
/var/log/auth.log   (Debian/Ubuntu)
/var/log/secure     (RHEL/CentOS)
```

---

# 🔍 Example Log Entry

```text
alice : TTY=pts/0 ; PWD=/home/alice ; USER=root ; COMMAND=/bin/apt update
```

---

# ⚙️ sudoers File Syntax

```text
user host=(run_as) commands
```

---

# 📌 Example Rules

## Full Access

```text
alice ALL=(ALL:ALL) ALL
```

Meaning:

- Any host
- Any user
- Any command

---

## Limited Access

```text
bob ALL=(ALL) /bin/systemctl restart nginx
```

Bob can ONLY restart nginx.

---

## No Password Required

```text
charlie ALL=(ALL) NOPASSWD: ALL
```

⚠️ Use carefully.

---

# 🚫 Common Mistake

Giving full sudo access to everyone:

```text
ALL ALL=(ALL) ALL
```

Dangerous in production.

---

# 🧑‍💻 sudo vs su

| Command | Meaning |
|--------|--------|
| sudo | Run single command as root |
| su | Switch to root user |
| sudo -i | Root shell with login environment |

---

# 🔐 Best Practice: Least Privilege

```
Give only required permissions
```

Example:

```
Developer → restart app only
HR → no sudo access
Admin → full sudo access
```

---

# 🏗️ Real-World Example

Company server:

```
Users:
- alice (developer)
- bob (tester)
- charlie (admin)
```

sudo rules:

```text
alice → restart application only
bob → no sudo access
charlie → full sudo
```

---

# 🧪 Practice Lab

## Exercise 1

Check current user:

```bash
whoami
```

---

## Exercise 2

Check sudo access:

```bash
sudo -l
```

---

## Exercise 3

Add user to sudo group:

```bash
sudo usermod -aG sudo alice
```

---

## Exercise 4

Test sudo:

```bash
sudo whoami
```

---

## Exercise 5

Open sudoers safely:

```bash
sudo visudo
```

---

## Exercise 6

Give limited sudo access:

```text
alice ALL=(ALL) /usr/bin/systemctl restart nginx
```

---

## Exercise 7

Check logs:

```bash
sudo cat /var/log/auth.log
```

---

# 🎯 Mini Challenge

Create a user:

```bash
sudo adduser devops
```

Then configure:

- Full sudo access
- No password sudo (temporary testing only)
- Verify with:

```bash
sudo -l
```

---

# 🧠 Interview Questions

1. What is sudo?
2. Why is sudo safer than root login?
3. What is `/etc/sudoers`?
4. Why do we use `visudo`?
5. How do you give sudo access to a user?
6. What is the difference between sudo and su?
7. What is the sudoers file format?
8. Where are sudo logs stored?
9. What is NOPASSWD in sudoers?
10. What is the principle of least privilege?

---

# 📌 Summary

In this part, you learned:

- Root vs sudo
- How sudo works internally
- `/etc/sudoers`
- `visudo`
- sudo groups (sudo/wheel)
- Command-level permissions
- sudo logging
- Security best practices

---

# 🚀 What's Next?

## Part 7 – User Management Mini Project

You will build a real-world system:

- Create departments
- Add users
- Assign groups
- Configure sudo rules
- Apply security policies
- Simulate enterprise Linux environment

---
title: Chapter 07 - Users and Groups
chapter: 07
part: 7
difficulty: Intermediate → Practical
estimated_time: 4 Hours
---

# 🏢 Chapter 07 - Users and Groups

# Part 7 - User Management Mini Project (Real-World Simulation)

> **"Theory becomes powerful only when you apply it in real systems."**

In this section, you will simulate a **real company Linux server environment** where users, groups, and permissions are properly structured.

---

# 🎯 Learning Objectives

After completing this project, you will be able to:

- ✅ Design user/group structure for an organization
- ✅ Create multiple users efficiently
- ✅ Assign primary and secondary groups
- ✅ Configure sudo access safely
- ✅ Apply permission strategy in real systems
- ✅ Troubleshoot user/group issues
- ✅ Think like a Linux System Administrator

---

# 🏢 Project Scenario: TechCorp Linux Server

You are the Linux administrator of **TechCorp**.

The company has 4 departments:

```
TechCorp

├── Developers
├── Testers
├── DevOps
└── HR
```

Each department has different access levels.

---

# 👥 Users to Create

| User | Department |
|------|------------|
| alice | Developers |
| bob | Testers |
| charlie | DevOps |
| david | HR |
| emma | Developers |
| frank | DevOps |

---

# 🔐 Access Rules

## Developers

- Full access to development tools
- Can restart application services

## Testers

- Can access test environments
- No sudo access

## DevOps

- Full sudo access
- Can manage servers

## HR

- No sudo access
- Restricted system access

---

# 🗺️ System Design Diagram

```text
                 TechCorp Linux Server

                          │
        ┌─────────────────┼─────────────────┐
        │                 │                 │
   Developers         Testers           DevOps
        │                 │                 │
   alice, emma        bob              charlie, frank

                          │
                         HR
                          │
                        david
```

---

# 🏗️ Step 1 - Create Groups

```bash
sudo groupadd developers
sudo groupadd testers
sudo groupadd devops
sudo groupadd hr
```

---

# 👤 Step 2 - Create Users

```bash
sudo adduser alice
sudo adduser bob
sudo adduser charlie
sudo adduser david
sudo adduser emma
sudo adduser frank
```

---

# 🔗 Step 3 - Assign Primary Groups

```bash
sudo usermod -g developers alice
sudo usermod -g testers bob
sudo usermod -g devops charlie
sudo usermod -g hr david
sudo usermod -g developers emma
sudo usermod -g devops frank
```

---

# ➕ Step 4 - Add Secondary Groups

## Developers need extra tools access

```bash
sudo usermod -aG sudo alice
sudo usermod -aG sudo emma
```

---

## DevOps full admin access

```bash
sudo usermod -aG sudo charlie
sudo usermod -aG sudo frank
```

---

# 🔍 Step 5 - Verify Setup

## Check users

```bash
id alice
id bob
id charlie
id david
```

## Check groups

```bash
groups alice
```

---

# 🧾 Expected Output Example

```text
alice : alice developers sudo
bob : bob testers
charlie : charlie devops sudo
david : david hr
```

---

# 🔐 Step 6 - Configure sudo Rules (Advanced)

Open sudo configuration:

```bash
sudo visudo
```

Add custom rule:

```text
# Developers can restart services
%developers ALL=(ALL) /bin/systemctl restart *
```

---

# ⚠️ Important Note

```
%developers = group rule
alice = user rule
```

---

# 🧪 Step 7 - Test Access

Switch user:

```bash
su - alice
```

Try:

```bash
sudo systemctl restart nginx
```

---

# 🚫 HR Restrictions

HR should NOT have sudo access.

Verify:

```bash
sudo -l
```

Expected:

```text
User david is not allowed to run sudo commands
```

---

# 📂 Step 8 - Create Department Folders

```bash
sudo mkdir -p /techcorp/{developers,testers,devops,hr}
```

---

# 🔐 Step 9 - Set Permissions

## Developers

```bash
sudo chown :developers /techcorp/developers
sudo chmod 770 /techcorp/developers
```

---

## Testers

```bash
sudo chown :testers /techcorp/testers
sudo chmod 750 /techcorp/testers
```

---

## DevOps

```bash
sudo chown :devops /techcorp/devops
sudo chmod 770 /techcorp/devops
```

---

## HR

```bash
sudo chown :hr /techcorp/hr
sudo chmod 700 /techcorp/hr
```

---

# 🧠 Permission Strategy Visualization

```text
770 → Full access (owner + group)
750 → Limited access
700 → Private access
```

---

# 🔍 Step 10 - Validate Permissions

```bash
ls -ld /techcorp/*
```

Expected:

```text
drwxrwx--- developers
drwxr-x--- testers
drwxrwx--- devops
drwx------ hr
```

---

# 🧪 Step 11 - Real Testing Scenarios

## Test 1 - Developer Access

```bash
su - alice
cd /techcorp/developers
```

✔ Should work

---

## Test 2 - HR Access Restriction

```bash
su - david
cd /techcorp/developers
```

❌ Permission denied

---

# 🧠 Troubleshooting Checklist

If something fails:

```
✔ Check group membership → id username
✔ Check folder permissions → ls -ld
✔ Check sudo access → sudo -l
✔ Check ownership → ls -l
```

---

# 🏆 Final Project Summary

You have successfully built:

```
✔ Users
✔ Groups
✔ Sudo access
✔ Directory permissions
✔ Security policies
✔ Real-world Linux structure
```

---

# 💡 Real-World Skills Learned

- Enterprise user management
- Department-based access control
- Linux security design
- Permission architecture
- Administrative control system

---

# 🧠 Interview Questions

1. How do you design user management in a company?
2. What is the difference between primary and secondary groups in real systems?
3. Why is sudo required for DevOps users?
4. How do you restrict HR department access?
5. What permission model is used for shared folders?
6. Why is 770 used for departments?
7. How do you troubleshoot permission issues?
8. How do you ensure least privilege principle?

---

# 📚 What’s Next?

## Part 8 - Chapter Summary & Interview Revision

You will learn:

- Full chapter revision
- Cheat sheets
- 50+ interview questions
- Real-world scenarios
- RHCSA / Linux+ preparation guide
- Quick command reference

---
title: Chapter 07 - Users and Groups
chapter: 07
part: 8
difficulty: Revision
estimated_time: 3 Hours
---

# 📘 Chapter 07 - Users and Groups

# Part 8 - Chapter Summary, Cheat Sheet & Interview Revision

> **"If you can explain it simply, you truly understand it."**

This final part consolidates everything you learned in this chapter into a structured revision guide for interviews and real-world administration.

---

# 🧠 Full Chapter Map

```text
Chapter 07 - Users and Groups

├── Part 1  → Introduction to Users & Groups
├── Part 2  → User Management Commands
├── Part 3  → Group Management
├── Part 4  → Password Management & Security
├── Part 5  → Configuration Files (/etc/*)
├── Part 6  → sudo & Administrative Access
├── Part 7  → Mini Project (Real System Design)
└── Part 8  → Revision & Interview Prep
```

---

# 👤 USERS - QUICK REVISION

## What is a User?

A Linux user is an identity used to:

- Login to system
- Own files
- Run processes
- Enforce security rules

---

## Types of Users

```
1. Root User      → Full control
2. Regular User   → Human users
3. System User    → OS services
4. Service User   → Applications (nginx, mysql)
```

---

## Important Files

```text
/etc/passwd   → User info
/etc/shadow   → Passwords (encrypted)
```

---

## User Commands

| Command | Purpose |
|--------|--------|
| useradd | Create user |
| adduser | Interactive creation |
| usermod | Modify user |
| userdel | Delete user |
| passwd | Set password |
| id | Show UID/GID |
| whoami | Current user |

---

## Example Flow

```bash
sudo adduser alice
sudo passwd alice
id alice
```

---

# 👥 GROUPS - QUICK REVISION

## What is a Group?

A group is a collection of users sharing permissions.

---

## Types

```
Primary Group   → Default group of user
Secondary Group → Extra access groups
```

---

## Important File

```text
/etc/group
```

---

## Group Commands

| Command | Purpose |
|--------|--------|
| groupadd | Create group |
| groupdel | Delete group |
| groupmod | Modify group |
| usermod -aG | Add user to group |
| groups | Show user groups |

---

## Example

```bash
sudo groupadd developers
sudo usermod -aG developers alice
groups alice
```

---

# 🔐 PASSWORD & SECURITY REVISION

## Commands

| Command | Purpose |
|--------|--------|
| passwd | Change password |
| chage | Password aging |
| lastlog | Last login |
| who | Logged users |

---

## Password States

| State | Meaning |
|------|--------|
| P | Active |
| L | Locked |
| NP | No password |

---

## Key File

```text
/etc/shadow
```

---

## Security Rules

```
✔ Strong passwords
✔ Password expiration
✔ Account locking
✔ Least privilege
```

---

# ⚙️ CONFIG FILES SUMMARY

## Critical Files

| File | Purpose |
|------|--------|
| /etc/passwd | User database |
| /etc/shadow | Password hashes |
| /etc/group | Group database |
| /etc/gshadow | Group security |
| /etc/skel | Default home files |
| /etc/login.defs | User policies |
| /etc/default/useradd | Defaults |

---

## User Creation Flow

```text
useradd
  ↓
/etc/passwd updated
  ↓
/etc/shadow updated
  ↓
/etc/group updated
  ↓
/home/user created
  ↓
/etc/skel copied
```

---

# 🔑 sudo REVISION

## What is sudo?

Temporary root access.

---

## Commands

| Command | Purpose |
|--------|--------|
| sudo | Run as root |
| sudo -i | Root shell |
| visudo | Edit sudoers safely |

---

## sudo Flow

```text
User → sudo → Check rules → Execute as root
```

---

## sudoers Format

```text
user ALL=(ALL) ALL
%group ALL=(ALL) ALL
```

---

# 🏢 REAL-WORLD MODEL

```
Company Server

├── Developers → sudo access limited
├── Testers    → no sudo
├── DevOps     → full sudo
└── HR         → restricted access
```

---

# 📊 PERMISSION CHEAT SHEET

| Value | Meaning |
|------|--------|
| 777 | Full access (dangerous) |
| 755 | Executable files |
| 644 | Normal files |
| 600 | Private files |
| 700 | Private directories |

---

## Permission Breakdown

```text
r = 4
w = 2
x = 1
```

Example:

```text
rwx = 7
r-x = 5
r-- = 4
```

---

# 🧪 COMMON TROUBLESHOOTING

## Problem: Permission denied

Check:

```bash
ls -l
id
```

---

## Problem: Cannot run script

Fix:

```bash
chmod +x file.sh
```

---

## Problem: sudo not working

Check:

```bash
groups username
```

---

# 📌 IMPORTANT COMMANDS (MASTER LIST)

```bash
whoami
id
groups
useradd
usermod
userdel
groupadd
groupdel
passwd
chage
sudo
visudo
```

---

# 🧠 INTERVIEW QUESTIONS (TOP 25)

## Basic

1. What is a user in Linux?
2. What is a group?
3. Difference between root and normal user?
4. What is UID and GID?
5. What is `/etc/passwd`?

---

## Intermediate

6. What is `/etc/shadow`?
7. Why use groups?
8. Difference between primary and secondary group?
9. What is `useradd` vs `adduser`?
10. What does `usermod -aG` do?

---

## Advanced

11. What is sudo?
12. Why use visudo?
13. What is least privilege?
14. What is `/etc/skel`?
15. What is `/etc/login.defs`?

---

## Scenario-Based

16. How do you secure a Linux server?
17. How do you restrict HR access?
18. How do you troubleshoot permissions?
19. How do you manage 100+ users?
20. Why avoid 777 permissions?

---

# 🧩 REAL-WORLD SCENARIOS

## Scenario 1

Developer needs restart access only:

```text
sudoers → limited command access
```

---

## Scenario 2

HR must NOT access server tools:

```text
no sudo group
restricted directory permissions
```

---

## Scenario 3

DevOps full access:

```text
added to sudo group
```

---

# 🏁 FINAL MIND MAP

```text
Linux Users & Groups

        │
        ├── Users
        │     ├── root
        │     ├── regular
        │     └── system
        │
        ├── Groups
        │     ├── primary
        │     └── secondary
        │
        ├── Permissions
        │     ├── r w x
        │     └── chmod
        │
        ├── Security
        │     ├── passwd
        │     ├── chage
        │     └── shadow
        │
        └── Admin
              ├── sudo
              └── visudo
```

---

# 🎉 CONGRATULATIONS

You have completed:

```
✔ Linux Users
✔ Groups
✔ Permissions
✔ Security
✔ sudo Administration
✔ Real-world Project
✔ System Files
✔ Interview Preparation
```

---

# 🚀 NEXT STEP

## Chapter 08 - Linux Processes & System Monitoring

You will learn:

- Processes in Linux
- ps, top, htop
- kill commands
- background & foreground jobs
- system monitoring tools
- CPU & memory usage
- service management (systemctl)
