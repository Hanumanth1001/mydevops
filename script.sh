#!/bin/bash
date
echo "=========================================="
echo "uptime:"
echo "=========================================="
uptime
echo "Currently connected:"
w
echo "=========================================="
echo "Last logins:"
echo "=========================================="
last -a | head -3
echo "=========================================="
echo "Disk and memory usage:"
echo "=========================================="
df -h | xargs | awk '{print "Free/total disk: " $11 " / " $9}'
free -m | xargs | awk '{print "Free/total memory: " $17 " / " $8 " MB"}'
echo "=========================================="
start_log=$(head -1 /var/log/messages | cut -c 1-12)
oom=$(grep -ci kill /var/log/messages)
echo -n "OOM errors since $start_log :" $oom
echo ""
echo "=========================================="
echo "Utilization and most expensive processes:"
echo "=========================================="
top -b | head -3
echo
top -b | head -10 | tail -4
echo "=========================================="
echo "Open TCP ports:"
echo "=========================================="
nmap -p -T4 127.0.0.1
echo "=========================================="
echo "Current connections:"
echo "=========================================="
ss -s
echo "=========================================="
echo "processes:"
echo "=========================================="
ps auxf --width=200
echo "=========================================="
echo "vmstat:"
echo "=========================================="
vmstat 1 5
