#!/bin/bash
sudo apt-get update
echo "installing all building requirements"
sudo apt-get install ninja-build gettext cmake curl build-essential
echo "cloning into neovim repository"
git clone https://github.com/neovim/neovim ~/git/neovim
cd ~/git/neovim
echo "building neovim"
make CMAKE_BUILD_TYPE=RelWithDebInfo
echo "installing neovim"
cd build && cpack -G DEB && sudo dpkg -i nvim-linux-x86_64.deb
cd ~/git
echo "removing neovim repository"
rm -rf neovim
