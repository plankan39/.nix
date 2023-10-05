{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.lineHeight" = 1.6;
      "editor.fontSize" = 12;
    };
  };

}
