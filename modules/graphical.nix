{ config, ... }: {

  require = [ ./desktop.nix ];

  fonts.fontconfig.enable = true;
  services = {

    xserver = {
      enable = true;

      displayManager.autoLogin = {
        enable = true;
        user = config._.user;
      };
      desktopManager.plasma5.enable = true;

      libinput = {
        enable = true;
        touchpad = {
          naturalScrolling = true;
          tapping = false;
        };
      };
      wacom.enable = true;
    };

  };

  users.users.${config._.user}.extraGroups = [ "input" ];

}
