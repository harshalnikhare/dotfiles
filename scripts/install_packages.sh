#!/bin/bash

# Define the path to the package list
pkglist="$HOME/dotfiles/packages/pkglist.txt"

# Check if the package list file exists
if [[ ! -f "$pkglist" ]]; then
  echo "Package list file not found: $pkglist"
  exit 1
fi

# Install packages using yay
sudo pacman -S --needed --noconfirm - <"$pkglist"

echo "Packages installed from $pkglist."

################
# AUR PACKAGES #
################

# Define the path to the package list
aurpkglist="$HOME/dotfiles/packages/aur_pkglist.txt"

# Check if the package list file exists
if [[ ! -f "$aurpkglist" ]]; then
  echo "AUR Package list file not found: $pkglist"
  exit 1
fi

# Install packages using yay
yay -S --needed --noconfirm - <"$aurpkglist"

echo "AUR Packages installed from $aurpkglist."
