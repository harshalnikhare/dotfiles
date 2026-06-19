{ pkgs, inputs, ... }:

{
  users.users.harshaln.packages = with pkgs; [
    kdePackages.kate
    curl
    wget
    unzip
    neovim
    git
    zsh
    lazygit
    luaPackages.tree-sitter-cli
    tree-sitter
    gcc
    fzf
    ripgrep
    fd
    luarocks
    go
    cargo
    ruby
    php
    nodejs
    python3
    ghostty
    imagemagick
    ghostscript
    tectonic
    mermaid-cli
    lua
    keepassxc
    syncthing
    statix
    nixfmt
    fastfetch
    btop
    stow
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    proton-vpn
    tmux
    tmuxPlugins.tmux-fzf
    tree
    bat
    zoxide
    tldr
    jq
    gamemode
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Enable Zsh
  programs.zsh = {
    enable = true;
    # 1. Native NixOS toggles to automatically fetch and inject the external plugins
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # Enable Oh My Zsh and plugins
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };

    # Custom keybinding for autosuggestions (Ctrl + Space)
    interactiveShellInit = ''
      	    bindkey '^ ' autosuggest-accept
      	  '';

    shellAliases = {
      n = "nvim";
      tmux = "tmux -u";
    };
  };

  environment.shells = with pkgs; [ zsh ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

}
