{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    backgroundColor = "#303446";
    borderColor = "#8caaee";
    progressColor ="over #414559";
    textColor = "#c6d0f5";
    icons = true;
  };

}
