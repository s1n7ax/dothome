{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_21
    nodePackages.pnpm
    sass
    vscode-langservers-extracted
    tailwindcss-language-server
    prettierd
    typescript
  ];
}
