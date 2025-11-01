# System-Cleanup-Space-Optimization
🧼 Script by Sohag — System Cleanup &amp; Space Optimization

---

### ✅ Step 1: Host Your Script on GitHub
You've already done this! For example:

- [`clean.sh`](https://github.com/sohag1192/System-Cleanup-Space-Optimization/blob/main/clean.sh)

---

### 🧲 Step 2: Download Script via `wget`

Use `wget` to fetch the script directly to your server:

```bash
wget -O /usr/local/bin/clean.sh https://raw.githubusercontent.com/sohag1192/System-Cleanup-Space-Optimization/main/clean.sh
```

Then make it executable:

```bash
chmod +x /usr/local/bin/clean.sh
```

---

### 🕒 Step 3: Automate with `cron`

Edit the crontab:

```bash
crontab -e
```

Add a line to run the script daily at 2:30 AM:

```bash
30 2 * * * /usr/local/bin/clean.sh >> /var/log/sohag_cleanup.log 2>&1
```

This will:
- Run the script every day at 2:30 AM
- Log output to `/var/log/sohag_cleanup.log`

---

### 🛡️ Optional: Add Safety Checks to Script

Inside your script, you can add:

```bash
# Prevent accidental execution as non-root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi
```

---
