#!/bin/bash
#===========================================================
# Proxmox Cleanup Script
# Author: Md. Sohag Rana (Sarker Net)
# Purpose: Free disk space by cleaning logs, caches, templates
#===========================================================

echo "=== Starting Proxmox cleanup ==="

# Clear Nginx/RTMP logs
echo "[INFO] Clearing Nginx/RTMP logs..."
for f in /var/log/nginx/*.log /var/log/rtmp*.log; do
  [ -f "$f" ] && : > "$f" && echo "[OK] $f truncated"
done

# Check apt cache size
echo "[INFO] Checking apt cache size before cleaning..."
du -sh /var/cache/apt/archives

# Clean system logs
echo "[INFO] Cleaning system logs..."
find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;

# Apt cleanup
echo "[INFO] Running apt-get clean, autoclean, autoremove..."
apt-get clean
apt-get autoclean
apt-get autoremove -y
command -v deborphan >/dev/null && deborphan | xargs apt-get -y remove --purge

# Remove Trash
echo "[INFO] Removing Trash directories..."
rm -rf /home/*/.local/share/Trash/* /root/.local/share/Trash/*

# Optional: Remove man pages
echo "[INFO] Removing man pages (optional)..."
rm -rf /usr/share/man/*

# Delete rotated/compressed logs
echo "[INFO] Deleting rotated/compressed logs..."
rm -f /var/log/*.gz /var/log/*.[0-9]

# Proxmox-specific cleanup
echo "[INFO] Proxmox-specific cleanup..."
rm -f /var/lib/vz/template/cache/*.tar.gz
rm -f /var/lib/vz/template/iso/*.iso
rm -f /var/lib/vz/dump/*.log

echo "=== Proxmox cleanup completed ==="
