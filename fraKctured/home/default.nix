{ pkgs, ... }:
{
  imports = [
    ../../shared/shell/bash.nix
    #../../shared/ssh.nix
    ../../shared/git.nix
    ../../shared/desktop/dev
    ../../shared/desktop
  ];

  desktop.enable = true;

  home = {
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "25.05";

    packages = with pkgs;
      [
        # Desktop
        swww
        dunst
        libnotify
        brightnessctl
        grimblast
        fuzzel
        foot
        xwayland-satellite

        # Sound
        pwvucontrol
        pulseaudio

        # Networking
        networkmanagerapplet
        networkmanager

        # File managers
        xfce.thunar
        xfce.thunar-volman
        yazi
        gparted

        # Browser
        chromium
        firefox-wayland

        # Music
        youtube-music

        # Video
        ffmpeg
        vlc
        mpv
        obs-studio

        # Image
        imagemagick
        mupdf
        feh
        gimp
        satty

        # Social media
        vesktop
        bemoji

        # Bluetooth
        bluez
        blueman

        # Games
        lutris
        godot3
        steam
        appimage-run
        pokemmo-installer
        osu-lazer-bin
        prismlauncher

        ## Drivers/Requirements
        # meson
        wine
        winetricks
        wine-wayland
        # zlib
        # lego
        android-udev-rules
        android-studio

        # Miscs
        cpu-x
        marp-cli
      ]
      ## Install my custom scripts
      ++ (import ./../../shared/desktop/bin { inherit pkgs; });

    # For env var
    sessionVariables = {
      EDITOR = "nvim";
      NIX_AUTO_RUN = 1;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
