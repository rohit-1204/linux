# Linux Notes
# Chapter 21 - System Monitoring in Linux

> **Level:** Beginner to Intermediate  
> **Estimated Reading Time:** 2–3 hours  
> **Practice Time:** 2–4 hours  

---

# Table of Contents

1. What is System Monitoring?
2. Why System Monitoring is Important
3. CPU Monitoring
4. Memory Monitoring
5. Disk Usage Monitoring
6. Process Monitoring
7. Real-Time Monitoring Tools
8. top Command
9. htop Command
10. free Command
11. vmstat Command
12. iostat Command
13. df Command
14. du Command
15. uptime Command
16. /proc File System
17. System Load Average
18. Performance Troubleshooting
19. Summary
20. Interview Questions
21. Practice Exercises
22. Mini Project

---

# Learning Objectives

After completing this chapter, you will understand:

- How to monitor Linux system performance
- How to check CPU, memory, disk usage
- How to track running processes
- How to analyze system load
- How to identify performance bottlenecks
- How Linux exposes system metrics

---

# 📖 Theory

System monitoring in Linux is the process of **observing system health and performance**.

It helps answer questions like:

- Is CPU overloaded?
- Is memory running out?
- Is disk full?
- Which process is consuming resources?

Linux provides many tools to monitor system behavior in real time.

---

# 🧠 Concepts

## What to Monitor in Linux?

- CPU usage
- Memory usage
- Disk usage
- Running processes
- System load
- Network usage (basic level)

---

## Why Monitoring is Important?

- Prevent system crashes
- Detect performance issues
- Identify resource-heavy processes
- Improve system efficiency
- Debug system slowdowns

---

# 🖥️ CPU Monitoring

## What is CPU usage?

CPU usage shows how much processing power is being used.

---

## Command: uptime

```bash
uptime
```

Example output:

```
10:20:30 up 2 days, 3 users, load average: 0.15, 0.10, 0.05
```

---

## Load Average meaning:

| Time | Meaning |
|------|--------|
| 1 min | Recent load |
| 5 min | Medium load |
| 15 min | Long-term load |

---

# 🧠 Memory Monitoring

## Command: free

```bash
free -h
```

Example:

```
              total   used   free   shared  buff/cache  available
Mem:          8G      3G     1G     200M     4G          5G
```

---

## Memory terms:

- **used** → Active memory
- **free** → Unused memory
- **buff/cache** → Cached memory
- **available** → Usable memory

---

# 💾 Disk Monitoring

## Command: df

```bash
df -h
```

Shows disk usage of partitions.

---

## Example:

```
Filesystem      Size  Used Avail Use%
/dev/sda1        50G   20G   30G  40%
```

---

## Command: du

Check folder size:

```bash
du -sh /home
```

---

# 📌 Process Monitoring

## What is a process?

A process is a running program.

---

## View processes:

```bash
ps
```

---

## Detailed view:

```bash
ps aux
```

---

# 📊 Real-Time Monitoring Tools

---

# 🧠 top Command

## Launch:

```bash
top
```

---

## Shows:

- CPU usage
- Memory usage
- Running processes
- System load

---

## Important keys inside top:

| Key | Action |
|-----|--------|
| P | Sort by CPU |
| M | Sort by memory |
| k | Kill process |
| q | Quit |

---

# 🚀 htop Command (Advanced)

```bash
htop
```

---

Features:

- Colorful UI
- Easy navigation
- Process tree view
- Mouse support

---

# 📊 vmstat Command

```bash
vmstat
```

Shows:

- CPU
- Memory
- I/O
- System processes

---

# 💽 iostat Command

```bash
iostat
```

Used for:

- Disk I/O monitoring
- CPU statistics

---

# 📌 /proc File System

Linux stores system info in:

```bash
/proc
```

Example:

```bash
cat /proc/cpuinfo
```

```bash
cat /proc/meminfo
```

---

# ⚡ System Load Average

Load average shows system demand.

Rule of thumb:

- 1 core → load 1.0 = full usage
- 4 cores → load 4.0 = full usage

---

# 🧪 Performance Troubleshooting

If system is slow:

Check in order:

1. CPU → `top`
2. Memory → `free -h`
3. Disk → `df -h`
4. Processes → `ps aux`
5. Logs → (Chapter 20)

---

# ⚠️ Common Mistakes

- Confusing free memory with available memory
- Ignoring load average
- Killing wrong processes in top
- Not checking disk space
- Misreading CPU usage

---

# 💡 Pro Tips

- Always start with `top`
- Use `htop` for better visualization
- Monitor disk before installing software
- Watch load average on servers
- Combine monitoring + logs for debugging

---

# 🎯 Practice Exercises

1. Check system uptime
2. View memory usage using free
3. Check disk usage using df
4. Explore /proc/cpuinfo
5. Run top command
6. Sort processes by memory
7. Find largest directory using du
8. Identify high CPU process
9. Install and run htop
10. Observe load average changes

---

# 🧩 Mini Project

## System Health Monitor Script

Create:

```bash
system_monitor.sh
```

---

### Script:

```bash
#!/bin/bash

echo "===== SYSTEM HEALTH REPORT ====="

echo ""
echo "UPTIME:"
uptime

echo ""
echo "MEMORY:"
free -h

echo ""
echo "DISK USAGE:"
df -h

echo ""
echo "TOP PROCESSES:"
ps aux --sort=-%cpu | head -10
```

---

### Make executable:

```bash
chmod +x system_monitor.sh
```

---

### Run:

```bash
./system_monitor.sh
```

---

# ❓ Interview Questions

### Beginner

1. What is system monitoring?
2. What is CPU usage?
3. What is memory monitoring?

---

### Intermediate

4. What is load average?
5. Difference between free and available memory?
6. What does df command do?

---

### Advanced

7. How does Linux calculate load average?
8. What is /proc filesystem?
9. How do you troubleshoot a slow Linux system?
10. Difference between top and htop?

---

# 📝 Summary

- System monitoring tracks performance
- CPU, memory, disk are key metrics
- `top` and `htop` show real-time usage
- `free`, `df`, `ps` provide system stats
- `/proc` exposes kernel data
- Load average shows system pressure

---

# 📚 Further Reading

- `man top`
- `man htop`
- Linux performance tuning guide
- /proc filesystem documentation
- System administration basics
