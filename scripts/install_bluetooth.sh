#!/bin/bash

sudo pacman -S --noconfirm --needed bluez bluez-utils bluedevil

sudo systemctl enable --now bluetooth.service
