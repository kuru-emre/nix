{ config, pkgs, ... }:

{
  # Activate system programs
  programs = {
    zsh.enable = true;
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "kurue" ];
   };

   chromium = {
      enable = true;
      extraOpts = {
        "BrowserSignin" = 0;
        "SyncDisabled" = true;
        "PasswordManagerEnabled" = false;
        "SpellcheckEnabled" = false;
        "BrowserLabsEnabled" = false;
        "AutofillAddressEnabled" = false;
        "PaymentMethodQueryEnabled" = false;
        "HighEfficiencyModeEnabled" = true;
        "BackgroundModeEnabled" = false;
        "BlockThirdPartyCookies" = true;
        "SafeBrowsingProtectionLevel" = 2;
        "AutofillCreditCardEnabled" = false;
      };
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      ];
    };
  };

  # List packages installed in system profile. To search, run:
  environment = {
    systemPackages = with pkgs; [
      wget
      vim
      gparted
      haruna
      rar
      yakuake
      chromium
    ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      kate
    ];    
  };

}