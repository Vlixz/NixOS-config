{ config, pkgs, ... }:

{

  programs.alacritty.enable = true;

  xdg.configFile."alacritty/alacritty.toml".text = ''

    [[colors.indexed_colors]]
    color = "#FAB387"
    index = 16

    [[colors.indexed_colors]]
    color = "#F5E0DC"
    index = 17

    [colors.bright]
    black = "#585B70"
    blue = "#89B4FA"
    cyan = "#94E2D5"
    green = "#A6E3A1"
    magenta = "#F5C2E7"
    red = "#F38BA8"
    white = "#A6ADC8"
    yellow = "#F9E2AF"

    [colors.cursor]
    cursor = "#F5E0DC"
    text = "#1E1E2E"

    [colors.dim]
    black = "#45475A"
    blue = "#89B4FA"
    cyan = "#94E2D5"
    green = "#A6E3A1"
    magenta = "#F5C2E7"
    red = "#F38BA8"
    white = "#BAC2DE"
    yellow = "#F9E2AF"

    [colors.hints.end]
    background = "#A6ADC8"
    foreground = "#1E1E2E"

    [colors.hints.start]
    background = "#F9E2AF"
    foreground = "#1E1E2E"

    [colors.normal]
    black = "#45475A"
    blue = "#89B4FA"
    cyan = "#94E2D5"
    green = "#A6E3A1"
    magenta = "#F5C2E7"
    red = "#F38BA8"
    white = "#BAC2DE"
    yellow = "#F9E2AF"

    [colors.primary]
    background = "#1E1E2E"
    bright_foreground = "#CDD6F4"
    dim_foreground = "#CDD6F4"
    foreground = "#CDD6F4"

    [colors.search.focused_match]
    background = "#A6E3A1"
    foreground = "#1E1E2E"

    # [colors.search.footer_bar]
    # background = "#A6ADC8"
    # foreground = "#1E1E2E"

    [colors.search.matches]
    background = "#A6ADC8"
    foreground = "#1E1E2E"

    [colors.selection]
    background = "#F5E0DC"
    text = "#1E1E2E"

    [colors.vi_mode_cursor]
    cursor = "#B4BEFE"
    text = "#1E1E2E"

    [font]
    size = 12

    [font.bold]
    family = "CaskaydiaCove Nerd Font Propo"
    style = "Bold"

    [font.glyph_offset]
    x = 0
    y = 0

    [font.italic]
    family = "CaskaydiaCove Nerd Font Propo"
    style = "Italic"

    [font.normal]
    family = "CaskaydiaCove Nerd Font"
    style = "Regular"

    [font.offset]
    x = 0
    y = 1

    [window]
    decorations = "none"
    opacity = 0.95

    [window.dimensions]
    columns = 100
    lines = 24

    [window.padding]
    x = 20
    y = 20

  '';
}
