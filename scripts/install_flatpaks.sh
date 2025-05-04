#!/bin/bash

# Define the path to the Flatpak list file
flatpaklist="$HOME/dotfiles/packages/flatpaklist.txt"

# Check if the Flatpak list file exists
if [[ ! -f "$flatpaklist" ]]; then
  echo "Flatpak list file not found: $flatpaklist"
  exit 1
fi

# Install Flatpak applications from the list
while IFS= read -r app; do
  # Check if the application is already installed
  if flatpak list | grep -q "$app"; then
    echo "$app is already installed, skipping."
  else
    echo "Installing $app..."
    flatpak install -y "$app"
  fi
done <"$flatpaklist"

echo "Finished processing Flatpak applications from $flatpaklist."
