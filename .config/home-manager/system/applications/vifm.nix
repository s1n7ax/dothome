{ pkgs, ... }: {
  home.file = {
    ".config/vifm/colors".source = pkgs.fetchgit {
      url = "https://github.com/vifm/vifm-colors.git";
      rev = "refs/tags/v0.12";
      hash = "sha256:1lx1gylkl0x99zxiwv0h5qxizczzi655dcak89gj0sfz02p67h2c";
    };
  };
}
