{ config, pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    # envFile.source = ./config/env.nu;
    # configFile.source = ./config/config.nu;
    extraConfig = ''
      $env.config = {
        show_banner: false
      }
    '';

    environmentVariables = {
      WLR_NO_HARDWARE_CURSORS = "1"; # no cursor fix for wayland
      EDITOR = "nvim";
      TERM = "alacritty";
    };

    shellAliases = {
      # common apps
      n = "nvim";
      f = "vifm";
      lg = "lazygit";
      ld = "lazydocker";
      yt = "yt-dlp";

      # rust alternatives
      cat = "bat";
      ls = "exa -lg";
      l = "exa -lg";
      ll = "exa -lg";
      find = "fd";
      grep = "rg";
      fzf = "sk";

      # git
      g = "git";
      ga = "git add";
      gl = "git log --oneline";
      gla = "git log";
      gst = "git status";
      gp = "git pull";
      gP = "git push";
      gc = "git commit -m";
      gch = "git checkout";
      gb = "git branch";
      gd = "git diff";

      # edit
      he = "cd ~/.config/home-manager";
      ne = "cd /etc/nixos";
    };
  };
}
