{ config, pkgs, ... }:

{

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;
    dotDir = ".config/zsh";

    shellAliases = {
      ls = "exa --icons";
      cat = "bat";
      hms = "home-manager switch --flake ~/.nix#lukase@green-peril";
      nxs = "sudo nixos-rebuild switch --flake ~/.nix#";

    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };

  };

}
