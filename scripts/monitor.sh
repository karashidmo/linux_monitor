#!/bin/bash

#LOG_FILE="../logs/monitor.log"
LOG_FILE="/app/logs/monitor.log"
DATE=$(date)


echo "==============" >> $LOG_FILE
echo "date: $DATE" >> $LOG_FILE
echo "=============="

echo "CPU INFO" >> $LOG_FILE

top -b -n1 | head -5 >> $LOG_FILE

echo "MEMORY INFO" >> $LOG_FILE
free -h >> $LOG_FILE

echo "DISK INFO"  >> $LOG_FILE
df -h  >> $LOG_FILE

echo "log savec in  $LOG_FILE"


CPU=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if (($(echo "CPU > 80" | bc -l) )); then
        echo "ALERT CPU HIGH : $CPU" >> $LOG_FILE
        fi
