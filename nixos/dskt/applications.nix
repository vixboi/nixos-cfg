{ config, pkgs, ... }:

{


  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    kdePackages.sddm-kcm
    pkgs.vscodium
    python3
    protonplus
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

#------------------------------APPS----------------------------------

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.firefox = {
    enable = true;
  };

  programs.aeroshell = {
  enable = true;
  fonts.segoe.enable = true;
  polkit.enable = true;
  aerothemeplasma = {
    enable = true;
    sddm.enable = true;
    plymouth.enable = true;
  };
  };


#------------------------------SERVICES----------------------------------

  services.displayManager.defaultSession = "aerothemeplasma";

  services.openssh.enable = true;

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  services.xserver.excludePackages = [ pkgs.xterm ];

    services.flatpak.enable = true;

}

