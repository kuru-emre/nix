{ config, pkgs, ... }:

{
  networking = {
    # Define your hostname.
    hostName = "kurue-lenovo";

    # Enable networking
    networkmanager.enable = true;

     # Enable firewall
    firewall.enable = true;

    # Enables wireless support via wpa_supplicant.
    # wireless.enable = true;  

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
