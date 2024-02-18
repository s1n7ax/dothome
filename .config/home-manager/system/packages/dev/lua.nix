{ pkgs, ... }: {
  home.packages = with pkgs; [

    stylua
    lua-language-server
    luajitPackages.luacheck
  ];
}
