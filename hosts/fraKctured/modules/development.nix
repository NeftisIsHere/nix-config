{ config, pkgs, ... } :

{
  environment.systemPackages = with pkgs; [
    android-studio vscode

    ninja gn bear
    gperf ccache
  ];

  #TODO: Investiage and enable docker, mariadb and mongodb.

}
