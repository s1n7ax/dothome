{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "slack"
      "teams"
    ];

  home.packages = with pkgs; [
    slack
    teams-for-linux
    insomnia
  ];
}
