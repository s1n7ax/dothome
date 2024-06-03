{ pkgs, ... }:
{
  imports = [ ../applications/obs-studio.nix ];
  home.packages = with pkgs; [
    grim
    slurp
  ];
}
