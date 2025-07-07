#!/bin/bash
sudo apt update
sudo apt install flatpak
# sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub rest.insomnia.Insomnia
flatpak install flathub io.github.realmazharhussain.GdmSettings
flatpak install flathub com.github.finefindus.eyedropper
flatpak install flathub com.valvesoftware.Steam

# for flatpak to show up in i3 rofi, do (symlink):
sudo ln -s /var/lib/flatpak/exports/bin/rest.insomnia.Insomnia.desktop /usr/bin/insomnia
sudo ln -s /var/lib/flatpak/exports/bin/io.github.realmazharhussain.GdmSettings.desktop /usr/bin/gmdsettings
sudo ln -s /var/lib/flatpak/exports/bin/com.github.finefindus.eyedropper.desktop /usr/bin/eyedropper
sudo ln -s /var/lib/flatpak/exports/bin/com.valvesoftware.Steam.desktop /usr/bin/steam
