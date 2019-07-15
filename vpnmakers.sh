#!/bin/bash

source ./.config

check_connection () {

    PID=$(ps -a | grep openconnect | cut -d' ' -f1)
    return $PID
}

if [ $# -gt 1 ]; then
    echo "wrong usage."
    echo "sudo ./vpnmakers.sh    --> for connection"
    echo "sudo ./vpnmakers.sh -d --> for disconnet"
    echo "sudo ./vpnmakers.sh -s --> to see status"
fi

if [ $# -eq 0 ]; then
    check_connection
    if [[ $? -eq '' ]]; then
        { echo $PASSWORD; echo 'yes';} | sudo openconnect --user=$USERNAME -b \
        --passwd-on-stdin $SERVER
    fi

fi

if [ $1 == '-d' ]; then
    check_connection
    PID=$?
    if [[ $PID -ne '' ]]; then
        sudo kill $PID
    fi
    echo 'disconnected'
fi
