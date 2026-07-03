# 08 - Editors (vim & nano)

## Learning Objectives

After completing this chapter, you will be able to:

- Use nano editor for simple file editing
- Use vim editor for advanced editing
- Understand vim modes
- Save and exit files correctly
- Edit Linux configuration files
- Work efficiently in terminal editors

---

## Why Editors are Needed in Linux

Linux systems require editing files such as:

- Configuration files (/etc/)
- Shell scripts (.sh files)
- Service files
- Logs and system settings

Since most servers don’t have GUI, editors are essential.

---

## nano Editor

Simple and beginner-friendly text editor.

### Syntax

```bash
nano filename
```

### Example

```bash
nano test.txt
```

---

### Basic Operations in nano

| Action | Shortcut |
|--------|----------|
| Save file | Ctrl + O |
| Exit editor | Ctrl + X |
| Cut line | Ctrl + K |
| Paste line | Ctrl + U |
| Search | Ctrl + W |

---

### Example Usage

```bash
nano notes.txt
```

Write:

```
Linux is easy to learn
nano is simple editor
```

Then:

- Ctrl + O → Save
- Ctrl + X → Exit

---

## vim Editor

Advanced and powerful Linux editor used in servers.

### Syntax

```bash
vim filename
```

### Example

```bash
vim test.txt
```

---

## Vim Modes

vim has 3 modes:

- Normal Mode → navigation
- Insert Mode → writing text
- Command Mode → save/exit

---

## Insert Mode

### Enter Insert Mode

```text
i
```

Now you can type text.

Example:

```
Hello Linux
Vim is powerful
```

Exit insert mode:

```text
Esc
```

---

## Save and Exit vim

### Save and exit

```bash
:wq
```

### Exit without saving

```bash
:q!
```

---

## Basic vim Commands

| Command | Description |
|--------|-------------|
| i | Insert mode |
| dd | Delete line |
| yy | Copy line |
| p | Paste |
| u | Undo |

---

## Navigation in vim

| Key | Action |
|-----|--------|
| h | Left |
| l | Right |
| j | Down |
| k | Up |

---

## Example vim Workflow

```bash
vim file.txt
```

Press:

- i → insert mode
- type text
- Esc → normal mode
- :wq → save and exit

---

## nano vs vim

| Feature | nano | vim |
|--------|------|-----|
| Ease of use | Easy | Hard |
| Learning curve | Low | High |
| Speed | Medium | Fast |
| Server usage | Yes | Yes (most used) |

---

## Common Mistakes

- Forgetting to press Esc in vim
- Using wrong save command (:q instead of :wq)
- Accidentally exiting without saving
- Confusing nano shortcuts

---

## Pro Tips

- Use nano for quick edits
- Use vim for servers and DevOps work
- Always press Esc before saving in vim
- Practice vim navigation daily

---

## Practice Exercises

- Create a file using nano
- Edit and save it
- Open file in vim
- Practice insert mode
- Save and exit vim
- Try delete, copy, paste in vim

---

## Mini Project

Create a script using vim:

```bash
vim script.sh
```

Add:

```bash
echo "Hello Linux"
echo "Learning Editors"
echo "Practice Vim"
```

Make it executable:

```bash
chmod +x script.sh
./script.sh
```

---

## Interview Questions

1. What is nano editor?
2. What is vim editor?
3. Difference between nano and vim?
4. What are vim modes?
5. How do you save in vim?
6. What is :wq in vim?
7. How do you exit vim without saving?
8. Why is vim used in servers?
9. What is insert mode?
10. Which editor is better for beginners?

---

## Summary

- nano → simple editor for beginners
- vim → powerful editor for professionals
- vim has modes (normal, insert, command)
- nano uses shortcut keys
- vim is widely used in production servers

---

## Further Reading

- `man nano`
- `vimtutor` command
- Vim official documentation
- GNU nano documentation
