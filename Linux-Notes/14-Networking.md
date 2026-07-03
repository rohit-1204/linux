# 14 - Networking in Linux

## Learning Objectives

After completing this chapter, you will be able to:

- Understand basic networking concepts in Linux
- Check IP address and network interfaces
- Test network connectivity
- Use DNS and hostname tools
- Diagnose network issues
- Understand ports and sockets
- Use common networking commands

---

# What is Networking in Linux?

Networking allows Linux systems to communicate with:

- Other computers
- Servers
- Internet services
- Internal services (databases, APIs)

Example:

```
Your Linux system → Router → Internet → Server
```

---

# Basic Networking Concepts

## IP Address

Unique address of a machine in a network.

Example:

```
192.168.1.10
```

---

## MAC Address

Hardware address of network interface.

Example:

```
00:1A:2B:3C:4D:5E
```

---

## Port

A logical endpoint for services.

Examples:

- 22 → SSH
- 80 → HTTP
- 443 → HTTPS

---

## DNS

Converts domain names to IP addresses.

Example:

```
google.com → 142.250.x.x
```

---

# ip Command (Most Important)

Modern tool for network configuration.

---

## Show IP Address

```bash
ip a
```

or

```bash
ip addr
```

---

## Show Routing Table

```bash
ip route
```

---

## Show Network Interfaces

```bash
ip link
```

---

## Example Output

```
2: eth0: <BROADCAST,MULTICAST,UP>
    inet 192.168.1.10/24
```

---

# ifconfig (Old Tool)

Deprecated but still used in some systems.

---

## Show Network Info

```bash
ifconfig
```

---

## Install ifconfig (if missing)

```bash
sudo apt install net-tools
```

---

# ping Command

Used to test connectivity.

---

## Syntax

```bash
ping host
```

---

## Example

```bash
ping google.com
```

---

## Stop ping

```text
Ctrl + C
```

---

# curl Command

Used to transfer data from URLs.

---

## Syntax

```bash
curl URL
```

---

## Example

```bash
curl http://example.com
```

---

## Download file

```bash
curl -O https://example.com/file.txt
```

---

# wget Command

Download files from internet.

---

## Syntax

```bash
wget URL
```

---

## Example

```bash
wget https://example.com/file.txt
```

---

# netstat Command

Shows network connections (legacy tool).

---

## Show all connections

```bash
netstat -tulnp
```

---

## Install netstat

```bash
sudo apt install net-tools
```

---

# ss Command (Modern replacement)

---

## Show sockets

```bash
ss
```

---

## Show listening ports

```bash
ss -tuln
```

---

# hostname Command

Shows or sets system hostname.

---

## Show hostname

```bash
hostname
```

---

## Set hostname (temporary)

```bash
sudo hostname new-name
```

---

# nslookup Command

Used for DNS lookup.

---

## Syntax

```bash
nslookup domain
```

---

## Example

```bash
nslookup google.com
```

---

# dig Command

Advanced DNS lookup tool.

---

## Syntax

```bash
dig domain
```

---

## Example

```bash
dig google.com
```

---

# traceroute Command

Shows path packets take to reach destination.

---

## Install

```bash
sudo apt install traceroute
```

---

## Run

```bash
traceroute google.com
```

---

# Network Manager (nmcli)

Used for managing network connections.

---

## Show devices

```bash
nmcli device status
```

---

## Show connections

```bash
nmcli connection show
```

---

# Ports and Services

## Check open ports

```bash
ss -tuln
```

---

## Common Ports

| Service | Port |
|--------|------|
| SSH | 22 |
| HTTP | 80 |
| HTTPS | 443 |
| MySQL | 3306 |
| DNS | 53 |

---

# Firewall Basics (ufw)

---

## Enable firewall

```bash
sudo ufw enable
```

---

## Allow SSH

```bash
sudo ufw allow 22
```

---

## Check status

```bash
sudo ufw status
```

---

# Common Networking Issues

## No internet

Check:

```bash
ip a
ip route
ping 8.8.8.8
```

---

## DNS not working

Check:

```bash
nslookup google.com
```

---

## Port not reachable

Check:

```bash
ss -tuln
```

---

# Common Mistakes

- Forgetting network interface name
- Confusing IP address with hostname
- Not checking DNS separately
- Ignoring firewall rules
- Using deprecated tools only (ifconfig, netstat)

---

# Pro Tips

- Use `ip` instead of `ifconfig`
- Use `ss` instead of `netstat`
- Always test with `ping` first
- Use `curl` for API testing
- Use `nslookup` for DNS debugging

---

# Practice Exercises

1. Check IP address of system
2. Ping google.com
3. Display routing table
4. Check open ports
5. Perform DNS lookup
6. Download file using wget
7. Use curl to fetch webpage
8. View network interfaces
9. Check hostname
10. Install and use traceroute

---

# Mini Project

## Network Diagnostic Tool

Perform full network check:

### Step 1

Check IP:

```bash
ip a
```

---

### Step 2

Check internet:

```bash
ping google.com
```

---

### Step 3

Check DNS:

```bash
nslookup google.com
```

---

### Step 4

Check routes:

```bash
ip route
```

---

### Step 5

Check open ports:

```bash
ss -tuln
```

---

### Step 6

Download test file:

```bash
wget https://example.com
```

---

# Interview Questions

1. What is an IP address?
2. Difference between IP and MAC address?
3. What is DNS?
4. What is ping used for?
5. Difference between curl and wget?
6. What is ss command?
7. What is netstat?
8. What is traceroute?
9. How do you check open ports?
10. How do you troubleshoot network issues?

---

# Summary

- `ip` → network configuration
- `ping` → connectivity test
- `curl/wget` → data download
- `ss` → network connections
- `nslookup/dig` → DNS lookup
- `traceroute` → path tracking
- `ufw` → firewall management

---

# Further Reading

- `man ip`
- `man ss`
- `man curl`
- Linux networking guide
- TCP/IP fundamentals
