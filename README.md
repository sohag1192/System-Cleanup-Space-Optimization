---

# 🧹 System Cleanup & Space Optimization

## 📖 Overview
This repository contains shell scripts to automate **system cleanup** and **disk space optimization**.  
It helps free up space by cleaning logs, caches, orphaned packages, and temporary files across Ubuntu/Proxmox servers.

---

## ⚙️ Features
- **[Truncate all log files](guide://action?prefill=Tell%20me%20more%20about%3A%20Truncate%20all%20log%20files)** under `/var/log` (excluding `wtmp` and `btmp`).
- **[Delete rotated/compressed logs](guide://action?prefill=Tell%20me%20more%20about%3A%20Delete%20rotated%2Fcompressed%20logs)** (`*.gz`, `*.1`, etc.).
- **[Vacuum systemd journal logs](guide://action?prefill=Tell%20me%20more%20about%3A%20Vacuum%20systemd%20journal%20logs)** older than 7 days.
- **[Clear Nginx and RTMP logs](guide://action?prefill=Tell%20me%20more%20about%3A%20Clear%20Nginx%20and%20RTMP%20logs)**.
- **[Clean APT cache](guide://action?prefill=Tell%20me%20more%20about%3A%20Clean%20APT%20cache)** and remove orphaned packages.
- **[Delete trash and manual pages](guide://action?prefill=Tell%20me%20more%20about%3A%20Delete%20trash%20and%20manual%20pages)**.
- **[Show disk usage after cleanup](guide://action?prefill=Tell%20me%20more%20about%3A%20Show%20disk%20usage%20after%20cleanup)**.

---

## 🚀 Usage
### 1. Download the script
```bash
wget -O log_cleanup.sh https://raw.githubusercontent.com/sohag1192/System-Cleanup-Script/main/log_cleanup.sh
chmod +x log_cleanup.sh
```

### 2. Run manually
```bash
sudo ./log_cleanup.sh
```

### 3. Automate with cron
Edit crontab:
```bash
crontab -e
```
Add this line to run daily at 3:00 AM:
```bash
0 3 * * * /root/log_cleanup.sh >> /root/log_cleanup.log 2>&1
```

---

## 📂 Scripts Included
- **[clean-logs.sh](guide://action?prefill=Tell%20me%20more%20about%3A%20clean-logs.sh)** – Apache2, Nginx, and Ubuntu cache cleanup.  
- **[clean.sh](guide://action?prefill=Tell%20me%20more%20about%3A%20clean.sh)** – General cleanup script.  
- **[clean_up.sh](guide://action?prefill=Tell%20me%20more%20about%3A%20clean_up.sh)** – Renamed version of `clean.sh`.  
- **[log_cleanup.sh](guide://action?prefill=Tell%20me%20more%20about%3A%20log_cleanup.sh)** – Advanced Ubuntu log cleaner with disk usage report.

---

## 🛡️ Notes
- Safe for production servers, but always review before deploying.  
- Run periodically to maintain optimal performance.  
- Requires `deborphan` for orphaned package removal.

---



```bash
# Ubuntu Log Cleaner
wget -O log_cleanup.sh https://raw.githubusercontent.com/sohag1192/System-Cleanup-Script/main/log_cleanup.sh

# Apache2/Nginx + Ubuntu cache cleanup
wget -O clean-logs.sh https://raw.githubusercontent.com/sohag1192/System-Cleanup-Script/main/clean-logs.sh

# General cleanup script
wget -O clean_up.sh https://raw.githubusercontent.com/sohag1192/System-Cleanup-Script/main/clean_up.sh

# Proxmox cleanup script
wget -O proxmox-cleanup.sh https://raw.githubusercontent.com/sohag1192/System-Cleanup-Script/main/proxmox-cleanup.sh

# Alternate Proxmox cleanup script
wget -O proxmox_clean.sh https://raw.githubusercontent.com/sohag1192/System-Cleanup-Script/main/proxmox_clean.sh
```

---

### 📂 Scripts included
- **[log_cleanup.sh](guide://action?prefill=Tell%20me%20more%20about%3A%20log_cleanup.sh)** – Advanced Ubuntu log cleaner with disk usage report  
- **[clean-logs.sh](guide://action?prefill=Tell%20me%20more%20about%3A%20clean-logs.sh)** – Apache2, Nginx, and Ubuntu cache cleanup  
- **[clean_up.sh](guide://action?prefill=Tell%20me%20more%20about%3A%20clean_up.sh)** – General cleanup script (renamed from `clean.sh`)  
- **[proxmox-cleanup.sh](guide://action?prefill=Tell%20me%20more%20about%3A%20proxmox-cleanup.sh)** – Proxmox‑specific cleanup with cache/log removal  
- **[proxmox_clean.sh](guide://action?prefill=Tell%20me%20more%20about%3A%20proxmox_clean.sh)** – Alternate Proxmox cleanup script  

---

### ⚡ Quick usage
1. Run `chmod +x scriptname.sh` after download.  
2. Execute with `sudo ./scriptname.sh`.  
3. (Optional) Add to cron for scheduled cleanup.  

This way you’ll have **all log cleanup scripts** locally, ready to run or customi

---

## 👤 Maintainer
**Md. Sohag Rana**  
Network & IT Infrastructure Manager, Sarker Net  
📧 Email: sohag1192@gmail.com  
💬 Telegram: [sohag1192  ](https://t.me/sohag1192)

---
