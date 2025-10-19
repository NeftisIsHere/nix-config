{ config, pkgs, ... }:
let
  smlk = config.lib.file.mkOutOfStoreSymlink;
in
{
  imports = [
    ./modules/applications/swaync.nix
  ];
  home.username = "jazz";
  home.homeDirectory = "/home/jazz";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  home.file = {
    ".config/foot".source = smlk "/home/jazz/.dotfiles/.config/foot";
    ".config/waybar".source = smlk "/home/jazz/.dotfiles/.config/waybar";
    ".config/fastfetch".source = smlk "/home/jazz/.dotfiles/.config/fastfetch";
    ".config/mpd".source = smlk "/home/jazz/.dotfiles/.config/mpd";
    ".config/rmpc".source = smlk "/home/jazz/.dotfiles/.config/rmpc";
    ".config/fuzzel".source = smlk "/home/jazz/.dotfiles/.config/fuzzel";
    ".config/niri".source = smlk "/home/jazz/.dotfiles/.config/niri";
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      ".." = "cd ..";
      "ls" = "eza --icons --group-directories-first --almost-all";
      "home-switch" = "home-manager switch --flake ~/nix-config#jazz";
      "nix-switch" = "sudo nixos-rebuild switch --flake ~/nix-config#fraKctured";
    };
  };
  programs.eza = {
    enable = true;
    icons = "auto";
    enableBashIntegration = true;
    git = true;
  };
  programs.waybar = {
    enable = true;
  };
  programs.yazi.enable = true;
  programs.starship.enable = true;
  
  programs.home-manager.enable = true;
}
