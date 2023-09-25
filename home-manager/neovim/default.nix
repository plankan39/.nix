{ config, lib, pkgs, ... }:

let
  vimLua = lua: ''
    lua << EOF
    ${lua}
    EOF
  '';
in {
  home.packages = with pkgs; [ neovide graphviz ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

}


