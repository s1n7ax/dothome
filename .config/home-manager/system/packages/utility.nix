{ pkgs, ... }:
{
  imports = [
    ../applications/dunst.nix
    ../applications/home-manager.nix
    ../applications/vifm.nix
    ../applications/fuzzel.nix
    ../applications/xdg.nix
    ../applications/zathura.nix
    ../applications/neovim.nix
    ../applications/font.nix
  ];

  home.packages = with pkgs; [

    # file managers
    xfce.thunar
    xfce.tumbler
    vifm

    # audio controls
    pavucontrol
    easyeffects

    # browsers
    firefox
    ladybird

    #bluetooth
    blueman

    # downloaders
    axel
    yt-dlp

    # compress de-compress
    p7zip
    unzip

    # sync
    rclone
    sshfs

    # image
    ffmpeg_6-full
    nsxiv
    libsForQt5.gwenview

    # other
    wl-clipboard
    trash-cli
    appimage-run
    xdg-utils
  ];
}
