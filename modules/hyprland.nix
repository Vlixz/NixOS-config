{ config, pkgs, ... }:

{
  # Hyprland configuration
  xdg.configFile."hypr/hyprland.conf".text = ''
    monitor = DP-1, 3440x1440@175, 0x00, 1

    $terminal = alacritty
    $fileManager = dolphin
    $menu = wofi --show drun

    input {
      kb_layout = us
      sensitivity = 0
    }

    general {
      gaps_in = 5
      gaps_out = 5

      border_size = 3

      col.active_border = rgb(635BA8)
      col.inactive_border = rgba(595959aa)

      resize_on_border = true

      allow_tearing = false

      layout = master
    }

    decoration {
        rounding = 2

        active_opacity = 1.0
        inactive_opacity = 0.95

        blur {
          enabled = false
        }
    }

    animations {
        enabled = true

        bezier = default, 0.05, 0.9, 0.1, 1.05
        bezier = wind, 0.05, 0.9, 0.1, 1.05
        bezier = overshot, 0.13, 0.99, 0.29, 1.08
        bezier = liner, 1, 1, 1, 1

        animation = windows, 1, 7, wind, popin
        animation = windowsIn, 1, 6, overshot, popin
        animation = windowsOut, 1, 5, overshot, popin
        animation = windowsMove, 1, 6, overshot, slide
        animation = layers, 1, 4, default, popin
        animation = fadeIn, 1, 10, default
        animation = fadeOut, 1, 10, default
        animation = fadeSwitch, 1, 10, default
        animation = fadeShadow, 1, 10, default
        animation = fadeDim, 1, 10, default
        animation = fadeLayers, 1, 10, default
        animation = workspaces, 1, 6, overshot, slide
        animation = border, 1, 1, liner
        animation = borderangle, 1, 30, liner, loop
    }

    master {
        new_status = master
        orientation = center
    }

    misc { 
        force_default_wallpaper = 0
        disable_hyprland_logo = true
    }

    $mainMod = SUPER 

    bind = $mainMod, p, exec, grimblast copy area

    bind = $mainMod, SPACE, exec, $menu

    bind = $mainMod, T, exec, $terminal
    bind = $mainMod, Q, killactive
    bind = $mainMod, M, exec, hyprlock
    bind = $mainMod, E, exec, $fileManager
    bind = $mainMod, V, togglefloating
    bind = $mainMod, F, fullscreen

    bind = $mainMod, left,  movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up,    movefocus, u
    bind = $mainMod, down,  movefocus, d

    bind = $mainMod SHIFT, left,  movewindow, l
    bind = $mainMod SHIFT, right, movewindow, r
    bind = $mainMod SHIFT, up,    movewindow, u
    bind = $mainMod SHIFT, down,  movewindow, d

    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9

    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9

    # Example special workspace (scratchpad)
    bind = $mainMod, S, togglespecialworkspace, magic
    bind = $mainMod SHIFT, S, movetoworkspace, special:magic

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    # No gaps when only one window
    workspace = w[tv1], gapsout:0, gapsin:0
    workspace = f[1], gapsout:0, gapsin:0

    windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
    windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
    windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
    windowrulev2 = rounding 0, floating:0, onworkspace:f[1]

    # Auth pop-up
    $auth        = title:^(Authentication Required)$
    windowrulev2 = float,   $auth
    windowrulev2 = center,  $auth

    # 1Password 
    $1password   = title:^(1Password)$
    windowrulev2 = float,           $1password
    windowrulev2 = pin,             $1password
    windowrulev2 = center,          $1password
    windowrulev2 = size 30% 60%,    $1password

    # Alacritty
    $alacritty   = title:^(Alacritty)$
    windowrule   = animation popin, $alacritty
    windowrulev2 = float, center,   $alacritty

    # Thunar
    $thunar      = class:^(thunar)$
    windowrulev2 = float,           $thunar 
    windowrulev2 = pin,             $thunar 
    windowrulev2 = center,          $thunar 
    windowrulev2 = size 30% 60%,    $thunar 

    # General
    windowrulev2 = suppressevent maximize, class:.* # I liked it (:

    #feh 
    $feh         = class:^(feh)$
    windowrulev2 = float,           $feh

    exec-once = lxqt-policykit-agent
    exec-once = dunst
    exec-once = hyprpaper
    exec-once = goxlr-daemon
  '';

  # Wayland environment variables
  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
  };
}
