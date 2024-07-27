{ settings, ... }:
let
  package-settings = {
    dev = {
      c = true;
      container = true;
      java = true;
      javascript = true;
      lua = true;
      markdown = true;
      nix = true;
      python = true;
      rust = true;
      sh = true;
      toml = true;
      yaml = true;
      database = true;
      env = true;
      web = true;
    };

    camera = true;
    screen-capture = true;
    fonts = true;
    rust-alternatives = true;
    utility = true;
    terminal = true;
    players = true;
  };
in
{
  imports = [
    ./git.nix
    (import ../../system/packages/default.nix { inherit settings package-settings; })
  ];

  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";
  home.stateVersion = "24.05";
}
