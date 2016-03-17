#!/bin/sh

#environment
export DISPLAY=:0 && export XAUTHORITY=/home/user/.Xauthority

#wallpaper dizini /usr/share/backgrounds 
gsettings set org.mate.background picture-filename $(ls /usr/share/backgrounds/*/*.jpg | shuf -n1)
