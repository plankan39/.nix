{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.lineHeight" = 1.6;
      "editor.fontSize" = 12;
      "workbench.colorTheme" = "Catppuccin Macchiato";
    };
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc-icons
      catppuccin.catppuccin-vsc
      usernamehw.errorlens
      ms-python.isort
      ms-python.python
      njpwerner.autodocstring
    ];
  };

}
