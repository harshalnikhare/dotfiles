_:

{
  # Disable global root daemon completely
  virtualisation.docker.enable = false;

  # Configure and enable Rootless Docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true; # Automatically points $DOCKER_HOST to your user socket

    # Force Docker daemon to use Btrfs storage driver rootlessly
    daemon.settings = {
      storage-driver = "btrfs";
    };
  };
}
