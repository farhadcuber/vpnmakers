#!/bin/bash

source ./.config

if [ $# -gt 1 ]; then
    echo "wrong usage."
    echo "sudo ./vpnmakers.sh    --> for connection"
    echo "sudo ./vpnmakers.sh -d --> for disconnet"
    echo "sudo ./vpnmakers.sh -s --> to see status"
fi
check_connection () {
    PID=$(ps -a | grep openconnect | cut -d' ' -f1)
    if [[ $PID -eq '' ]]; then
        echo 'not connected'
    else
        echo 'connected'
    fi
}

if [ $# -eq 0 ]; then
    check_connection
fi
