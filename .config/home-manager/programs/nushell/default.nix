{ pkgs, ... }:

{
  home.file = {
    ".config/nushell/modules".source = ./modules;
    ".config/nushell/scripts".source = pkgs.fetchgit {
      url = "https://github.com/nushell/nu_scripts.git";
      rev = "5ed3a961af0ea3dce24c36eae84580b4ec53fe35";
      sha256 = "eq6Drz7mSjB6GV5+uXJPYf2U27leaZQo5edfuzhTA0Q=";
      sparseCheckout = [
        "custom-completions/cargo"
        "custom-completions/git"
        "custom-completions/make"
        "custom-completions/nix"
        "custom-completions/npm"
        "custom-completions/pass"
        "custom-completions/yarn"
      ];
    };
  };

  programs.nushell = {
    enable = true;

    extraConfig = ''
      use ~/.config/nushell/modules/utils.nu

      use ~/.config/nushell/scripts/custom-completions/cargo/cargo-completions.nu *
      # use ~/.config/nushell/scripts/custom-completions/git/git-completions.nu *
      use ~/.config/nushell/scripts/custom-completions/make/make-completions.nu *
      use ~/.config/nushell/scripts/custom-completions/nix/nix-completions.nu *
      use ~/.config/nushell/scripts/custom-completions/npm/npm-completions.nu *
      use ~/.config/nushell/scripts/custom-completions/pass/pass-completions.nu *
      use ~/.config/nushell/scripts/custom-completions/yarn/yarn-completion.nu *

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
      cd = "z";
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
      nh = "utils open-editor ~/.config/home-manager";
      nn = "utils open-editor ~/.config/nvim";
      na = "utils open-editor ~/.config/astronvim";
      no = "utils open-editor ~/Notes";
      np = "utils open-editor (project-menu)";

      # lazygit
      lh = "utils run-command-at 'lazygit' ~/.config/home-manager";
      ln = "utils run-command-at 'lazygit' ~/.config/nvim";
      la = "utils run-command-at 'lazygit' ~/.config/astronvim";
      lo = "utils run-command-at 'lazygit' ~/Notes";
      lp = "utils run-command-at 'lazygit' (project-menu)";

      # locations
      cdw = "cd ~/Workspace";
      cdn = "cd /etc/nixos";
    };
  };
}
