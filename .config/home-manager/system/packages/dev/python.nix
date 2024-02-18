{ pkgs, ... }: {
  home.packages = with pkgs; [
    (python3.withPackages (py-packages: with py-packages; [ pip ]))
    isort
    black
    virtualenv
  ];
}
