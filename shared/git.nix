{ lib, config, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Jazmin Vallejos";
      user.email = "jazmin.irene.vc@protonmail.com";
    };
  };
}
