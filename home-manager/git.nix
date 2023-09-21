{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Lukas Elmlund";
    userEmail = "lukas.elmlund@gmail.com";

    extraConfig = {
      init = { defaultBranch = "main"; };
      pull = { rebase = false; };
    };
  };
}
