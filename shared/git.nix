{ lib, config, ... }:

with lib;
{
  programs.git = {
    enable = true;
    user.name = "Jazmin Vallejos";
    user.email = "jazmin.irene.cc@gmail.com";
  };
}
