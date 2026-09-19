{ config, pkgs, unstablePkgs, ... }:

{

  system.stateVersion = "26.05";

  networking.hostName = "dskt";


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  
  powerManagement.cpuFreqGovernor = "performance";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    package = unstablePkgs.mesa;
    package32 = unstablePkgs.pkgsi686Linux.mesa;
  };

  }
