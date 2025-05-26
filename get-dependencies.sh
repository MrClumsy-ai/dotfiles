#! /bin/bash

echo "hello epic gamer"
echo "updating your epic gaming pc"
sudo apt update && sudo apt upgrade -y && \
sudo apt autoremove && sudo apt-get update -y
echo ""
echo ""
echo "installing allat"
echo ""
echo ""
sudo apt-get install ninja-build gettext cmake \
curl build-essential nodejs npm golang git pip \
libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python3-openssl \
binutils bison gcc ripgrep zsh neofetch unzip fzf tmux \
flatpak gnome-software-plugin-flatpak copyq i3 feh dmenu \
picom xinput polybar brightnessctl stow python3-venv zip
echo "ig this is it gng..."
