{ inputs, lib, config, pkgs, ... }:

{
  # You can import other home-manager modules here
  imports = [
    ./../modules/home-manager
  ];

  # TODO: Set your username
  home = {
    username = "kurue";
    homeDirectory = "/home/kurue";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    devbox
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
