{ config, pkgs, ... } :

{
  programs.steam = {
    enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    lutris wine-staging
    mangohud goverlay
    qbittorrent

    protonup-qt
  ];
}
