#!/bin/bash

sudo pacman -S --noconfirm --needed tlp

sudo systemctl enable --now tlp.service
