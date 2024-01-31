{ pkgs, pkgs-my, pkgs-devenv, ... }:

let
  dunstConf = pkgs.fetchgit {
    url = "https://github.com/catppuccin/dunst.git";
    rev = "a72991e";
    sha256 = "1LeSKuZcuWr9z6mKnyt1ojFOnIiTupwspGrOw/ts8Yk=";
  };

in {
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
    eza
    fd
    sd
    ripgrep
    starship
    skim
    zellij

    # other packages
    pavucontrol
    wl-clipboard
    nodejs_20
    (python3.withPackages (py-packages: with py-packages; [ pip ]))
    virtualenv
    vifm
    ffmpeg_6-full
    gphoto2 # camera connect
    yt-dlp
    gcc
    neofetch
    axel # wget but in multi-connection
    blueman
    easyeffects
    p7zip
    lazydocker
    unzip
    libsForQt5.gwenview
    rclone
    sshfs
    nsxiv # image viewer
    appimage-run
    rustup
    cargo-leptos
    cargo-generate
    sass
    jdk17
    gnumake
    firefox
    ungoogled-chromium
    neovide
    cosmic-term
    trash-cli
    pkgs-devenv.devenv

    pkgs-my.davinci-resolve
    pkgs-my.devcontainer

    # neovim stuff
    stylua
    lua-language-server
    prettierd
    nixpkgs-fmt
    marksman
    shfmt
    python311Packages.mdformat
    cbfmt
    markdownlint-cli
    markdownlint-cli2
    nixfmt
    black
    isort
    luajitPackages.luacheck
    nil
    astyle

    # taking screenshots
    grim
    slurp
    xdg-utils

    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];

  home.file = {
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
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = false;
    enableZshIntegration = true;
    enableFishIntegration = false;
  };
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
      keybinding = {
        universal = {
          prevItem = "e";
          nextItem = "n";
          prevBlock = "m";
          nextBlock = "i";

          nextMatch = "k";
          prevMatch = "K";
          edit = "E";
        };

        files = { ignoreFile = "I"; };

        branches = { viewGitFlowOptions = "I"; };

        submodules = { init = "I"; };
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
    package = pkgs.nnn.override { withNerdIcons = true; };
  };

  programs.starship.enable = true;

  programs.obs-studio = { enable = true; };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  services.dunst = {
    enable = true;
    configFile = "${dunstConf}/src/macchiato.conf";
  };

  fonts.fontconfig.enable = true;

  xdg = {
    userDirs.enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;

      associations.removed = {
        "image/png" = [
          "firefox.desktop"
          "org.mozilla.firefox.desktop"
          "com.microsoft.Edge.desktop"
        ];
      };
      defaultApplications = let
        image_viewers = [ "nsxiv.desktop" "org.kde.gwenview.desktop" ];
        web_content = [ "firefox.desktop" "org.mozilla.firefox.desktop" ];
      in {
        "image/png" = image_viewers;
        "image/jpeg" = image_viewers;
        "image/webp" = image_viewers;
        "application/pdf" = [ "org.pwmt.zathura.desktop" ];

        # web content
        "text/html" = web_content;
        "text/xml" = web_content;
        "application/xhtml+xml" = web_content;
        "application/vnd.mozilla.xul+xml" = web_content;
        "text/mml" = web_content;
        "x-scheme-handler/http" = web_content;
        "x-scheme-handler/https" = web_content;
      };
    };
  };

}
