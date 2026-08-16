_:

{
  # Disable global root daemon completely
  virtualisation.docker.enable = false;

  # Configure and enable Rootless Docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true; # Automatically points $DOCKER_HOST to your user socket

    # Enable virtual box
    virtualisation.virtualbox.host.enable = true;

    users.extraGroups.vboxusers.members = [ "harshaln" ];

    # Force Docker daemon to use Btrfs storage driver rootlessly
    daemon.settings = {
      storage-driver = "btrfs";
    };
  };
}
