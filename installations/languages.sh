#!/bin/bash
sudo apt-get update
sudo apt-get install luarocks golang nodejs python3-venv

echo "typescript"
sudo apt-get install npm
sudo npm install -g typescript

echo "golang"
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm
gvm install go1.24.4
gvm use 1.24.4 --default

echo "rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

echo "python 3.13"
wget https://www.python.org/ftp/python/3.13.0/Python-3.13.0.tgz -P ~/tmp
cd ~/tmp
tar xzf Python-3.13.0.tgz
cd Python-3.13.0
./configure --enable-optimizations
make -j 4
sudo make altinstall
