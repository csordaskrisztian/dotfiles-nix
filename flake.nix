{
  description = "flek :)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    hypridle.url = "github:hyprwm/hypridle";
    helix.url = "github:helix-editor/helix/master";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    theme = import ./themes/everblush.nix;
    pkgs = import nixpkgs {
      inherit system;
      config.allowunfree = true;
    };
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [./hosts/laptop];
      };
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [./hosts/desktop];
      };
    };

    homeConfigurations."krisz" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs theme;};
      modules = [./home/home.nix];
    };
  };
}
