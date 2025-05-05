# DOTFILES

---

## Install git

```bash
sudo pacman -S --noconfirm git firefox stow
```

```bash
git clone https://github.com/harshalnikhare/dotfiles
```

---

## copy dotfiles

```bash
cd dotfiles && stow zsh ghostty tmux && cd
```

---

## yay setup

```bash
sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd
```

---

## Configure btrfs auto snaps

1. Follow [these](https://discovery.endeavouros.com/encrypted-installation/btrfs-with-timeshift-snapshots-on-the-grub-menu/2022/02/) steps
2. Reboot & verify

---

## Configure bluetooth

```bash
./$HOME/dotfiles/scripts/install_bluetooth.sh
```

---

## Install required packages

```bash
chmod +x $HOME/dotfiles/scripts/*
$HOME/dotfiles/scripts/install_packages.sh
$HOME/dotfiles/scripts/install_flatpaks.sh
```

---

## Install and setup zsh

```bash
$HOME/dotfiles/scripts/install_zsh.sh
```

---

## Configure tlp

```bash
$HOME/dotfiles/scripts/install_tlp.sh
```

---

## Install nvm

1. Install below script

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

2. Restart terminal
3. Install latest lts

```bash
nvm install -lts
```

2. Install global packages

```bash
npm i -g neovim
```

---

## Configure tmux

1. Install tpm

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. Run the following

```bash
tmux
```

```bash
tmux source ~/.config/tmux/tmux.conf
```

3. Then run Ctrl + A & shift i

---

## Install and setup neovim

1. Install [lazyvim](https://www.lazyvim.org/installation)
2. install required lazy packages
3. Transparent tokyonight
   - create a file in config/nvim/lua/plugins/transparent-tokyonight.lua & add the following content

```lua
return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
```

---
