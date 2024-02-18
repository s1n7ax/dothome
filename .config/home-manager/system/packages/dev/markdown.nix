{ pkgs, ... }: {
  home.packages = with pkgs; [
    cbfmt
    marksman
    markdownlint-cli
    markdownlint-cli2
    python311Packages.mdformat
  ];
}
