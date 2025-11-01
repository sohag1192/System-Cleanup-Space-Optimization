#!/bin/bash
# Script by Sohag — System Cleanup & Space Optimization

echo "Starting cleanup process..."

# 1. Clear NGINX & RTMP logs
: > /usr/local/nginx/logs/access.log
: > /usr/local/nginx/logs/error.log
: > /usr/local/nginx/logs/rtmp_error.log

# 2. Show APT cache usage
echo "APT cache size:"
du -sh /var/cache/apt/archives

# 3. Truncate all log files except system binaries
find /var/log -type f ! -name 'wtmp' ! -name 'btmp' -exec truncate -s 0 {} \;

# 4. Clean APT cache and remove unused packages
apt-get clean
apt-get autoclean
apt-get autoremove -y
apt-get remove --purge -y software-properties-common

# 5. Remove orphaned packages (if deborphan is installed)
if command -v deborphan >/dev/null; then
  deborphan | xargs apt-get -y remove --purge
fi

# 6. Clear user and root trash
rm -rf /home/*/.local/share/Trash/*/** 2>/dev/null
rm -rf /root/.local/share/Trash/*/** 2>/dev/null

# 7. Remove manual pages
rm -rf /usr/share/man/?? /usr/share/man/??_*

# 8. Delete compressed and rotated logs
find /var/log -type f -name "*.gz" -delete
find /var/log -type f -regex ".*\.[0-9]$" -delete

# 9. Show final disk usage
echo "Disk usage after cleanup:"
df -h /

echo "✅ Cleanup completed successfully — Script by Sohag"
