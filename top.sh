#!/bin/bash

echo "Set PID: "
read pid

while [ 1 ]
do
    date
    echo "Binary:  `ls -lah /proc/$pid/exe | cut -d' ' -f11`"
    echo "Owner:  `ls -lah /proc/$pid/exe | cut -d' ' -f3`"
    echo "Memory usage in kB:  `cat /proc/$pid/status | grep VmSize | cut -d':' -f2`"
    sleep 5
done
