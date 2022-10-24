#!/bin/sh

# This script locks down the server so only Tailscale connections are allowed
# USE THIS SCRIPT WITH CAUTION AS IT MAY LOCK YOU OUT OF YOUR SERVER

if [[ "$EUID" != 0 ]]
then
    echo "You must run this command as sudo..."
    exit
fi

if ! command -v tailscale &> /dev/null
then
    echo "Tailscale is not installed on this system..."
    echo "Setup Tailscale: https://tailscale.com/download"
    exit
fi

curl -s https://raw.githubusercontent.com/ArtieFuzzz/dotfiles/main/scripts/ufw/tailscale.sh | bash

ufw default deny incoming
ufw default allow outgoing
ufw reload

echo "Locked down server!"
echo "To unlock:\n"
echo "ufw default allow incoming"