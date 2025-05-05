{ config, pkgs, ... }:

{

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Nextcloud/Pictures/Personalization/Beyond-the-clouds.png"
      ];
      wallpaper = [
        "DP-2, ~/Nextcloud/Pictures/Personalization/Beyond-the-clouds.png"
      ];
    };
  };
}
