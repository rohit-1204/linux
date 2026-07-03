# 15 - Disk Management in Linux

## Learning Objectives

After completing this chapter, you will be able to:

- Understand Linux disk structure
- Check disk usage and free space
- Manage partitions and disks
- Mount and unmount filesystems
- Understand file systems (ext4, xfs, etc.)
- Work with LVM basics
- Troubleshoot disk-related issues

---

# What is Disk Management?

Disk management in Linux involves:

- Viewing storage devices
- Creating partitions
- Mounting drives
- Monitoring disk usage
- Managing storage efficiently

---

# Linux Disk Structure

```
/dev/sda        → First hard disk
/dev/sda1       → First partition
/dev/sda2       → Second partition
/dev/nvme0n1    → NVMe SSD
```

---

# df Command

Shows disk space usage.

---

## Syntax

```bash
df [options]
```

---

## Example

```bash
df -h
```

---

## Output Example

```
Filesystem      Size  Used  Avail  Use%
/dev/sda1       50G   20G    28G   42%
```

---

## Options

| Option | Meaning |
|--------|--------|
| -h | human readable |
| -T | show filesystem type |

---

# du Command

Shows directory disk usage.

---

## Syntax

```bash
du [options] path
```

---

## Example

```bash
du -sh /home
```

---

## Show all folder sizes

```bash
du -h --max-depth=1
```

---

# lsblk Command

Lists block devices.

---

## Syntax

```bash
lsblk
```

---

## Example Output

```
NAME   SIZE TYPE MOUNTPOINT
sda    100G disk
├─sda1  50G part /
└─sda2  50G part /home
```

---

# blkid Command

Shows UUID and filesystem type.

---

## Syntax

```bash
blkid
```

---

## Example

```
/dev/sda1: UUID="abc123" TYPE="ext4"
```

---

# mount Command

Mounts a filesystem.

---

## Syntax

```bash
mount device mount_point
```

---

## Example

```bash
sudo mount /dev/sdb1 /mnt
```

---

# unmount Command

Unmounts a filesystem.

---

## Syntax

```bash
umount mount_point
```

---

## Example

```bash
sudo umount /mnt
```

---

# /etc/fstab File

Controls automatic mounting at boot.

---

## Example Entry

```
/dev/sda1   /   ext4   defaults   0   1
```

---

## Mount all entries

```bash
sudo mount -a
```

---

# fdisk Command

Used to manage partitions.

---

## View partitions

```bash
sudo fdisk -l
```

---

## Start partition tool

```bash
sudo fdisk /dev/sda
```

---

## Common fdisk commands

| Command | Action |
|--------|--------|
| n | new partition |
| d | delete partition |
| p | print table |
| w | write changes |

---

# parted Command

Advanced partition tool.

---

## Example

```bash
sudo parted /dev/sda
```

---

# File Systems

## Common types

| Type | Description |
|------|------------|
| ext4 | Default Linux filesystem |
| xfs | High performance |
| btrfs | Advanced features |
| vfat | USB drives |

---

# mkfs Command

Formats a partition.

---

## Syntax

```bash
mkfs.ext4 /dev/sdb1
```

---

## Example

```bash
sudo mkfs.ext4 /dev/sdb1
```

---

# LVM (Logical Volume Manager)

LVM allows flexible disk management.

---

## Components

```
Physical Volume (PV)
      ↓
Volume Group (VG)
      ↓
Logical Volume (LV)
```

---

## LVM Benefits

- Resize storage easily
- Combine multiple disks
- Flexible partitioning

---

# Check Disk Health

```bash
sudo smartctl -a /dev/sda
```

(Requires smartmontools)

---

# Disk Usage Monitoring

```bash
df -h
du -sh *
```

---

# Swap Space

Used as virtual memory.

---

## Check swap

```bash
swapon --show
```

---

## Create swap

```bash
sudo fallocate -l 1G /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

---

# Common Mistakes

- Mounting wrong device
- Forgetting to unmount before removing USB
- Formatting wrong disk (`mkfs`)
- Editing `/etc/fstab` incorrectly
- Ignoring disk usage warnings

---

# Pro Tips

- Always use `df -h` before installing software
- Use `lsblk` to understand disk layout
- Prefer UUID in `/etc/fstab`
- Monitor disk space regularly
- Use LVM for flexible storage systems

---

# Practice Exercises

1. Check disk usage using `df`
2. View directory size using `du`
3. List block devices using `lsblk`
4. Find filesystem types using `blkid`
5. Mount a USB drive
6. Unmount a filesystem
7. Explore `/etc/fstab`
8. List partitions using `fdisk`
9. Check swap usage
10. Format a test partition (safe lab only)

---

# Mini Project

## Storage Management Lab

### Step 1

Check disk space:

```bash
df -h
```

---

### Step 2

Find disk structure:

```bash
lsblk
```

---

### Step 3

Create mount point:

```bash
sudo mkdir /mnt/testdisk
```

---

### Step 4

Mount device:

```bash
sudo mount /dev/sdb1 /mnt/testdisk
```

---

### Step 5

Check usage:

```bash
df -h
```

---

### Step 6

Unmount device:

```bash
sudo umount /mnt/testdisk
```

---

# Interview Questions

1. What is disk management in Linux?
2. What is the difference between df and du?
3. What is mounting?
4. What is /etc/fstab?
5. What is a partition?
6. Difference between ext4 and xfs?
7. What is LVM?
8. How do you check disk usage?
9. What is swap space?
10. What happens if disk becomes full?

---

# Summary

- `df` → disk space usage
- `du` → directory size
- `lsblk` → block devices
- `mount/umount` → attach/detach filesystems
- `fdisk` → partition management
- `mkfs` → format filesystem
- `/etc/fstab` → auto-mount configuration
- LVM → flexible storage management

---

# Further Reading

- `man df`
- `man du`
- `man mount`
- `man fdisk`
- Linux Filesystem Hierarchy Standard (FHS)
- LVM official documentation
