#!/bin/bash

echo "HOSTNAME = $(hostname)"
echo "TIMEZONE = $(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}')"
echo "USER = $(whoami)"
echo "OS = $(hostnamectl | grep "Operating System" | awk '{printf $3, $4, $5}')"
echo "DATE = $(date | awk '{print $2, $3, $4, $5}')"
echo "UPTIME = $(uptime -p)"
echo "UPTIME_SEC = $(awk '{ print $1 }' /proc/uptime)"
echo "IP = $(hostname -I)"
ip a | grep -m 'inet' | cut -d '/' -f 2 $2 | awk '{a = $1}'
echo "MASK = $(ipcalc /$a | grep 'Netmask' | awk '{print $2}')"
echo "GATEWAY = $(ip route | grep 'default' | awk '{print $3}')"
echo "RAM_TOTAL = $(free --mega | grep 'Mem' | awk '{printf "%.3f GB", $2/1024}')"
echo "RAM_USED = $(free --mega | grep 'Mem' | awk '{printf "%.3f GB", $3/1024}')"
echo "RAM_FREE = $(free --mega | grep 'Mem' | awk '{printf "%.3f GB", $4/1024}')"
echo "SPACE_ROOT = $(df -BM | grep '/$' | awk '{printf "%.2f MB", $2/1024}')"
echo "SPACE_ROOT_USED = $(df -BM | grep '/$' | awk '{printf "%.2f MB", $3/1024}')"
echo "SPACE_ROOT_FREE = $(df -BM | grep '/$' | awk '{printf "%.2f MB", $4/1024}')"







