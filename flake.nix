{
  description = "harshalnikhare NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Zen browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs";
        # home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      unstable,
      zen-browser,
    }@inputs:
    let
      system = "x86_64-linux";

      unstablePkgs = import unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.slaptop = nixpkgs.lib.nixosSystem {
        inherit system;

        # This line passes all inputs (including zen-browser) into your modules!
        specialArgs = { inherit inputs unstablePkgs; };

        modules = [
          ./hosts/laptop/configuration.nix

          # Boot
          ./modules/boot.nix

          # Networking
          ./modules/networking.nix

          # Locale
          ./modules/locale.nix

          # Services & Security
          ./modules/services.nix

          # Fonts
          ./modules/fonts.nix

          # Users
          ./modules/users.nix

          # Packages & programs
          ./modules/packages.nix

          # Nix and garbage collection
          ./modules/nix.nix
        ];
      };
    };
}
