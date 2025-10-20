{ config, pkgs, inputs, ... }:

{
  # Configuration for my main laptop:
  # MODEL = Aspire A315-42
  # CPU = AMD Ryzen 7 3700U (8) @ 2.30 GHz
  # iGPU = AMD Radeon Vega 10 Graphics
  # RAM = 14G usable, 2 for iGPU
  imports = [
    ./hardware-configuration.nix
    ../shared/optimise.nix
    ../shared/security.nix
    # ./modules/system.nix
    # ./modules/desktop.nix
    # ./modules/applications.nix
    # ./modules/development.nix
    # ./modules/gaming.nix
  ];
  # Set flakes and unfree software
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes" ];

  environment = {
    shells = with pkgs; [ bash ];
    systemPackages = with pkgs; [
      git
      vim
    ];
    sessionVariables = {
      WL_NO_HARDWARE_CURSORS = "1";
    };
  };

  xdg.portal = {
    # config.common.default = "*";
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = [ "ntfs" ];
    initrd.kernelModules = [ "amdgpu" ];

    plymouth = {

    };
  };

  networking = {
    hostName = "fraKctured";
    networkmanager.enable = true;
  };
  systemd.network.wait-online.enable = false;


  # Locale and keyboard settings
  time.timeZone = "America/Santiago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CL.UTF-8";
    LC_IDENTIFICATION = "es_CL.UTF-8";
    LC_MEASUREMENT = "es_CL.UTF-8";
    LC_MONETARY = "es_CL.UTF-8";
    LC_NAME = "es_CL.UTF-8";
    LC_NUMERIC = "es_CL.UTF-8";
    LC_PAPER = "es_CL.UTF-8";
    LC_TELEPHONE = "es_CL.UTF-8";
    LC_TIME = "es_CL.UTF-8";
  };
  console.keyMap = "es";
  services.xserver.xkb = {
      layout = "latam";
      variant = "";
  };

  # services and stuff
  services = {
    xserver.videoDrivers = [ "amdgpu" ];
    dbus.enable = true;
    flatpak.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };


    upower.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        PLATFORM_PROFILE_ON_BAT = "low-power";
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        AMDGPU_ABM_LEVEL_ON_BAT = 3;
        #Optional helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 70; # and bellow it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 90; # and above it stops charging
      };
    };
  };


  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    # opengl.extraPackages = with pkgs; [
    #   amdvlk
    # ];
    # # 32 bit support
    # opengl.extraPackages32 = with pkgs; [
    #   driversi686Linux.amdvlk
    # ];
  };

  fonts.packages = with pkgs; [
    corefonts
    dejavu_fonts
    font-awesome
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    noto-fonts-extra
    nerd-fonts.noto
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.hack
  ];

  programs = {
    bash.enable = true;
    niri.enable = true;
    starship.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
