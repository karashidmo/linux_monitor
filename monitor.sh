#!/bin/bash
#


echo "CPU INFO"
top -b -n1 | head -5

echo "MEMORY INFO"
free -h

echo "DISK INFO"
df -h

