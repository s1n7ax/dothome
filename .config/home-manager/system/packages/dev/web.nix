{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jq
    httpie
    dart-sass
  ];
}
