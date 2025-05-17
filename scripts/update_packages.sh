#! /bin/bash

sudo pacman -S --noconfirm --needed \
	stow \
	tmux \
	fzf \
	zoxide \
	fastfetch \
	fd \
	firefox \
	flatpak \
	ghostty \
	grub-btrfs \
	htop \
	imagemagick \
	inotify-tools \
	lazygit \
	luarocks \
	man-db \
	neovim \
	stow \
	timeshift \
	tldr \
	ttf-meslo-nerd \
	unzip \
	wget \
	wl-clipboard

yay -S --noconfirm --needed \
	timeshift-autosnap \
	mullvad-vpn

flatpak install flathub org.keepassxc.KeePassXC
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub org.videolan.VLC
flatpak install flathub com.google.Chrome
flatpak install flathub org.kde.okular
flatpak install flathub org.qbittorrent.qBittorrent
