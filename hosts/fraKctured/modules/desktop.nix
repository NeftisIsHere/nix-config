{ config, pkgs, ... } :

{
  # Programs 
  programs.niri.enable = true;
  # programs.waybar.enable = true;
  # programs.starship.enable = true;
  programs.bash.enable = true;
  programs.seahorse.enable = true;

  fonts.packages = with pkgs; [
    corefonts
    dejavu_fonts
    font-awesome
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    noto-fonts-extra
    nerd-fonts.noto
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.hack
  ];

  environment.systemPackages = with pkgs; [
    # Main system
    swww
    cliphist
    bemoji
    waypaper
    xwayland-satellite
    wlogout
    swaynotificationcenter
    fuzzel

    # File manager
    nautilus
    code-nautilus
    loupe
    sushi

    # XDG and utility
    xdg-desktop-portal-gnome
    xdg-utils
    polkit_gnome
  ];

  users.defaultUserShell = pkgs.bash;
  security.polkit.enable = true;
}
