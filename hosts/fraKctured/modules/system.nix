{ config, pkgs, ... } :

{
  environment.systemPackages = with pkgs; [
    # TODO: Organize this shit.
    eza
    colord
    bat
    fd
    ripgrep
    tree
    fzf
    zoxide
    btop
    htop
    p7zip
    unzip
    unrar
    rar
    ntfs3g
    wget
    curl
    tldr
    pv
    xarchiver
    smartmontools
    pv

    pavucontrol
    helvum
    ffmpeg

    python3
    clang
    rocmPackages.llvm.llvm
    lld
    gcc
    gnumake
    cmake
  ];

  programs.bat.enable = true;
  programs.git.enable = true;
  programs.vim.enable = true;
  programs.neovim.enable = true;

  # Login Manager
  services.displayManager.ly = {
    enable = true;
    settings = {
	animation = "matrix";
    };
  };

  # Power Profiles
  services.tuned.enable = true;
  services.tuned.ppdSupport = true;

  # Audio 
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Flatpak

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

}
