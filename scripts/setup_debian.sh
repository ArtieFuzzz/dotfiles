#!/bin/bash

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
  libssl-dev
  
# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  
# Install configurations

git clone https://github.com/ArtieFuzzz/dotfiles ~/.dotfiles

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

# Make ZSH the default shell
chsh -s $(which zsh)

echo "Dotfiles configured!"
