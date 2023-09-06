{ ... }:

{
  home.file = {
    ".config/nushell/modules".source = ./modules;
  };

  programs.nushell = {
    enable = true;

    # envFile.source = ./config/env.nu;
    # configFile.source = ./config/config.nu;
    extraConfig = ''
      use ~/.config/nushell/modules/utils.nu

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
      he = "utils open-editor ~/.config/home-manager";
      ne = "utils open-editor ~/.config/nvim";
      ae = "utils open-editor ~/.config/astronvim";

      # lazygit
      hn = "utils run-command-at 'lazygit' ~/.config/home-manager";
      nn = "utils run-command-at 'lazygit' ~/.config/nvim";
      an = "utils run-command-at 'lazygit' ~/.config/astronvim";

      # locations
      cdw = "cd ~/Workspace";
      cdn = "cd /etc/nixos";
    };
  };
}
