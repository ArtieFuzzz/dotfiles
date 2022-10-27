#!/bin/bash

# This script installs Tailscale and Ufw (+ enables Ufw with the rules in ../ufw/tailscale.sh)

if [[ "$EUID" != 0 ]]
then
    echo "You must run this command as sudo..."
    exit
fi

echo "Setting up ArtieFuzzz/dotfiles"

apt-get update -y
apt-get upgrade -y

# Install essential packages and Utilities
apt-get install -y \
  zsh \
  build-essential \
  nano \
  neofetch \
  unzip \
  htop \
  apt-transport-https \
  ca-certificates \
  curl \ 
  gnupg \
  gpg \
  lsb-release \
  software-properties-common \
  tree \
  wget \
  curl \
  fontconfig \
  libssl-dev \
  git \
  ufw

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Execute tailscale.sh
curl -fsSL https://raw.githubusercontent.com/ArtieFuzzz/dotfiles/main/scripts/ufw/tailscale.sh | bash
  
# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  
# Install configurations

git clone https://github.com/ArtieFuzzz/dotfiles ~/.dotfiles

echo "Execute these commands to finish setting up!"
echo "\n"
echo "ln -s ~/.dotfiles/.zshrc ~/.zshrc"
echo "ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh"
echo "\n"
echo "And to finish setting up the Terminal:"

echo "chsh -s $(which zsh)"
echo "\n"

echo "Dotfiles configured!"
