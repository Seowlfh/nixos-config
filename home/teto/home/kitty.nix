{ pkgs, ... }:
{
  enable = true;

  font = {
    name = "FiraCode Nerd Font";
    size = 15.3;
  };

  settings = {
    # Gruvbox Dark Hard theme
    # Generated via kitty +kitten themes
    selection_foreground = "#ebdbb2";
    selection_background = "#d65d0e";
    
    # background = "#1d2021";
    background = "#222222";
    foreground = "#ebdbb2";
    
    color0 = "#3c3836";
    color1 = "#cc241d";
    color2 = "#98971a";
    color3 = "#d79921";
    color4 = "#458588";
    color5 = "#b16286";
    color6 = "#689d6a";
    color7 = "#a89984";
    color8 = "#928374";
    color9 = "#fb4934";
    color10 = "#b8bb26";
    color11 = "#fabd2f";
    color12 = "#83a598";
    color13 = "#d3869b";
    color14 = "#8ec07c";
    color15 = "#fbf1c7";
    
    cursor = "#bdae93";
    cursor_text_color = "#665c54";
    
    url_color = "#458588";

    # Rest
    background_opacity = "0.8";

    placement_strategy = "top-left";

    enable_audio_bell = "no";

    # window_margin_width = "5.0";
    # window_padding_width = "5.0";

    resize_in_steps = "yes";

    dynamic_background_opacity = "yes";

    # Crazy shenanigans to dynamically change the padding with neovim
    allow_remote_control = "yes";
    enabled_layouts = "tall";

    listen_on = "unix:/tmp/mykitty";

    remember_window_size = "yes";
  };
}






