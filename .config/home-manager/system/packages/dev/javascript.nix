{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_20
    yarn
    nodePackages.pnpm
    sass
    vscode-langservers-extracted
    prettierd
    typescript
  ];
}
