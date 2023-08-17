{ config, pkgs, ... }:

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

    # taking screenshots
    grim
    slurp

    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/nvim".source = pkgs.fetchFromGitHub {
      owner = "AstroNvim";
      repo = "AstroNvim";
      rev = "refs/tags/v3.36.0";
      hash = "sha256:0k1sw72x1r0vbsggpncykdf1x4qmm8h4ghdipkc7km14x4s5c9xv";
      fetchSubmodules = true;
      leaveDotGit = true;
    };

    ".config/wofi".source = pkgs.fetchgit {
      url = "https://github.com/s1n7ax/wofi-dracula-theme";
      rev = "4845865";
      hash = "sha256:1ji3g7q6y4n0sshfjca6bh9pymazp6c1l42j24ilk5bhzabz9j09";
      sparseCheckout = [ "style.css" ];
      deepClone = false;
    };

    ".config/vifm/colors".source = pkgs.fetchgit {
      url = "https://github.com/vifm/vifm-colors.git";
      rev = "refs/tags/v0.12";
      hash = "sha256:1lx1gylkl0x99zxiwv0h5qxizczzi655dcak89gj0sfz02p67h2c";
    };
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
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

  fonts.fontconfig.enable = true;
}
