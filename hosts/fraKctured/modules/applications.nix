{ config, pkgs, ...}:

{
  # For default, DE agnostic applications

  environment.systemPackages = with pkgs; [
    # Terminal
    foot
    fastfetch
    pywal16
    colorz
    imagemagick
    tmux
    yazi

    # Theme
    bibata-cursors

    # GUI
    firefox
    vscode
    qbittorrent
    vlc
    mpv
    mpvScripts.mpris
    legcord
    onlyoffice-bin
    nicotine-plus
    solaar
  ];
}
