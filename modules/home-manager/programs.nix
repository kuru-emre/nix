{ config, pkgs, ...}: 

{
  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        source ~/.p10k.zsh
        export DIRENV_LOG_FORMAT=""
      '';

      plugins = [
        { name = "powerlevel10k"; src = pkgs.zsh-powerlevel10k; file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme"; }
      ];

      shellAliases = {
        system-update = "nix flake update ~/nix";
        system-upgrade = "sudo nixos-rebuild switch --flake /home/kurue/nix/#kurue-lenovo";
        system-clean = "sudo nix-collect-garbage -d && sudo nix-store --verify --check-contents --repair";
      };
    };

    vscode.enable = true;
    
    direnv = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
    };

    git = {
      enable = true;
      extraConfig = {
        credential.helper = "${pkgs.git.override {withLibsecret = true;}}/bin/git-credential-libsecret";
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
      };
      userName = "kuru-emre";
      userEmail = "kuru.emre@hotmail.com";
    };
  };
}