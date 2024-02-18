{ pkgs, ... }:
let

  dunstConf = pkgs.fetchgit {
    url = "https://github.com/catppuccin/dunst.git";
    rev = "a72991e";
    sha256 = "1LeSKuZcuWr9z6mKnyt1ojFOnIiTupwspGrOw/ts8Yk=";
  };
in {

  services.dunst = {
    enable = true;
    configFile = "${dunstConf}/src/macchiato.conf";
  };
}
