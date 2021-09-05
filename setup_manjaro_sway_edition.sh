#!/bin/sh

# CREATING TEMP DIRECTORY
mkdir $HOME/temp

# INSTALLING APPLICATIONS

sudo pacman -S --noconfirm pamac mpv vim
sudo pamac install --no-confirm code
sudo pamac build --no-confirm code-marketplace
sudo pamac build --no-confirm microsoft-edge-beta

curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
cd $HOME/temp
git clone https://aur.archlinux.org/1password.git
cd 1password
makepkg -si --noconfirm
cd

# INSTALLING NVM, NODE AND UTILITIES

sh -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh)"
nvm install node
npm install tldr
sudo pamac build --no-confirm angular-cli vercel
# INSTALLING ZSH CONFIGS

cd /usr/share/oh-my-zsh/custom/plugins
sudo git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

# INSTALLING FONTS

sudo wget -O $HOME/temp/FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip $HOME/temp/FiraCode.zip -d $HOME/temp/FiraCode
sudo mv $HOME/temp/FiraCode/* /usr/share/fonts/TTF/

# CLEANING UP
sudo rm -r $HOME/temp