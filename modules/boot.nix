{ pkgs, ... }:

{
  # Bootloader
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
