{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
    nodePackages.pnpm
    yarn
    emmet-language-server
    vscode-langservers-extracted
    tailwindcss-language-server
    prettierd
    typescript
    eslint_d
    nodePackages.typescript-language-server
  ];
}
