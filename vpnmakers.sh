#!/bin/bash

source ./.config

get_PID () {
    #ps -a | grep openconnect | cut -d' ' -f2
    PID=$(ps -a | grep openconnect | cut -d' ' -f2)
    
    if [ -z "$PID" ]; then
        PID=0
    fi
}

print_status () {

    get_PID
    
    if [ "$PID" == 0 ]; then
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

    if [ "$PID" == 0 ]; then
        { echo $PASSWORD; echo 'yes';} | sudo openconnect --user=$USERNAME -b \
        --passwd-on-stdin $SERVER &> /dev/zero  
    fi

elif [ $1 == '-d' ]; then
    get_PID

    if [ "$PID" != 0 ]; then
        sudo kill $PID
    fi
fi

sleep 1
print_status
