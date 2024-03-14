{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_21
    nodePackages.pnpm
    sass
    emmet-language-server
    vscode-langservers-extracted
    tailwindcss-language-server
    prettierd
    typescript
    nodePackages.typescript-language-server
  ];
}
