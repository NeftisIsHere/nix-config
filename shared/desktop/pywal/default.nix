{ pkgs, ... }:
# let
#   pywalfox-wrapper = pkgs.writeShellScriptBin "pywalfox-wrapper" ''
#     ${pkgs.pywalfox-native}/bin/pywalfox start
#   '';
# in
{
  home.packages = with pkgs; [
    pywal16
    pywalfox-native
  ];

  xdg.configFile."wal/templates/".source = ./template;

}
