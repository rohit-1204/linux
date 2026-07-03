# Linux Notes
# Chapter 00 - Introduction to Linux

> **Level:** Beginner
> **Estimated Reading Time:** 30–45 minutes
> **Practice Time:** 1–2 hours

---

# Table of Contents

1. What is Linux?
2. History of Linux
3. Why Learn Linux?
4. Linux vs Windows vs macOS
5. Linux Architecture
6. Linux Distributions
7. Open Source Software
8. Features of Linux
9. Common Use Cases
10. Linux in the Real World
11. Linux Terminology
12. Linux Directory Structure Preview
13. Installing Linux
14. Ways to Practice Linux
15. Learning Roadmap
16. Summary
17. Practice Questions
18. Hands-on Exercises

---

# Learning Objectives

After completing this chapter, you will be able to:

- Understand what Linux is
- Know how Linux was created
- Explain why Linux is popular
- Identify different Linux distributions
- Understand Linux architecture
- Recognize common Linux terminology
- Prepare your computer for Linux practice

---

# What is Linux?

Linux is an **open-source operating system kernel** created by **Linus Torvalds** in 1991.

An operating system is software that manages:

- CPU
- Memory
- Storage
- Devices
- Applications

Linux acts as the bridge between hardware and software.

Example:

```
Application
     ↓
Operating System
     ↓
Hardware
```

Without an operating system, your computer cannot run applications.

---

# What is a Kernel?

The **kernel** is the core of an operating system.

It is responsible for:

- Memory management
- CPU scheduling
- Device management
- File system management
- Process management
- Security

Think of it as the "brain" of the operating system.

Example:

```
Chrome

VS Code

Python

     ↓

Linux Kernel

     ↓

CPU
RAM
Disk
Keyboard
Mouse
```

---

# History of Linux

### 1969

UNIX was created at Bell Labs.

---

### 1983

Richard Stallman started the GNU Project.

Goal:

Create a free UNIX-like operating system.

---

### 1991

Linus Torvalds created the Linux kernel.

Initially it was a small hobby project.

---

### Today

Linux powers:

- Servers
- Smartphones
- Cloud computing
- Supercomputers
- IoT devices
- Raspberry Pi
- Smart TVs
- Cars

---

# Why Learn Linux?

Linux skills are required in many careers:

- Software Development
- DevOps
- Cloud Engineering
- Cyber Security
- Networking
- System Administration
- Data Engineering
- AI Infrastructure

Almost every cloud server runs Linux.

---

# Fun Facts

- Android is based on the Linux kernel.
- Over 90% of cloud servers run Linux.
- Most supercomputers use Linux.
- Many routers use Linux internally.

---

# Linux vs Windows vs macOS

| Feature | Linux | Windows | macOS |
|----------|---------|-----------|---------|
| Open Source | ✅ | ❌ | Partially |
| Free | ✅ | ❌ | ❌ |
| Secure | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| Customizable | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐ |
| Software Availability | High | Very High | High |
| Gaming | Good | Excellent | Moderate |
| Server Usage | Excellent | Moderate | Low |

---

# Why Companies Love Linux

Reasons include:

- Free
- Secure
- Stable
- Fast
- Lightweight
- Highly customizable
- Excellent networking
- Powerful scripting
- Large community support

---

# Linux Architecture

```
+------------------------+
|      Applications      |
+------------------------+
|      Shell (Bash)      |
+------------------------+
|      Linux Kernel      |
+------------------------+
|       Hardware         |
+------------------------+
```

---

## Hardware

Physical components.

Examples:

- CPU
- RAM
- SSD
- Keyboard
- Mouse

---

## Kernel

Controls communication with hardware.

Responsibilities:

- Process scheduling
- Memory
- Drivers
- Networking
- File systems

---

## Shell

The shell allows users to communicate with Linux.

Popular shells:

- Bash
- Zsh
- Fish
- Ksh

You'll mainly learn **Bash**.

---

## Applications

Programs users interact with.

Examples:

- Firefox
- VS Code
- Python
- Git
- Docker

---

# What is Bash?

Bash stands for:

**Bourne Again SHell**

It is the default shell on many Linux distributions.

Example:

```bash
echo "Hello Linux"
```

Output:

```
Hello Linux
```

---

# Linux Distributions (Distros)

A Linux distribution includes:

- Linux kernel
- Package manager
- Desktop environment
- Utilities
- Applications

Popular distributions:

| Distribution | Best For |
|---------------|------------|
| Ubuntu | Beginners |
| Debian | Stability |
| Fedora | Latest Features |
| Arch Linux | Advanced Users |
| Linux Mint | Windows Users |
| Kali Linux | Security Testing |
| Rocky Linux | Enterprise |
| AlmaLinux | Enterprise |

---

# Which Distribution Should You Learn?

Recommended:

✅ Ubuntu LTS

Why?

- Easy
- Stable
- Huge community
- Lots of tutorials

---

# Open Source

Open source means:

The source code is publicly available.

Anyone can:

- View it
- Modify it
- Improve it
- Share it

Examples:

- Linux
- Git
- Python
- PostgreSQL
- Docker

---

# Proprietary Software

Examples:

- Windows
- Microsoft Office
- Adobe Photoshop

Source code is not publicly available.

---

# Features of Linux

- Multi-user
- Multitasking
- Portable
- Secure
- Stable
- Networking support
- Powerful command line
- Package management
- Virtual memory
- Permissions system

---

# Multi-user

Many users can use the same Linux machine.

Each user has:

- Home directory
- Password
- Permissions

---

# Multitasking

Linux runs multiple programs simultaneously.

Example:

- Browser
- VS Code
- Music
- Terminal

All running together.

---

# Security

Linux security features include:

- User permissions
- Groups
- Firewall
- SELinux/AppArmor
- Encryption

---

# Where is Linux Used?

## Servers

Most web servers use Linux.

---

## Cloud

AWS

Azure

Google Cloud

Mostly Linux.

---

## Embedded Systems

Examples:

- Smart TVs
- Routers
- Drones
- Raspberry Pi

---

## Mobile

Android uses the Linux kernel.

---

## Supercomputers

Almost every fastest supercomputer runs Linux.

---

# Linux Terminology

| Term | Meaning |
|--------|----------|
| Kernel | Core of Linux |
| Shell | Command interpreter |
| Terminal | Window for commands |
| CLI | Command Line Interface |
| GUI | Graphical Interface |
| Distro | Linux distribution |
| Root | Administrator user |
| Package | Installable software |
| Repository | Software storage |
| Process | Running program |

---

# Linux Directory Structure Preview

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
├── tmp
├── usr
└── var
```

We'll learn each directory in detail later.

---

# Installing Linux

Options:

### Option 1

Install directly on your PC.

Pros:

- Best performance

Cons:

- Risk if done incorrectly

---

### Option 2

Dual Boot

Windows + Linux

Most popular choice.

---

### Option 3

Virtual Machine

Recommended for beginners.

Software:

- VirtualBox
- VMware Workstation
- GNOME Boxes

---

### Option 4

Cloud Server

Rent a Linux server online.

Examples:

- AWS EC2
- DigitalOcean
- Linode
- Oracle Cloud Free Tier

---

# Best Way to Practice

Recommended:

```
Windows
    ↓
VirtualBox
    ↓
Ubuntu
```

Safe and easy.

---

# Software to Install

- Ubuntu LTS ISO
- VirtualBox
- VS Code
- Git

---

# Linux Learning Roadmap

```
Linux Basics
      ↓
Terminal Commands
      ↓
Filesystem
      ↓
Permissions
      ↓
Users
      ↓
Processes
      ↓
Networking
      ↓
Shell Scripting
      ↓
System Administration
      ↓
Docker
      ↓
Cloud
      ↓
DevOps
```

---

# Common Myths

### Myth 1

Linux is only for hackers.

❌ False

Linux is used by developers, students, designers, scientists, and businesses.

---

### Myth 2

Linux has no GUI.

❌ False

Ubuntu has a modern desktop.

---

### Myth 3

Linux is difficult.

❌ False

It becomes comfortable with regular practice.

---

# Summary

You learned:

- What Linux is
- History of Linux
- Linux architecture
- Kernel
- Shell
- Distributions
- Open source
- Linux features
- Where Linux is used
- Learning roadmap

---

# Interview Questions

### 1. What is Linux?

---

### 2. Who created Linux?

---

### 3. What is a kernel?

---

### 4. What is Bash?

---

### 5. What is a Linux distribution?

---

### 6. Why is Linux popular?

---

### 7. What is open-source software?

---

### 8. Name five Linux distributions.

---

### 9. Difference between GUI and CLI?

---

### 10. Why do servers prefer Linux?

---

# Practice Exercises

## Exercise 1

Search and write the latest stable version of:

- Ubuntu
- Fedora
- Debian

---

## Exercise 2

Draw Linux architecture.

---

## Exercise 3

List five devices around you that probably use Linux.

---

## Exercise 4

Explain:

- Kernel
- Shell
- Terminal

In your own words.

---

## Exercise 5

Create a Markdown file named:

```
linux-introduction.md
```

Write:

- What Linux is
- Three advantages
- Three disadvantages
- Why you want to learn Linux

---

# Mini Project

Create your own Linux notes repository.

```
linux-notes/

├── README.md
├── 00-Introduction.md
├── 01-History.md
├── 02-Installation.md
└── assets/
```

Initialize it with Git:

```bash
mkdir linux-notes
cd linux-notes
git init
```

Commit your work after each chapter to build a version history.

---

# What's Next?

In the next chapter (`01-Linux-History.md`), you'll dive deeper into the evolution of Linux, UNIX, the GNU Project, licensing, and how the Linux ecosystem became the foundation of modern servers and cloud computing.
