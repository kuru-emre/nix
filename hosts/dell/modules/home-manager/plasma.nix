{config, lib, pkgs, ...} : 

{
  programs.plasma = {
    enable = true;

    workspace = {
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images_dark/5120x2880.png";
    
    };

    panels = [
      {
        location = "top";
        height = 30;
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General.icon = "nix-snowflake-white";
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.marginsseparator"
          {
            systemTray.items = {
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
              ];
              hidden = [
                "org.kde.plasma.bluetooth"
              ];
            };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "12h";
            };
          }
        ];
      }
      {
        location = "bottom";
        alignment = "center";
        lengthMode = "fit";
        hiding = "dodgewindows";
        floating = true;
        height = 46;
        widgets = [
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General.launchers = [
                "applications:org.kde.dolphin.dekstop"
                "applications:org.kde.konsole.dekstop"
                "applications:org.kde.settings.dekstop"
                "org.kde.firefox.desktop"
              ];
            };
          }
        ];
      }
    ];
  };
}