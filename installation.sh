#!/usr/bin/env bash

cp -r .xmonad ~/ &
cp -r .xmobar ~/.config/ &
cp -r macchina ~/ &
cp .Xresources ~/ &

sudo pacman -S --needed git hsetroot xmonad xmobar xmonad-contrib vim &

sudo cp xorg.conf.d /etc/X11/ &

