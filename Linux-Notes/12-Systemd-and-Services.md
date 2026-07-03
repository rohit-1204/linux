# 12 - Systemd and Services

## Learning Objectives

After completing this chapter, you will be able to:

- Understand what **systemd** is
- Understand Linux services (daemons)
- Manage services using `systemctl`
- Start, stop, restart, and reload services
- Enable and disable services at boot
- Check service status
- View service logs using `journalctl`
- List running services
- Troubleshoot service-related issues

---

# What is systemd?

**systemd** is the default **system and service manager** used by most modern Linux distributions.

It is responsible for:

- Booting the system
- Starting system services
- Managing background processes
- Logging system events
- Managing targets (runlevels)

Examples of services managed by systemd:

- SSH Server
- Nginx
- Apache
- Docker
- MySQL

---

# What is a Service?

A **service** (also called a **daemon**) is a background process that runs continuously and provides functionality to the system.

Examples:

- SSH Server (`sshd`)
- Web Server (`nginx`)
- Database (`mysql`)
- Scheduler (`cron`)
- Docker Engine (`docker`)

---

# Service Lifecycle

```
Installed
     │
     ▼
Started
     │
     ▼
Running
     │
 ┌───┴────┐
 ▼        ▼
Restart  Stop
     │
     ▼
Disabled / Removed
```

---

# systemctl Command

The `systemctl` command is used to control systemd services.

---

## Syntax

```bash
systemctl [command] service_name
```

---

# Check Service Status

Displays the current status of a service.

## Syntax

```bash
systemctl status service_name
```

---

## Example

```bash
systemctl status ssh
```

Output:

```
● ssh.service - OpenSSH Server
   Loaded: loaded
   Active: active (running)
```

---

# Start a Service

Starts a stopped service.

## Syntax

```bash
sudo systemctl start service_name
```

---

## Example

```bash
sudo systemctl start nginx
```

---

# Stop a Service

Stops a running service.

## Syntax

```bash
sudo systemctl stop service_name
```

---

## Example

```bash
sudo systemctl stop nginx
```

---

# Restart a Service

Restarts a service completely.

## Syntax

```bash
sudo systemctl restart service_name
```

---

## Example

```bash
sudo systemctl restart nginx
```

---

# Reload a Service

Reloads configuration without stopping the service.

## Syntax

```bash
sudo systemctl reload service_name
```

---

## Example

```bash
sudo systemctl reload nginx
```

---

# Enable a Service

Starts the service automatically during system boot.

## Syntax

```bash
sudo systemctl enable service_name
```

---

## Example

```bash
sudo systemctl enable nginx
```

---

# Disable a Service

Prevents a service from starting automatically.

## Syntax

```bash
sudo systemctl disable service_name
```

---

## Example

```bash
sudo systemctl disable nginx
```

---

# Check if a Service is Enabled

## Syntax

```bash
systemctl is-enabled service_name
```

---

## Example

```bash
systemctl is-enabled nginx
```

Output:

```
enabled
```

---

# Check if a Service is Active

## Syntax

```bash
systemctl is-active service_name
```

---

## Example

```bash
systemctl is-active nginx
```

Output:

```
active
```

---

# List Running Services

## Syntax

```bash
systemctl list-units --type=service
```

---

## Example

```bash
systemctl list-units --type=service
```

---

# List All Services

```bash
systemctl list-unit-files --type=service
```

---

# View Failed Services

```bash
systemctl --failed
```

---

# journalctl Command

Displays logs collected by systemd.

---

## Syntax

```bash
journalctl
```

---

## View Logs for a Service

```bash
journalctl -u service_name
```

---

## Example

```bash
journalctl -u nginx
```

---

## View Recent Logs

```bash
journalctl -n 20
```

---

## Follow Logs in Real Time

```bash
journalctl -f
```

---

## Show Today's Logs

```bash
journalctl --since today
```

---

# Boot Time Analysis

Display boot performance.

```bash
systemd-analyze
```

Example Output:

```
Startup finished in 3.4s
```

---

# Show Boot Sequence

```bash
systemd-analyze blame
```

Shows which services took the most time during boot.

---

# Targets in systemd

Targets replace traditional Linux runlevels.

| Target | Description |
|----------|------------|
| poweroff.target | Shutdown |
| rescue.target | Single-user mode |
| multi-user.target | Multi-user (CLI) |
| graphical.target | GUI mode |
| reboot.target | Restart system |

---

# Check Current Target

```bash
systemctl get-default
```

---

# Change Default Target

GUI Mode

```bash
sudo systemctl set-default graphical.target
```

CLI Mode

```bash
sudo systemctl set-default multi-user.target
```

---

# Service Unit Files

Systemd service files are stored in:

```
/usr/lib/systemd/system/

/etc/systemd/system/
```

Example:

```
nginx.service
docker.service
ssh.service
```

---

# View Service File

```bash
systemctl cat nginx
```

---

# Reload systemd Configuration

After editing a service file:

```bash
sudo systemctl daemon-reload
```

---

# Service Management Workflow

```
Install Service
      │
      ▼
Enable Service
      │
      ▼
Start Service
      │
      ▼
Check Status
      │
      ▼
View Logs
      │
      ▼
Restart if Needed
```

---

# Common Mistakes

- Forgetting `sudo` while managing services
- Restarting instead of reloading configuration
- Forgetting `daemon-reload` after editing service files
- Assuming a service starts automatically after installation
- Ignoring service logs while troubleshooting

---

# Pro Tips

- Use `systemctl status` before restarting a service
- Use `journalctl -u service_name` to diagnose issues
- Enable important services to start on boot
- Use `reload` instead of `restart` when supported
- Check failed services regularly using `systemctl --failed`

---

# Practice Exercises

1. Check the status of the SSH service.
2. Start and stop the SSH service.
3. Restart the SSH service.
4. Check if SSH is enabled.
5. Enable SSH at boot.
6. List all running services.
7. View logs for the SSH service.
8. Display the last 20 log entries.
9. Check the current system target.
10. Display boot performance statistics.

---

# Mini Project

## Manage an Nginx Service

### Step 1

Install Nginx (if not already installed).

```bash
sudo apt install nginx
```

---

### Step 2

Start the service.

```bash
sudo systemctl start nginx
```

---

### Step 3

Enable it at boot.

```bash
sudo systemctl enable nginx
```

---

### Step 4

Verify its status.

```bash
systemctl status nginx
```

---

### Step 5

View service logs.

```bash
journalctl -u nginx
```

---

### Step 6

Restart the service.

```bash
sudo systemctl restart nginx
```

---

### Step 7

Stop and disable the service.

```bash
sudo systemctl stop nginx
sudo systemctl disable nginx
```

---

# Interview Questions

1. What is systemd?
2. What is a Linux service?
3. What is the difference between a service and a process?
4. What does `systemctl` do?
5. Difference between `start` and `enable`?
6. Difference between `restart` and `reload`?
7. How do you check the status of a service?
8. How do you list failed services?
9. What is `journalctl` used for?
10. Where are systemd service files stored?
11. What is `daemon-reload`?
12. What are systemd targets?
13. How do you check boot performance?
14. How do you enable a service during startup?
15. How do you troubleshoot a failed service?

---

# Summary

- `systemd` → System and service manager
- `systemctl` → Manage services
- `journalctl` → View system logs
- `start` → Start service
- `stop` → Stop service
- `restart` → Restart service
- `reload` → Reload configuration
- `enable` → Start at boot
- `disable` → Prevent startup at boot
- `status` → View service status
- `daemon-reload` → Reload modified unit files

---

# Further Reading

- `man systemctl`
- `man journalctl`
- `man systemd`
- `man systemd.service`
- freedesktop.org systemd documentation
- Linux System Administration Guide
