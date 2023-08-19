# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
#nixpkgs.config.allowUnfree = true;
#nixpkgs.config.allowBroken = true;
services.xserver.videoDrivers = [ "modesetting" ];
hardware.opengl.driSupport32Bit = true;
#hardware.opengl.extraPackages = [
 # intel-media-driver
#];
nixpkgs.config = {
  # Allow proprietary packages
  allowUnfree = true;

# Create an alias for the unstable channel

packageOverrides = pkgs: {
unstable = import <nixos-unstable> { # pass the nixpkgs config to the unstable alias # to ensure `allowUnfree = true;` is propagated:
config = config.nixpkgs.config;
};
};
};
   networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.



  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
#nu
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };
  # Enable the X11 windowing system.
  services.xserver.enable = true;
 # Configure keymap in X11
  services.xserver.layout = "us";
   services.xserver.xkbOptions = "eurosign:e,caps:escape";

 xdg.portal = {
    enable = true;
     wlr.enable = true;
        lxqt.enable = true;
    # gtk portal needed to make gtk apps happy
#    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.libinput.enable = true;



 
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
   hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
   #services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.knighty = {
     isNormalUser = true;
     extraGroups = [ "wheel" "kvm" "input" "disk" "libvirtd" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox
       tree

wget 
git
brave 
libverto
#xmond
#xxdg-desktop-portal
     ];
   };

#Enabling GNOME Flashback
#GNOME Flashback provides a desktop environment based on the classic GNOME 2 architecture. You can enable the default GNOME Flashback session,
# which uses the Metacity window manager, with:
services.xserver.desktopManager.gnome.flashback.enableMetacity = true;

#services.xserver.desktopManager.gnome.flashback.customSessions = [
 # {
  #  wmName = "xmonad";
   # wmLabel = "XMonad";
    #wmCommand = "${pkgs.haskellPackages.xmonad}/bin/xmonad";
    #enableGnomePanel = false;
 # }
#];

#environment.systemPackages = [
#qt.enable = true;
#qt.platformTheme = "gtk2";
#3qt.style = "gtk2";
  #gnomeExtensions.dash-to-dock
 # gnomeExtensions.gsconnect
 # gnomeExtensions.mpris-indicator-button
#];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
  neofetch
#code  
xdg-desktop-portal-gtk
#HaskellPackages.xmonad
haskellPackages.xmonad
#haskellPackages.xmonad-windownames 
     neovim
        autojump
        starship
        cargo
        celluloid
        chatterino2
  clang-tools_9
        dunst
        elinks
        eww
        feh
        flameshot
        flatpak
  fontconfig
blueman
freetype
       gcc
        gh
        xfce.thunar  



 ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.mtr.enable = true;
   programs.gnupg.agent = {
   enable = true;
  #   enableSSHSupport = true;
   };

#services.dokuwiki.sites."localhost" = {
 # enable = true;
  #settings.title = "My Wiki";
#};


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
   system.copySystemConfiguration = true;
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-23.05";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}


