{
  description = "Home Manager configuration of s1n7ax";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-my.url = "github:s1n7ax/nix-flakes";
    devenv.url = "github:cachix/devenv";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      nixpkgs-my,
      home-manager,
      devenv,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-stable = nixpkgs-stable.legacyPackages.${system};
      pkgs-my = nixpkgs-my.packages.${system};
      pkgs-devenv = devenv.packages.${system};

      #--------------------------------------------------------------------#
      #                              OVERLAYS                              #
      #--------------------------------------------------------------------#
      overlays = [ inputs.neovim-nightly-overlay.overlays.default ];

      #--------------------------------------------------------------------#
      #                              SETTINGS                              #
      #--------------------------------------------------------------------#
      settings = {
        profile = "desktop";
        username = "s1n7ax";
        shell = "zsh";
        wm = "hyprland";
      };
    in
    {
      homeConfigurations = {
        desktop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            { nixpkgs.overlays = overlays; }
            ./profile/desktop/configuration.nix
          ];

          extraSpecialArgs = {
            inherit
              pkgs-devenv
              pkgs-my
              pkgs-stable
              settings
              ;
          };
        };

        work = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            { nixpkgs.overlays = overlays; }
            ./profile/work/configuration.nix
          ];

          extraSpecialArgs = {
            inherit
              pkgs-devenv
              pkgs-my
              pkgs-stable
              settings
              ;
          };
        };
      };
    };
}
