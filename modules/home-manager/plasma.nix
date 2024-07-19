{config, lib, pkgs, ...} : 

let 
  myWallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images_dark/5120x2880.png";
in {
  programs.plasma = {
    enable = true;

    workspace = {
      wallpaper = myWallpaper;
    
    };

    kscreenlocker = {
      wallpaper = myWallpaper;

    };

    kwin = {
      titlebarButtons = {
        left = ["more-window-actions"];
        right = ["minimize" "maximize" "close"];
      };

      effects = {
        minimization.animation = "magiclamp";
        dimAdminMode.enable = true;
        blur.enable = true;
      };
      
     
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
            iconTasks = {
                launchers = [
                  "applications:org.kde.dolphin.desktop"
                  "applications:org.kde.konsole.desktop"
                  "applications:org.kde.system-settings.desktop"
                ];

                appearance = {
                  showTooltips = false;
                  indicateAudioStreams = false;
                };
             
            };
            
          }
        ];
      }
    ];
  };
}