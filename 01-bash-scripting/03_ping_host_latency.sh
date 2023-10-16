#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Please provide exactly 1 argument!"
    exit 1
fi

latency=$(curl --silent --output /dev/null -w "%{time_total}\n" "$1")

echo "Latency for '$1' is $latency seconds"

