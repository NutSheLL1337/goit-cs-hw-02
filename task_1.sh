#!/bin/bash

websites=("https://google.com" "https://facebook.com" "https://twitter.com")

log_file="website_status.log"

> "$log_file"

for site in "${websites[@]}"; do
    status_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$site")
    
    # Перевірка статусу
    if [ "$status_code" -eq 200 ]; then
        echo "$site is UP" | tee -a "$log_file"
    else
        echo "$site is DOWN (HTTP status: $status_code)" | tee -a "$log_file"
    fi
done

echo "Results have been written to $log_file"