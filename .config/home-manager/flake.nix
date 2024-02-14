{
  description = "Home Manager configuration of s1n7ax";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-my.url = "github:s1n7ax/nix-flakes";
    devenv.url = "github:cachix/devenv";
  };

  outputs = { nixpkgs, nixpkgs-stable, nixpkgs-my, home-manager, devenv, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-stable = nixpkgs-stable.legacyPackages.${system};
      pkgs-my = nixpkgs-my.packages.${system};
      pkgs-devenv = devenv.packages.${system};
    in {
      homeConfigurations."s1n7ax" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          pkgs-devenv = pkgs-devenv;
          pkgs-my = pkgs-my;
          pkgs-stable = pkgs-stable;
        };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          ./scripts.nix
          ./hyprland.nix
          ./systemd.nix
          ./programs/zsh.nix
          ./programs/alacritty
          ./programs/nushell
        ];
      };
    };
}
