#!/bin/bash

YAY_DIR="/home/$USER/yay"

sudo pacman -S --needed --noconfirm git base-devel

git clone https://aur.archlinux.org/yay.git "$YAY_DIR"

cd "$YAY_DIR" || { echo "Failed to change directory to $YAY_DIR"; exit 1; }

makepkg -si --noconfirm

cd

echo "yay has been installed successfully."
