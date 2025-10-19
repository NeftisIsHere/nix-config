{ config, pkgs, ...}:

{
  # For default, DE agnostic applications

  environment.systemPackages = with pkgs; [
    foot
    fastfetch
    pywal16
    colorz
    imagemagick
    tmux

    bibata-cursors

    firefox
    vscode
    qbittorrent
    vlc
    mpv
    mpvScripts.mpris
    legcord
    onlyoffice-bin
  ];
}
