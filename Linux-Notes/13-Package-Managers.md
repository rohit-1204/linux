# 13 - Package Managers in Linux

## Learning Objectives

After completing this chapter, you will be able to:

- Understand what a package manager is
- Install, update, and remove software packages
- Work with `apt`, `dnf`, and `yum`
- Update system repositories
- Search for packages
- Fix broken packages
- Understand repositories and dependencies

---

# What is a Package Manager?

A **package manager** is a tool that installs, updates, configures, and removes software in Linux.

It automatically handles:

- Dependencies
- Updates
- Version control
- Software sources (repositories)

---

# Why Package Managers are Important

Without package managers, you would need to:

- Download software manually
- Compile source code
- Manage dependencies yourself

Package managers simplify everything:

```
Install → Update → Remove → Search → Upgrade
```

---

# Types of Package Managers

| Distribution | Package Manager |
|--------------|-----------------|
| Ubuntu / Debian | apt |
| Debian (older) | apt-get |
| CentOS 7 | yum |
| RHEL / Fedora | dnf |
| Arch Linux | pacman |

---

# APT (Advanced Package Tool)

Used in Debian-based systems.

---

## Update Package List

```bash
sudo apt update
```

---

## Upgrade Installed Packages

```bash
sudo apt upgrade
```

---

## Full System Upgrade

```bash
sudo apt full-upgrade
```

---

## Install a Package

```bash
sudo apt install package_name
```

### Example

```bash
sudo apt install nginx
```

---

## Remove a Package

```bash
sudo apt remove package_name
```

---

## Remove with Configuration Files

```bash
sudo apt purge package_name
```

---

## Search for a Package

```bash
apt search package_name
```

---

## Show Package Details

```bash
apt show package_name
```

---

## Clean Unused Packages

```bash
sudo apt autoremove
```

---

# DNF Package Manager

Used in modern RHEL / Fedora systems.

---

## Install Package

```bash
sudo dnf install package_name
```

---

## Remove Package

```bash
sudo dnf remove package_name
```

---

## Update System

```bash
sudo dnf update
```

---

## Search Package

```bash
dnf search package_name
```

---

## Show Package Info

```bash
dnf info package_name
```

---

# YUM Package Manager (Older RHEL)

YUM is replaced by DNF but still used in legacy systems.

---

## Install Package

```bash
sudo yum install package_name
```

---

## Remove Package

```bash
sudo yum remove package_name
```

---

## Update System

```bash
sudo yum update
```

---

# Repositories

A **repository (repo)** is a storage location where software packages are stored.

---

## Repository Types

- Official repositories
- Third-party repositories
- Local repositories

---

## View Repositories (APT)

```bash
cat /etc/apt/sources.list
```

---

## View Repositories (DNF/YUM)

```bash
ls /etc/yum.repos.d/
```

---

# Package Cache

APT stores downloaded package data in cache.

---

## Clean Cache

```bash
sudo apt clean
```

---

## Remove Old Cache

```bash
sudo apt autoclean
```

---

# Dependency Management

Package managers automatically install required dependencies.

Example:

```bash
sudo apt install nginx
```

Also installs:

- libc
- openssl
- required modules

---

# Fix Broken Packages

## APT Fix

```bash
sudo apt --fix-broken install
```

---

# Check Installed Packages

```bash
dpkg -l
```

---

# Check Package Files

```bash
dpkg -L package_name
```

---

# Install Local Package File

```bash
sudo dpkg -i package.deb
```

---

# RPM Packages (RHEL-based systems)

## Install RPM file

```bash
sudo rpm -ivh package.rpm
```

---

## Remove RPM package

```bash
sudo rpm -e package_name
```

---

## Query Installed Package

```bash
rpm -q package_name
```

---

# Package Manager Workflow

```
Search → Install → Configure → Update → Remove
```

---

# Common Mistakes

- Running `apt upgrade` without `apt update`
- Installing packages without sudo
- Mixing apt and dnf commands
- Ignoring dependency errors
- Removing critical system packages

---

# Pro Tips

- Always run `apt update` before installing
- Use `apt search` before installing packages
- Prefer `apt install` over `dpkg -i`
- Clean unused packages regularly
- Avoid unnecessary system upgrades on production servers

---

# Practice Exercises

1. Update package list using apt
2. Install nginx
3. Remove a package
4. Search for a package
5. View package details
6. Clean package cache
7. Install a local .deb file
8. List installed packages
9. Fix broken packages
10. Explore repository files

---

# Mini Project

## Setup a Web Server

### Step 1: Update system

```bash
sudo apt update
```

---

### Step 2: Install Nginx

```bash
sudo apt install nginx
```

---

### Step 3: Start service

```bash
sudo systemctl start nginx
```

---

### Step 4: Enable at boot

```bash
sudo systemctl enable nginx
```

---

### Step 5: Verify installation

```bash
curl http://localhost
```

---

### Step 6: Remove package (optional test)

```bash
sudo apt remove nginx
```

---

# Interview Questions

1. What is a package manager?
2. Difference between apt, yum, and dnf?
3. What is a repository?
4. Why do we run apt update before install?
5. Difference between remove and purge?
6. What is dependency management?
7. What is dpkg?
8. What is rpm?
9. How do you fix broken packages?
10. Why are package managers important?

---

# Summary

- Package manager installs and manages software
- APT → Debian/Ubuntu
- DNF/YUM → RedHat/Fedora
- Repositories store software packages
- Dependencies are handled automatically
- dpkg and rpm are low-level tools

---

# Further Reading

- `man apt`
- `man dnf`
- `man yum`
- Debian package management guide
- Fedora system administration guide
