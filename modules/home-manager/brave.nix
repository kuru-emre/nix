{ config, pkgs, inputs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; } # 1password
    ];
  };
}