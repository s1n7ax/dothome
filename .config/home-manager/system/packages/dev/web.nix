{ pkgs, ... }:
{
  home.packages = with pkgs; [
    httpie
    dart-sass
  ];
}
