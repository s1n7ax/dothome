{ pkgs, ... }: {

  programs.wofi.enable = true;

  home.file = {
    ".config/wofi".source = pkgs.fetchgit {
      url = "https://github.com/s1n7ax/wofi-dracula-theme";
      rev = "4845865";
      hash = "sha256:1ji3g7q6y4n0sshfjca6bh9pymazp6c1l42j24ilk5bhzabz9j09";
    };

  };
}
