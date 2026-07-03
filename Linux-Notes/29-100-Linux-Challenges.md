# Linux Notes
# Chapter 30 - 100 Linux Challenges

> **Level:** Beginner → Advanced  
> **Estimated Reading Time:** 2–3 hours  
> **Practice Time:** 10–20 hours  

---

# Table of Contents

1. Why Practice Linux Challenges?
2. How to Use This Chapter
3. 100 Linux Challenges
4. Beginner Challenges (1–30)
5. Intermediate Challenges (31–70)
6. Advanced Challenges (71–100)
7. Mini Projects
8. Summary

---

# 📖 Why Practice Linux Challenges?

Linux is not learned by reading — it is learned by:

- Typing commands
- Breaking things
- Fixing systems
- Repeating tasks

Challenges help you:

- Build confidence
- Improve speed
- Prepare for interviews
- Learn real-world Linux usage

---

# 🧠 How to Use This Chapter

For each challenge:

✔ Try without looking at answers  
✔ Use `man` pages  
✔ Practice in terminal  
✔ Repeat until fast  

---

# 🚀 100 Linux Challenges

---

# 🟢 Beginner (1–30)

1. Print current directory  
2. List files in a directory  
3. List hidden files  
4. Create a directory  
5. Delete a directory  
6. Create a file using `touch`  
7. View file content using `cat`  
8. View file using `less`  
9. Copy a file  
10. Move a file  
11. Rename a file  
12. Delete a file  
13. Find current user  
14. Find hostname  
15. Display calendar  
16. Display date  
17. Clear terminal  
18. Use `echo` command  
19. Create nested directories  
20. Remove nested directories  
21. View command history  
22. Repeat last command  
23. Use tab completion  
24. Use `man ls`  
25. Search inside man page  
26. Check disk usage  
27. Check memory usage  
28. Check system uptime  
29. View running processes  
30. Kill a process  

---

# 🟡 Intermediate (31–70)

31. Find large files using `du`  
32. Sort files by size  
33. Find a file using `find`  
34. Search text using `grep`  
35. Count lines in a file  
36. Count words in a file  
37. Replace text using `sed`  
38. Extract columns using `cut`  
39. Combine commands using pipe `|`  
40. Redirect output to file  
41. Append output to file  
42. Redirect error output  
43. Use `tee` command  
44. Compare two files  
45. Check open ports  
46. Ping a website  
47. Download file using `wget`  
48. Use curl command  
49. Archive files using `tar`  
50. Extract tar file  
51. Compress using gzip  
52. Decompress gzip file  
53. Change file permissions  
54. Change ownership  
55. Create user  
56. Delete user  
57. Add user to group  
58. Check groups  
59. Switch user  
60. Run command as sudo  
61. View system logs  
62. Monitor logs live  
63. Check service status  
64. Start service  
65. Stop service  
66. Restart service  
67. Enable service on boot  
68. Disable service  
69. Check installed packages  
70. Install package  

---

# 🔵 Advanced (71–100)

71. Remove package  
72. Update system  
73. Upgrade system  
74. Check CPU usage  
75. Monitor processes with `top`  
76. Use `htop`  
77. Kill process by name  
78. Find zombie processes  
79. Analyze system load  
80. Check kernel version  
81. Check OS version  
82. View boot logs  
83. Manage cron jobs  
84. Create cron job  
85. Delete cron job  
86. Write bash script  
87. Execute bash script  
88. Debug bash script  
89. Create system backup  
90. Restore backup  
91. Mount filesystem  
92. Unmount filesystem  
93. Check disk partitions  
94. Create partition (theoretical)  
95. Configure SSH  
96. Connect via SSH  
97. Copy files via SCP  
98. Use rsync  
99. Run Docker container  
100. Build simple Docker image  

---

# 🧩 Mini Projects

## Project 1: File Manager CLI

- Create folders
- Move files
- Delete files
- Search files

---

## Project 2: System Monitor Script

Create script:

```bash
#!/bin/bash
echo "CPU Info"
top -n 1

echo "Memory Info"
free -h

echo "Disk Info"
df -h
```

---

## Project 3: Backup Tool

- Compress `/home`
- Save to `.tar.gz`
- Automate using cron

---

# ⚠️ Tips for Solving Challenges

- Don’t memorize commands
- Understand usage
- Use `man`
- Practice daily
- Break and fix things

---

# 📝 Summary

- 100 hands-on Linux tasks
- Covers beginner → advanced level
- Builds real-world confidence
- Essential for interviews
- Improves terminal speed

---

# 📚 Further Practice

- Try all commands without GUI
- Use only terminal for 1 day
- Build your own Linux toolkit
- Automate daily tasks with bash
