
# Linux Notes
# Chapter 02 - Installing Linux

> **Level:** Beginner
> **Estimated Reading Time:** 60–90 minutes
> **Practice Time:** 2–4 hours

---

# Table of Contents

1. Learning Objectives
2. Why Install Linux?
3. Ways to Install Linux
4. Choosing a Linux Distribution
5. System Requirements
6. Downloading Ubuntu
7. Verifying the ISO
8. Virtual Machine vs Dual Boot vs Bare Metal
9. Installing VirtualBox
10. Creating a Virtual Machine
11. BIOS vs UEFI
12. Understanding Disk Partitions
13. Installing Ubuntu
14. First Boot
15. Essential Updates
16. Installing Common Software
17. Terminal Introduction
18. Snapshot and Backup
19. Common Installation Problems
20. Best Practices
21. Summary
22. Practice Exercises
23. Mini Project

---

# Learning Objectives

After completing this chapter, you will be able to:

- Choose the correct Linux distribution
- Download Ubuntu safely
- Understand ISO images
- Install Linux inside VirtualBox
- Understand partitions
- Complete the Ubuntu installation
- Update your system
- Prepare Linux for learning

---

# Why Install Linux?

Installing Linux allows you to:

- Practice commands safely
- Learn system administration
- Develop software
- Learn networking
- Learn shell scripting
- Prepare for cloud platforms
- Build DevOps skills

---

# Ways to Install Linux

There are four common methods.

## 1. Virtual Machine (Recommended)

```
Windows
    │
VirtualBox
    │
Ubuntu VM
```

### Advantages

- Safe
- Easy to reset
- Doesn't modify Windows
- Ideal for beginners

### Disadvantages

- Slightly slower
- Shares system resources

---

## 2. Dual Boot

```
Computer

├── Windows
└── Ubuntu
```

### Advantages

- Full performance
- Uses real hardware

### Disadvantages

- More complex
- Incorrect partitioning can cause data loss

---

## 3. Replace Windows

Install Linux as the only operating system.

Advantages:

- Best performance

Disadvantages:

- Windows is removed

---

## 4. Cloud Server

Examples:

- AWS EC2
- Oracle Cloud
- DigitalOcean
- Azure Virtual Machine

Useful for learning remote Linux administration.

---

# Which Method Should You Choose?

| Experience | Recommendation |
|------------|---------------|
| Beginner | VirtualBox |
| Intermediate | Dual Boot |
| Advanced | Bare Metal |
| Cloud Learning | VPS / Cloud VM |

For this course, we will use **VirtualBox + Ubuntu LTS**.

---

# Choosing a Linux Distribution

| Distribution | Best For |
|--------------|----------|
| Ubuntu | Beginners |
| Linux Mint | Windows Users |
| Fedora | Developers |
| Debian | Stability |
| Arch Linux | Advanced Users |
| Rocky Linux | Enterprise |
| AlmaLinux | Enterprise |
| Kali Linux | Security |

Recommended:

**Ubuntu LTS**

Reasons:

- Long-term support
- Stable
- Large community
- Excellent documentation

---

# System Requirements

Minimum:

- Dual-core CPU
- 4 GB RAM
- 25 GB Storage

Recommended:

- Quad-core CPU
- 8 GB RAM
- 60 GB SSD
- Hardware virtualization enabled

---

# What is an ISO File?

An ISO is a complete disk image.

Example:

```
ubuntu-24.04.iso
```

It contains everything required to install Ubuntu.

---

# Download Ubuntu

Download the latest **Ubuntu LTS Desktop ISO** from the official Ubuntu website.

Always download from the official source.

---

# Verify the Download

After downloading:

Compare the SHA256 checksum.

Why?

- Detect corrupted downloads
- Verify authenticity

Example:

```bash
sha256sum ubuntu.iso
```

---

# What is VirtualBox?

VirtualBox is virtualization software.

It allows one computer to run multiple operating systems.

Example:

```
Host OS
Windows

↓

VirtualBox

↓

Ubuntu
```

---

# Install VirtualBox

Steps:

1. Download VirtualBox.
2. Run the installer.
3. Accept default settings.
4. Restart if required.

---

# Create a Virtual Machine

Open VirtualBox.

Click:

```
New
```

Name:

```
Ubuntu
```

Type:

```
Linux
```

Version:

```
Ubuntu (64-bit)
```

---

# Allocate Memory

Recommended:

```
4096 MB
```

If you have 16 GB RAM:

```
8192 MB
```

Do not allocate more than half of your physical RAM.

---

# Create Virtual Hard Disk

Choose:

```
VDI
```

Storage:

```
Dynamically Allocated
```

Size:

```
40 GB
```

Recommended:

```
60 GB
```

---

# Attach Ubuntu ISO

Settings

↓

Storage

↓

Select Empty Optical Drive

↓

Choose Ubuntu ISO

---

# Enable Hardware Virtualization

If Ubuntu doesn't start:

Enable virtualization in BIOS.

Names may include:

- Intel VT-x
- Intel Virtualization Technology
- AMD-V

---

# BIOS vs UEFI

## BIOS

Older firmware.

Uses:

```
MBR
```

partition style.

---

## UEFI

Modern firmware.

Uses:

```
GPT
```

Supports:

- Faster boot
- Secure Boot
- Large disks

Most modern computers use UEFI.

---

# Disk Partitions

Think of a disk as a large bookshelf.

Partitions divide it into sections.

Example:

```
Disk

├── Windows
├── Ubuntu
└── Recovery
```

---

# Linux Partitions

Common partitions:

```
/

Root filesystem
```

Contains:

- Programs
- System files

---

```
/home
```

Stores:

- User files
- Documents
- Downloads

---

```
swap
```

Virtual memory.

Used when RAM becomes full.

---

Example Layout

```
50 GB

40 GB  /
8 GB   /home
2 GB   swap
```

---

# Start Ubuntu Installation

Click:

```
Install Ubuntu
```

Choose:

- Language
- Keyboard
- Time zone

---

# Installation Type

Inside VirtualBox:

Choose:

```
Erase Disk and Install Ubuntu
```

Important:

This only erases the **virtual disk**, not your Windows installation.

---

# Create User

Example:

```
Name

John Doe
```

Username:

```
john
```

Computer Name:

```
linux-lab
```

Password:

```
********
```

Use a strong password.

---

# Installation Process

Ubuntu installs:

- Kernel
- Drivers
- Desktop
- Applications
- Bootloader

This usually takes 10–20 minutes.

---

# Reboot

After installation:

Restart.

Remove the ISO if prompted.

Ubuntu should boot from the virtual disk.

---

# Login

Enter:

Username

Password

Desktop appears.

Congratulations!

You have installed Linux.

---

# First Desktop

Ubuntu includes:

- Activities
- Terminal
- Firefox
- Files
- Settings
- Software Center

---

# Open Terminal

Shortcut:

```
Ctrl + Alt + T
```

Terminal opens.

This will become your primary workspace.

---

# Update Ubuntu

Always update first.

```bash
sudo apt update
```

Upgrade packages:

```bash
sudo apt upgrade
```

Clean unused packages:

```bash
sudo apt autoremove
```

---

# Understanding sudo

Example:

```bash
sudo apt update
```

sudo temporarily grants administrator privileges.

You will learn more about sudo in later chapters.

---

# Install Useful Software

Git

```bash
sudo apt install git
```

Curl

```bash
sudo apt install curl
```

Vim

```bash
sudo apt install vim
```

Build tools

```bash
sudo apt install build-essential
```

Tree

```bash
sudo apt install tree
```

HTOP

```bash
sudo apt install htop
```

---

# Verify Installation

Check Ubuntu version.

```bash
lsb_release -a
```

Kernel version.

```bash
uname -r
```

Architecture.

```bash
uname -m
```

Current user.

```bash
whoami
```

Hostname.

```bash
hostname
```

---

# Create Your Practice Folder

```bash
mkdir ~/linux-practice
```

Go inside.

```bash
cd ~/linux-practice
```

Verify.

```bash
pwd
```

---

# Take a Snapshot

VirtualBox

↓

Machine

↓

Take Snapshot

Name:

```
Fresh Ubuntu Install
```

Snapshots allow quick recovery.

---

# Common Installation Problems

## Black Screen

Possible causes:

- Graphics controller
- Virtualization disabled

---

## Slow Performance

Increase:

- RAM
- CPU cores

---

## No Internet

Check:

```
Settings

↓

Network

↓

NAT
```

---

## Ubuntu Won't Boot

Possible reasons:

- Corrupt ISO
- Secure Boot issues
- Incomplete installation

---

## Mouse Not Working

Install:

VirtualBox Guest Additions

---

# VirtualBox Guest Additions

Benefits:

- Better graphics
- Shared clipboard
- Drag and drop
- Dynamic screen resizing
- Shared folders

---

# Best Practices

- Update regularly.
- Keep snapshots.
- Learn terminal commands daily.
- Do not work as root.
- Create backups.
- Read error messages carefully.

---

# Summary

You learned:

- Installation methods
- Ubuntu LTS
- VirtualBox
- BIOS vs UEFI
- Disk partitions
- Ubuntu installation
- System updates
- Essential software
- Snapshots

---

# Interview Questions

### Beginner

1. What is an ISO file?
2. Why use a Virtual Machine?
3. What is Ubuntu LTS?
4. What is swap?
5. Difference between BIOS and UEFI?

---

### Intermediate

6. Difference between GPT and MBR?
7. Why verify ISO checksums?
8. Explain VirtualBox snapshots.
9. What is the root filesystem?
10. Why update Linux immediately after installation?

---

# Hands-on Exercises

## Exercise 1

Install Ubuntu in VirtualBox.

---

## Exercise 2

Take your first snapshot.

---

## Exercise 3

Run the following commands:

```bash
whoami
hostname
pwd
uname -r
uname -m
lsb_release -a
```

Write down what each command displays.

---

## Exercise 4

Create this directory structure:

```text
linux-practice/

├── commands
├── scripts
├── projects
└── notes
```

Use only terminal commands.

---

## Exercise 5

Install the following packages:

- git
- curl
- vim
- tree
- htop

Verify that each is installed by running its version command (for example, `git --version`).

---

# Mini Project

Create a document named:

```
ubuntu-install-report.md
```

Include:

- Why you chose Ubuntu
- VM configuration (RAM, CPU, disk)
- Ubuntu version
- Kernel version
- Installed software
- Screenshots (optional)
- Problems faced and how you solved them

Initialize a Git repository (if you haven't already), add the report, and commit it:

```bash
git init
git add .
git commit -m "Add Ubuntu installation report"
```

---

# What's Next?

In **Chapter 03 – Linux File System**, you'll learn:

- Linux directory hierarchy
- Absolute vs relative paths
- Understanding `/`, `/home`, `/etc`, `/var`, `/usr`, `/tmp`, and more
- Navigating the filesystem using the terminal
- Essential commands such as `pwd`, `cd`, and `ls`
