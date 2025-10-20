{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  options.desktop.enable = mkEnableOption "desktop";

  config = mkMerge [
    (mkIf config.desktop.enable {
      programs.bash = {
        initExtra = ''
          [ -f "${config.home.homeDirectory}/.cache/wal/sequences" ] &&
            cat "${config.home.homeDirectory}/.cache/wal/sequences"
        '';
      };
    })

    {
      home.packages = with pkgs; [
        zoxide
        llm
        eza
        fzf
        lazygit
      ];

      programs.direnv = {
        enable = true;
      };

      xdg.configFile."direnv/direnv.toml".source = ./direnv.toml;

      programs.bash = {
        enable = true;
        enableCompletion = true;
        shellAliases = {
          nix-switch = "sudo nixos-rebuild switch --flake ~/nix-config";
          nix-test = "sudo nixos-rebuild test --flake ~/nix-config";
          ll = "eza -lag";
          ls = "eza --color=auto --group-directories-first --icons=always";
          neofetch = "fastfetch";
          nvimf = "nvim $(fzf)";
        };
        historyFile = "${config.xdg.dataHome}/bash/history";
        initExtra = ''
          fastfetch
        '';
      };
    }
  ];
}
