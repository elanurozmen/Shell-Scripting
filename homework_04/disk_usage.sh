#!/bin/bash

include_files=false
number=10

while getopts "an:" opt; do
    case $opt in
        a) include_files=true ;;
        n) number=$OPTARG ;;
        *) 
           echo "usage: disk_usage.sh [-a -n N] directory..."
           exit 1
           ;;
    esac
done

shift $((OPTIND - 1))

if [ $# -eq 0 ]; then
    echo "usage: disk_usage.sh [-a -n N] directory..."
    exit 1
fi

for dir in "$@"; do
    if [ "$include_files" = true ]; then
        du_output=$(du -ah "$dir" 2>/dev/null)
    else
        du_output=$(du -h --max-depth=1 "$dir" 2>/dev/null)
    fi

    echo "$du_output" | sort -hr | head -n "$number"
done
