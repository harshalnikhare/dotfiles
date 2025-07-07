#!/bin/bash

systemctl --user enable --now hypridle.service
systemctl --user enable --now hyprpaper.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now hyprsunset.service
systemctl --user enable --now waybar.service
systemctl --user enable --now xdg-desktop-portal-hyprland.service
