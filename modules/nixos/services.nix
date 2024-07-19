{ config, pkgs, ... }:

{
  services = {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.F
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };

      # Enable touchpad support (enabled default in most desktopManager).
      # libinput.enable = true;

      # Enable video drivers
      videoDrivers = [
        "i915"
        "intel"
      ];
    };

    thermald.enable = true;    
    fstrim.enable = true;


    # Enable the KDE Plasma Desktop Environment.

    displayManager = {
      sddm = {
        enable = true;
      };
      defaultSession = "plasmax11";
    };


    desktopManager.plasma6.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };
}
