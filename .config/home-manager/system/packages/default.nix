{ settings, package-settings, ... }:
let
  get-pkg = name: if package-settings.${name} then [ ./${name}.nix ] else [ ];

  get-dev-pkg = name:
    if package-settings.dev.${name} then [ ./dev/${name}.nix ] else [ ];

  # other packaegs
  camera = get-pkg "camera";
  screen-capture = get-pkg "screen-capture";
  fonts = get-pkg "fonts";
  rust-alternatives = get-pkg "rust-alternatives";
  utility = get-pkg "utility";
  terminal = get-pkg "terminal";

  # dev packages
  env = get-dev-pkg "env";
  c = get-dev-pkg "c";
  container = get-dev-pkg "container";
  java = get-dev-pkg "java";
  javascript = get-dev-pkg "javascript";
  lua = get-dev-pkg "lua";
  markdown = get-dev-pkg "markdown";
  nix = get-dev-pkg "nix";
  python = get-dev-pkg "python";
  rust = get-dev-pkg "rust";
  sh = get-dev-pkg "sh";
  toml = get-dev-pkg "toml";
  yaml = get-dev-pkg "yaml";
  database = get-dev-pkg "database";

in {

  imports = [
    ../applications/mpv.nix
    # ../applications/systemd.nix
  ]
  # shell
    ++ [
      ../applications/${settings.shell}.nix
    ]

    # wm
    ++ [
      ../applications/${settings.wm}.nix
    ]

    # dev packages
    ++ c ++ container ++ java ++ javascript ++ lua ++ markdown ++ nix ++ python
    ++ rust ++ sh ++ toml ++ yaml ++ database

    # other packaegs
    ++ camera ++ screen-capture ++ fonts ++ rust-alternatives ++ utility
    ++ terminal;
}
