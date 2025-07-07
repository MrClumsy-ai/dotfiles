#!/bin/bash
sudo apt-get update
sudo apt-get install zsh
sudo chsh -s $(which zsh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
