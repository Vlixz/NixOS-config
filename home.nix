{ config, pkgs, ... }:

{
  home.username = "vlixz";
  home.homeDirectory = "/home/vlixz";
  home.stateVersion = "24.11";

  imports = [
    ./modules/hyprland.nix
    ./modules/wofi.nix
    ./modules/hyprpaper.nix
    ./modules/alacritty.nix
    ./modules/firefox.nix
  ];

  home.pointerCursor = {
    name = "rose-pine-hyprcursor";
    size = 24;
    package = pkgs.rose-pine-hyprcursor;
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (
      ps: with ps; [
        libusb1
        picotool
        zstd
        libftdi1
        openocd
        hidapi
      ]
    );
  };

  home.packages = with pkgs; [
    alacritty
    youtube-music
    vesktop
    hyprpaper
    osu-lazer
    protonmail-desktop
    qucs-s
    ngspice
    unzip
    kicad
    mediawriter

    # vscode-fhs

    # Console tools
    gcc-arm-embedded
    ninja
    gcc
    pico-sdk
    python3
    cmake
    feh
    usbutils
    libusb1
    picotool
  ];

  programs.home-manager.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        browser = "${config.programs.firefox.package}/bin/firefox -new-tab";
        dmenu = "${pkgs.rofi}/bin/rofi -dmenu";
        follow = "mouse";
        font = "Droid Sans 10";
        format = "<b>%s</b>\\n%b";
        frame_color = "#555555";
        frame_width = 2;
        geometry = "500x5-5+30";
        horizontal_padding = 8;
        icon_position = "off";
        line_height = 0;
        markup = "full";
        padding = 8;
        separator_color = "frame";
        separator_height = 2;
        transparency = 10;
        word_wrap = true;
      };

      urgency_low = {
        background = "#1d1f21";
        foreground = "#4da1af";
        frame_color = "#4da1af";
        timeout = 10;
      };

      urgency_normal = {
        background = "#1d1f21";
        foreground = "#70a040";
        frame_color = "#70a040";
        timeout = 15;
      };

      urgency_critical = {
        background = "#1d1f21";
        foreground = "#dd5633";
        frame_color = "#dd5633";
        timeout = 0;
      };

      shortcuts = {
        context = "mod4+grave";
        close = "mod4+shift+space";
      };
    };
  };
}
