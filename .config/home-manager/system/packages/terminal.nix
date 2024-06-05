{ pkgs, ... }:
{
  imports = [
    ../applications/alacritty
    ../applications/lazygit.nix
    ../applications/scripts.nix
    ../applications/starship.nix
    ../applications/zoxide.nix
    ../applications/zsh.nix
  ];

  home.packages = with pkgs; [ cosmic-term ];
}
