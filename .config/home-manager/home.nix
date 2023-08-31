{ pkgs, ... }:

let dunstConf = pkgs.fetchgit {
  url = "https://github.com/catppuccin/dunst.git";
  rev = "a72991e";
  sha256 = "1LeSKuZcuWr9z6mKnyt1ojFOnIiTupwspGrOw/ts8Yk=";
};

in

{
  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "s1n7ax";
  home.homeDirectory = "/home/s1n7ax";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # rust alternatives
    bat
    difftastic
    ripgrep
    exa
    fd
    sd
    ripgrep
    starship
    skim
    cargo

    # other packages
    pavucontrol
    wl-clipboard
    nodejs_20
    (python3.withPackages(py-packages: with py-packages; [ pip ]))
    vifm
    ffmpeg_6-full
    gphoto2
    yt-dlp
    gcc
    neofetch
    axel
    blueman
    davinci-resolve
    easyeffects
    p7zip
    lazydocker
    unzip
    libsForQt5.gwenview

    # taking screenshots
    grim
    slurp
    xdg-utils

    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  home.file = {
    ".config/nvim".source = pkgs.fetchgit {
      url = "https://github.com/AstroNvim/AstroNvim";
      rev = "refs/tags/v3.36.3";
      sha256 = "olbsQuVs61i72JhzfR8utaBKCJ/2PB+bRxIR9mphNBM=";
      leaveDotGit = true;
    };

    ".config/wofi".source = pkgs.fetchgit {
      url = "https://github.com/s1n7ax/wofi-dracula-theme";
      rev = "4845865";
      hash = "sha256:1ji3g7q6y4n0sshfjca6bh9pymazp6c1l42j24ilk5bhzabz9j09";
    };

    ".config/vifm/colors".source = pkgs.fetchgit {
      url = "https://github.com/vifm/vifm-colors.git";
      rev = "refs/tags/v0.12";
      hash = "sha256:1lx1gylkl0x99zxiwv0h5qxizczzi655dcak89gj0sfz02p67h2c";
    };

    ".config/astronvim".source = pkgs.fetchgit {
      url = "https://github.com/s1n7ax/astronvim-dotnvim.git";
      rev = "9acaa8f";
      sha256 = "xa9ptHLowpz7MecbunzrgWaOstto5lsA3it9JJzK+70=";
      leaveDotGit = true;
    };
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/s1n7ax/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.wofi.enable = true;

  programs.git = {
    enable = true;
    difftastic = {
      enable = true;
      display = "inline";
    };

    userName = "s1n7ax";
    userEmail = "srineshnisala@gmail.com";

    extraConfig = {
      init = { defaultBranch = "main"; };
      pull = { rebase = true; };
      safe = { directory = [ "/etc/nixos" ]; };
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    # withNodeJs = true;
    # withPython3 = true;
  };

  programs.mpv = {
    enable = true;
    bindings = {
      i = "seek  5";
      m = "seek -5";
      e = "add volume 2";
      n = "add volume -2";
      "Ctrl++" = "add video-zoom 0.1";
      "Ctrl+-" = "add video-zoom -0.1";
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        scrollHeight = 1;
        skipNoStagedFilesWarning = true;
        showIcons = true;
      };
      git = {
        mainBranches = [ "main" ];
        disableForcePushing = true;
      };
      keybinding.universal = {
        prevItem = "e";
        nextItem = "n";
        "prevItem-alt" = "m";
        "nextItem-alt" = "i";

        nextMatch = "k";
        prevMatch = "K";
      };
    };
  };

  programs.zathura = {
    enable = true;
    mappings = {
      "f" = "toggle_fullscreen";
      "[fullscreen] f" = "toggle_fullscreen";

      "n" = "scroll down";
      "e" = "scroll up";
      "[fullscreen] n" = "scroll down";
      "[fullscreen] e" = "scroll up";

      "<C-n>" = "zoom out";
      "<C-e>" = "zoom in";
      "[fullscreen] <C-n>" = "zoom out";
      "[fullscreen] <C-e>" = "zoom in";
    };
    options = {
      font = "FiraCode";
      default-bg = "#1c1c1c";
      default-fg = "#e0e0e0";

      statusbar-fg = "#B0B0B0";
      statusbar-bg = "#202020";

      inputbar-bg = "#151515";
      inputbar-fg = "#FFFFFF";

      notification-error-bg = "#AC4142";
      notification-error-fg = "#151515";

      notification-warning-bg = "#AC4142";
      notification-warning-fg = "#151515";

      highlight-color = "#F4BF75";
      highlight-active-color = "#6A9FB5";

      completion-highlight-fg = "#151515";
      completion-highlight-bg = "#90A959";

      completion-bg = "#303030";
      completion-fg = "#E0E0E0";

      notification-bg = "#90A959";
      notification-fg = "#151515";

      recolor = "true";
      recolor-lightcolor = "#1f1f1f";
      recolor-darkcolor = "#E0E0E0";
      recolor-reverse-video = "true";
      recolor-keephue = "true";
    };
  };

  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override {
      withNerdIcons = true;
    };
  };

  programs.starship.enable = true;

  programs.obs-studio = {
    enable = true;
  };

  services.dunst = {
    enable = true;
    configFile = "${dunstConf}/src/macchiato.conf";
  };

  fonts.fontconfig.enable = true;

  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;

    associations.removed = {
      "image/jpeg" = [ "org.mozilla.firefox.desktop" "com.microsoft.Edge.desktop" ];
    };
    # associations.added = [];
    defaultApplications = {
      "image/jpeg" = [
        "gwenview"
      ];
      "application/pdf" = [
        "org.pwmt.zathura.desktop"
      ];
      "text/html" = [
        "org.mozilla.firefox.desktop"
      ];
      "text/xml" = [
        "org.mozilla.firefox.desktop"
			];
      "application/xhtml+xml" = [
        "org.mozilla.firefox.desktop"
			];
      "application/vnd.mozilla.xul+xml" = [
        "org.mozilla.firefox.desktop"
			];
      "text/mml" = [
        "org.mozilla.firefox.desktop"
			];
      "x-scheme-handler/http" = [
        "org.mozilla.firefox.desktop"
			];
      "x-scheme-handler/https" = [
        "org.mozilla.firefox.desktop"
			];
    };
  };
}
