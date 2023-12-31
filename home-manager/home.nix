# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./git.nix
    ./gnome.nix
    ./kitty.nix
    ./zsh.nix
    ./rbw.nix
    ./vscode.nix
    ./mako.nix
    ./neovim
    ./rofi
    ./waybar
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "lukase";
    homeDirectory = "/home/lukase";

    packages = with pkgs; [
      bitwarden
      spotify
      gnumake
      nodejs
      bat
      eza
      python3
      zlib
      pavucontrol
      webcord
      nixfmt
      zoom-us
      networkmanagerapplet
      zathura
      mpi
      hyprpaper
    ];

    sessionVariables = { EDITOR = "nvim"; };
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager
  programs.home-manager.enable = true;



  services.spotifyd = {
    enable = true;
    settings = {
      username = "lukas.elmlund@gmail.com";
      password = "uA@J4[M&Z?(Cf9j";
      device_name = "green-peril";
    };
  };


  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Blue-Dark";
      #package = pkgs.catppuccin-gtk;
      package = pkgs.catppuccin-gtk.override {
        accents = [ ];
        size = "compact";
        tweaks = [ "normal" ];
        variant = "macchiato";
      };
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };


  services.blueman-applet.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
