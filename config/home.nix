 # This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
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

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "direnv"
        "sudo"
      ];
    };

    shellAliases = {
      system-update = "sudo nixos-rebuild switch --flake /home/kurue/nix/#kurue-dell";
      system-clean  = "sudo nix-collect-garbage --delete-old && nix-store --optimise";
    };
  };

  programs.vscode.enable = true;

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    devbox
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Enable Git
  programs.git = {
    enable = true;
    extraConfig = {
      credential.helper = "${ pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
    userName  = "kuru-emre";
    userEmail = "kuru.emre@hotmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}