#!/bin/bash

CPU_LOAD=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')

echo "CPU_Load: $CPU_LOAD"

if(($(echo "$CPU_LOAD > 80" | bc -1) )); then
	echo " ALERT: CPU HIGH"
else
	echo "OK: CPU normal"
fi


HOSTNAME=$(hostname)
DATE=$(date)


echo "=============="
echo "Host: $HSOTNAME"
echo "date: $DATE"
echo "=============="

echo"CPU INFO"
top -b -n1 | head -5

echo "MEMORY INFO"
free -h

echo"DISK INFO"
df -h

