{ pkgs, ... }:
{
  home.packages = with pkgs; [
    postgresql
    sqlite
  ];
}
