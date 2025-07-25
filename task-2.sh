#!/bin/bash
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
mem_info=$(free | awk '/Mem:/ {printf("%.2f"), $7/$2 * 100}')
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
log="[$timestamp] CPU: ${cpu_usage}% | Free Mem: ${mem_info}%"

if (( $(echo "$cpu_usage > 80" | bc -l) )) || (( $(echo "$mem_info < 20" | bc -l) )); then
    echo "$log - ALERT" >> system_health.log
else
    echo "$log - OK" >> system_health.log
fi
