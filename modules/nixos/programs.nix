{ config
, pkgs
, ...
}: {
  # Activate system programs
  programs = {
    zsh.enable = true;
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "kurue" ];
    };
  };

  # List packages installed in system profile
  environment = {
    systemPackages = with pkgs; [
      wget
      vim
      gparted
      brave
      haruna
      libreoffice-qt
    ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      kate
    ];
  };
}
