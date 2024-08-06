# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, lib
, config
, pkgs
, ...
}: {
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

    # oh-my-zsh = {
    #   enable = true;
    #   theme = "robbyrussell";
    #   plugins = [
    #     "git"
    #     "direnv"
    #     "sudo"
    #   ];
    # };

    initExtra = ''source ~/.p10k.zsh'';

    plugins = [
      { name = "powerlevel10k"; src = pkgs.zsh-powerlevel10k; file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme"; }
    ];

    shellAliases = {
      system-update = "git gc --auto && nix flake update ~/nix";
      system-upgrade = "sudo nixos-rebuild switch --flake /home/kurue/nix/#kurue-dell";
      system-clean = "sudo nix-collect-garbage -d && sudo nix-store --verify --check-contents --repair";
    };
  };

  programs.vscode.enable = true;

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    devbox
    devenv
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Enable Git
  programs.git = {
    enable = true;
    extraConfig = {
      credential.helper = "${pkgs.git.override {withLibsecret = true;}}/bin/git-credential-libsecret";
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
    userName = "kuru-emre";
    userEmail = "kuru.emre@hotmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
