#!/bin/bash

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
  lsb-release \
  software-properties-common \
  tree \
  wget \
  curl \
  fontconfig \
  libssl-dev \
  git
  
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
