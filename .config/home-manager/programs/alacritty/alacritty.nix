{ config, pkgs, ... }:

{
  home.file = {
    ".config/alacritty".source = ./config;
  };

  programs.alacritty.enable = true;
}
