{ config, pkgs, ... }:

{
    # Bootloader.
    boot = {
        plymouth.enable = true;
        initrd.verbose = false;
        consoleLogLevel = 0;
        kernelPackages = pkgs.linuxPackages_latest;
        supportedFilesystems = [ "ntfs" ];

    kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "i915.fastboot=1"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
    ];

    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        systemd-boot.configurationLimit = 5;
    };
  };

}
