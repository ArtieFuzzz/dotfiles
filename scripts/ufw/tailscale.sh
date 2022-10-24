#!/bin/sh

if [[ "$EUID" != 0 ]]
then
    echo "You must run this command as sudo..."
    exit
fi

if ! command -v ufw &> /dev/null
then
    echo "ufw is not installed"
    echo "use 'sudo apt-get install ufw' to install ufw"
    exit
fi

ufw allow in on tailscale0
ufw allow 41641/udp
ufw reload

echo "If ufw is not already enabled...\nufw enable"

