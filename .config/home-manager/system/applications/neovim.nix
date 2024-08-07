{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  home.packages = with pkgs; [ luajitPackages.luarocks ];
  home.file.".config/nvim/.luarc.json".text = ''
    {
      "workspace.library": [
        "${pkgs.neovim}/share/nvim/runtime/lua",
        "''${3rd}/luv/library",
        "/home/s1n7ax/.config/nvim/lua",
        "/home/s1n7ax/Workspace/lua-async-await/lua",
        "/home/s1n7ax/Workspace/nvim-java-core/lua",
        "/home/s1n7ax/Workspace/nvim-java-dap/lua",
        "/home/s1n7ax/Workspace/nvim-java-test/lua",
        "/home/s1n7ax/Workspace/nvim-java-refactor/lua",
        "/home/s1n7ax/Workspace/neotest-jdtls/lua",
        "/home/s1n7ax/Workspace/nvim-java/lua",
        "/home/s1n7ax/Workspace/nvim-snips/lua",
        "/home/s1n7ax/Workspace/nvim-window-picker/lua",
        "/home/s1n7ax/.local/share/nvim/lazy/nui.nvim/lua"
      ]
    }
  '';
}
