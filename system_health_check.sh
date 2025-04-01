#!/bin/bash

# Get CPU Usage
cpu_idle=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $8}')
cpu_usage=$(echo "100 - $cpu_idle" | bc)

# Get Memory Usage
mem_total=$(free -m | grep "Mem | awk '{print $2}')
mem_used=$(free -m | grep "Mem" | awk '{print $3}')
mem_usage=$(echo "scale=2; $mem_used / $mem_total * 100" | bc )

# Get Current Date and Time
 timestamp=$(date +%Y-%m-%d %H:%M:%S")

# Generate Report
report="$timestamp - CPU Usage: $cpu_usage%, Memory Usage: $mem_usage%"

# Check Thresholds and Add Alerts
if (( $(echo "$cpu_usage > 80" | bc -1) )); then
	report="$report - ALERT: CPU usage above 80%!"
	fi
if (( $(echo "$mem_usage > 80" | bc -1) )); then
	report="$report - ALERT: Available memory below 20%! '
	fi
# Log Results
echo "$report" >> system_health.log
echo "System health check completed.Results logged to system_health.log"
