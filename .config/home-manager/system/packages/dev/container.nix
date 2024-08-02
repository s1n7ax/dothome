{
  pkgs,
  pkgs-devenv,
  pkgs-my,
  ...
}:
{

  home.packages = with pkgs; [
    pkgs-devenv.devenv
    pkgs-my.devcontainer
    lazydocker
    dockerfile-language-server-nodejs
    hadolint
  ];
}
