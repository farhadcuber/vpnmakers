#!/bin/bash

source ./.config

get_PID () {
    PID=$(ps -a | grep openconnect | cut -d' ' -f2)
}

print_status () {

    get_PID
    echo $PID
    if [[ $PID -eq '' ]]; then
        echo 'disconnected'
    else
        echo 'connected'
    fi
}

if [ $# -gt 1 ]; then
    echo "wrong usage."
    echo "sudo ./vpnmakers.sh    --> for connection"
    echo "sudo ./vpnmakers.sh -d --> for disconnet"
    echo "sudo ./vpnmakers.sh -s --> to see status"
fi

if [ $# -eq 0 ]; then
    get_PID

    if [[ $? -eq '' ]]; then
        { echo $PASSWORD; echo 'yes';} | sudo openconnect --user=$USERNAME -b \
        --passwd-on-stdin $SERVER &> /dev/zero  
    fi

elif [ $1 == '-d' ]; then
    get_PID

    if [ -n '$PID' ]; then
        echo 'came here'
        echo $PID
        sudo kill $PID
    fi
fi

print_status
