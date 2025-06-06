#!/usr/bin/env bash
FILE="$HOME/.config/polybar/scripts/rofi/colors.rasi"
sed -i -e "s/ac: .*/ac:   #FFAF00FF;/g" $FILE
sed -i -e "s/se: .*/se:   #FFAF0040;/g" $FILE
rofi -no-lazy-grab -show drun -modi drun
