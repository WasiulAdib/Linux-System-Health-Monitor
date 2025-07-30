#!/bin/bash

echo "======================================="
echo "      SIMPLE SYSTEM HEALTH MONITOR     "
echo "======================================="
echo

# Show system hostname
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo

# Show logged-in users
echo "---------------------------------------"
echo "Logged-in Users:"
who
echo

# Show memory usage
echo "---------------------------------------"
echo "Memory Usage (RAM):"
free -h
echo

# Show disk usage
echo "---------------------------------------"
echo "Disk Usage:"
df -h | grep '^/dev/'
echo

# Show CPU load average
echo "---------------------------------------"
echo "CPU Load (last 1, 5, 15 minutes):"
uptime | awk -F'load average:' '{print $2}'
echo

# Show top 5 memory-hungry processes
echo "---------------------------------------"
echo "Top 5 Memory-Using Processes:"
ps aux --sort=-%mem | head -n 6
echo

# Show top 5 CPU-using processes
echo "---------------------------------------"
echo "Top 5 CPU-Using Processes:"
ps aux --sort=-%cpu | head -n 6
echo

echo "======================================="
echo "       END OF SYSTEM REPORT            "
echo "======================================="
