#!/bin/bash

MY_PATH="`dirname \"$0\"`"
source $MY_PATH/.config

## Return PID of running openconnect
get_PID () {
    
    PID=$(ps -a | grep openconnect | cut -d' ' -f1)
    
    if [ -z "$PID" ]; then
        PID=0
    fi
}

## Print the status of VPN
print_status () {

    get_PID
    
    if [ "$PID" == 0 ]; then
        echo 'disconnected'
    else
        echo 'connected'
    fi
}

## Check arguments.
if [ $# -gt 1 ]; then
    echo "wrong usage."
    echo "sudo ./vpnmakers.sh    --> for connection"
    echo "sudo ./vpnmakers.sh -d --> for disconnet"
    echo "sudo ./vpnmakers.sh -s --> to see status"
fi

## Connection
if [ $# -eq 0 ]; then
    get_PID

    if [ "$PID" == 0 ]; then
        { echo $PASSWORD; echo 'yes';} | sudo openconnect --user=$USERNAME -b \
        --passwd-on-stdin $SERVER &> /dev/zero  
    fi

## Disconnection
elif [ $1 == '-d' ]; then
    get_PID

    if [ "$PID" != 0 ]; then
        sudo kill $PID
    fi
fi

## Finally Show Status
sleep 1
print_status
