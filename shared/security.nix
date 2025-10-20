{ pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.bash;
    users.jazz = {
      home = "/home/jazz";
      isNormalUser = true;
      description = "Jazmin";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "games"
      ];
      # hashedPasswordFile = "/run/secrets/HASHED_PASSWORD"; # DECOMENT THIS LINE IF YOU ARE NOT USING PAM FOR ANOTHER MULTI FACTOR LOGIN
    };
    users.jazz.openssh.authorizedKeys.keys = [
      # ''insert keys here''
    ];
  };

  security = {
    rtkit.enable = true;

    # For god sake pls stop asking for my passwd every 5 commands..
    sudo = {
      enable = true;
      extraConfig = ''
        jazz ALL=(ALL) NOPASSWD: ALL
      '';
    };

    # Polkit.
    polkit.enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };

  # programs.ssh.startAgent = true;

}
