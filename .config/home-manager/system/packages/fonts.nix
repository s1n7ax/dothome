{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
        "CascadiaCode"
        "CodeNewRoman"
      ];
    })
    maple-mono-NF
  ];
}
