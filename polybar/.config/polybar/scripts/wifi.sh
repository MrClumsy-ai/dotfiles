#!/usr/bin/env bash

dir="~/.config/polybar/scripts/rofi"
wifi_list=$(nmcli -t -f SSID,BARS dev wifi)
rofi_command="rofi"
chosen="$(echo -e "$wifi_list" | $rofi_command -p "Select Wi-Fi" -dmenu -selected-row 0)"
ssid=$(echo "$chosen" | cut -d':' -f1)

if [ -n "$ssid" ]; then
    password=$($rofi_command -dmenu -p "Password for $ssid")
    if [ -n "$password" ]; then
        nmcli dev wifi connect "$ssid" password "$password" | \
            notify-send "Wi-Fi" "Connecting to $ssid..."
    else
        notify-send "Wi-Fi" "No password entered."
    fi
fi
