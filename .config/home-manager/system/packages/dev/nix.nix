{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixpkgs-fmt
    nil
    nixfmt-rfc-style
  ];
}
