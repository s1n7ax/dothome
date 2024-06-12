{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cargo
    cargo-leptos
    cargo-generate
    rust-analyzer
    stylance-cli
  ];
}
