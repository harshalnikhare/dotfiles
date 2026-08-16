_:

{
  # Rootless Docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;

    daemon.settings = {
      storage-driver = "btrfs";
    };
  };

  # VirtualBox
  virtualisation.virtualbox.host.enable = true;

  # Allow user to access VirtualBox
  users.extraGroups.vboxusers.members = [ "harshaln" ];
}
