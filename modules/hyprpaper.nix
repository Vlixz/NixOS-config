{ config, pkgs, ... }:

{

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Downloads/wallhaven-5g22q5.png"
      ];
      wallpaper = [
        "DP-2, ~/Downloads/wallhaven-5g22q5.png"
      ];
    };
  };
}
