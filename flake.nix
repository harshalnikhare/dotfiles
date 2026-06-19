{
  description = "harshalnikhare NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

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
      zen-browser,
    }@inputs:
    {
      nixosConfigurations.slaptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # This line passes all inputs (including zen-browser) into your modules!
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/laptop/configuration.nix

          # ./modules/tmux.nix
          # ./modules/conty.nix
        ];
      };
    };
}
