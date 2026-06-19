#!/usr/bin/env bash

TPM_DIR="/home/harshaln/.tmux/plugins/tpm"

if [ ! -d "$TPM_DIR" ]; then
  mkdir -p "$(dirname "$TPM_DIR")"
  ${pkgs.git}/bin/git clone \
    https://github.com/tmux-plugins/tpm \
    "$TPM_DIR"
fi

