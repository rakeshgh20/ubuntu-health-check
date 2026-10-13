#!/usr/bin/env/bash

set -euo pipefail

echo "---------------------------------"
echo "UBUNTU HEALTH CHECK"
echo "---------------------------------"

echo
echo "hostname:"
hostname

echo
echo "current date"
date

echo
echo "system uptime"
uptime -p

echo
echo "cpu load"
uptime

echo
echo "Memory Usage:"
free -h

echo
echo "Disk Usage:"
df -h /

echo
echo "top 5 process by cpu"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

echo
echo "health check completed sucessfully"
