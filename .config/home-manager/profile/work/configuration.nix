{ settings, ... }:
let
  package-settings = {
    dev = {
      c = true;
      container = true;
      java = false;
      javascript = true;
      lua = true;
      markdown = true;
      nix = true;
      python = false;
      rust = false;
      sh = true;
      toml = false;
      yaml = true;
      database = true;
      env = true;
      web = true;
      ide = false;
      multi-media = false;
    };

    camera = false;
    screen-capture = true;
    fonts = true;
    rust-alternatives = true;
    utility = true;
    terminal = true;
    players = false;
  };
in
{
  imports = [
    ./git.nix
    ./office-packages.nix

    (import ../../system/packages/default.nix { inherit settings package-settings; })
  ];

  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";
  home.stateVersion = "24.05";
}
