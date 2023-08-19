# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{

nixpkgs.config.allowUnfree = true;
#nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
                "openssl-1.1.1u"
                "python-2.7.18.6"
];

hardware.opengl.driSupport32Bit = true;
hardware.pulseaudio.support32Bit = true;
#  hardware.pulseaudio.enable = true;
hardware.bluetooth.enable = true;
services.xserver.videoDrivers = [ "nvidia" ];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


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
   #  font = "Lat2-Terminus16";
    # keyMap = "us";
   # useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

 #services.picom.enable = true;
 
services.xserver.displayManager.lightdm.greeters.pantheon.enable = true;
#defaultSession = "none+qtile";
services.xserver.displayManager.lightdm.enable = true;
#services.xserver.desktopManager.pantheon.extraWingpanelIndicators
#lxqt.wxdg-desktop-portal-lxqt
services.xserver.desktopManager.pantheon.enable = true;
services.pantheon.apps.enable = true;
programs.pantheon-tweaks.enable = true;
#services.xserver.desktopManager.pantheon.extraSwitchboardPlugs 
#services.xserver.windowManager = { 
#awesome.enable = true; 
#qtile.enable = true; 
#i3.enable = true;
#dwm.enable = true; 
#bspwm.enable = true;
#};

  # Configure keymap in X11
  services.xserver.layout = "us";
  #services.xserver.xkbOptions = "eurosign:e,caps:escape";

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
     extraGroups = [ "wheel" "libvirtd" "networkmanager" "bluetooth" "disk" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     tree
  #   ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
environment.systemPackages = with pkgs; [
#pantheom
pantheon.wingpanel
#pantheon.wingpanel-with-indicators
#pantheon.wingpanel.indicator-a11y

#pantheon.wingpanael-indicator-session
#pantheon.wingpanael-indicator-network
#pantheon.wingpanael-incator-keyboard
#panthrow.wingpanel-applicatons-menu
#pantheom-wingpanel
pantheon.touchegg
#pantheon.seitchboard-plug-applications
pantheon.switchboard
pantheon.sideload
pantheon.granite7
#pantheon.agent.polkit
pantheon.xdg-desktop-portal-pantheon

#vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
qtile
rlaunch
#ulancher
# window manager 
#dmenu
st
#awesome
#sxhkd

#i3status
#xdg-desktop-portal-lxqt
#lxrandr
#lxsession
#lxappearance
#lxpanel
#lxde.lxtask
#lxterminal
#lxde.lxmenu-data 
#i3blocks
#i3clock-color
picom
mpv
ffmpeg
#ttw
wmctrl
wmname
playerctl
pamixer 
firefox 
pcmanfm
brave
networkmanager
#Terminal Utilities
wget
w3m
#dmenu
autojump
starship
elinks
nushell
kitty
st
sxhkd
alacritty  
 # terminus-nerdfont
  # System Info and Monitoring
    neofetch
    # Development Tools
    clang-tools_9
    cargo
    luarocks
    ninja
    python311Packages.qtile
    python.pkgs.pip
    ripgrep
    # Graphics / Image Viewers / Editors
    celluloid
    gimp
    nomacs
    # Version Control
    git
#    github-desktop
    gh
    # Gaming
  #  lutris
 #   mangohud
  # steam
 #  steam-run

    # Video Editing
 #   davinci-resolve
    # Window Managers / Desktop Environment Components
    bspwm
  #  dwm
    dunst
 #   picom
    sxhkd
    variety
  #  xfce.thunar
   # xorg.xinit
  #  xorg.xinput
   # xdg-desktop-portal-gtk
    # Fonts
    fontconfig
    freetype
    # Audio Control
    pavucontrol
    # System Utilities
 #   flatpak
    nfs-utils
    trash-cli
    unzip
    # Security / Encryption
    openssl
#    polkit_gnome
    powershell
slack
qemu_full

];


  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

