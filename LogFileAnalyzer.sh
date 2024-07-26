#!/bin/bash

logs_dir="/var/log/nginx"

logs() {
    local log_file=$1
    echo "Processing $log_file"

    echo -e "\nNumber of 404 Errors in $log_file:"
    grep ' 404 ' "$log_file" | wc -l

    if [[ "$log_file" == *access.log ]]; then
        echo -e "\nMost Requested Pages in $log_file:"
        awk '{print $7}' "$log_file" | sort | uniq -c | sort -nr | head -n 10
    fi

    echo -e "\nIP Addresses with the Most Requests in $log_file:"
    awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -n 10
}

logs "$logs_dir/access.log"
logs "$logs_dir/error.log"
