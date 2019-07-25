# vpnmakers client
This is a vpnmakers.com client for linux.
It is based on openconnect and runs in background.

## Dependencies:
1. openconnect

## Setup:
1. Go to https://vpnmakers.com/cisco-linux and install openconnect.
2. Create a .config file in folder containing vpnmakers.sh.
3. Like .config_example file fill your user & pass & server.

## Usage:
For a new connection:   ```sudo ./vpnmakers.sh```<br />
To disconnect:          ```sudo ./vpnmakers.sh -d```<br />
For status:             ```sudo ./vpnmakers.sh -s```<br />