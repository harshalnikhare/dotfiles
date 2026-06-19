{ pkgs, ... }:

{
  # Fonts
  # Configure and install system fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
