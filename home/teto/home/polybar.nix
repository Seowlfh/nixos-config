{ pkgs, config, ... }:
{
  enable = true;

  script = "polybar -q -r main &";

  config =
    let
      color = {
        # old
        # background = "#2A2B28";
        # foreground = "#FFFFFF";

        # test
        background = "#1d2021";
        foreground = "#ebdbb2";

        foreground-alt = "#8F8F8F";
        module-fg = "#FFFFFF";
        primary = "#43a047";
        secondary = "#751313";
        alternate = "#FFFFFF";

        white = "#FFFFFF";
        black = "#000000";
        red = "#EC7875";
        pink = "#EC407A";
        purple = "#BA68C8";
        blue = "#42A5F5";
        cyan = "#4DD0E1";
        teal = "#00B19F";
        green = "#61C766";
        lime = "#B9C244";
        yellow = "#FDD835";
        amber = "#FBC02D";
        orange = "#E57C46";
        brown = "#AC8476";
        indigo = "#6C77BB";
        gray = "#9E9E9E";
        blue-gray = "#6D8895";
        light-green = "#7EB36B";
      };
    in
    {
      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
      };

      "bar/main" = {
        monitor-strict = false;

        override-redirect = false;

        fixed-center = true;

        width = "100%";
        height = 30;

        # offset-x = "1%";
        # offset-y = "2%:-2";

        background = color.background;
        foreground = color.foreground;

        line-size = 2;
        line-color = color.primary;

        # border-bottom-size = 2;
        # border-bottom-color = color.primary;
        border-bottom-size = 0;

        bottom = true;

        padding = 1;
        module-margin = 2;

        # font-1 = "JetBrainsMono Nerd Font:size=10;3";
        # font-0 = "icomoon-feather:size=10;3";
        font-0 = "Terminus:size=10;3";
        font-1 = "waffle:size=10;3";
        font-2 = "Iosevka Nerd Font:style=Medium:size=22;5";

        modules-left = "workspaces temperature cpu memory";
        modules-center = "";
        modules-right = "filesystem backlight battery network time";

        separator = "";

        dim-value = "1.0";

        wm-name = "";

        locale = "";

        tray-position = "right";
        tray-offset-x = -20;

        enable-ipc = true;
      };

      "settings" = {
        throttle-output = 5;
        throttle-output-for = 10;

        screenchange-reload = false;

        compositing-background = "source";
        compositing-foreground = "over";
        compositing-overline = "over";
        compositing-underline = "over";
        compositing-border = "over";

        pseudo-transparency = false;
      };

      "module/temperature" = {
        type = "internal/temperature";

        interval = "0.5";

        thermal-zone = 0;

        hwmon-path = config.hwmon-path;

        warn-temperature = 65;

        units = true;

        format = "<ramp> <label>";

        format-warn = "<ramp> <label-warn>";

        label = "%temperature-c%";

        label-warn = "%temperature-c%";

        ramp-0 = "";
        ramp-1 = "";
        ramp-2 = "";
        ramp-3 = "";
        ramp-4 = "";
        format-foreground = color.red;
      };

      "module/backlight" = {
        type = "internal/backlight";

        card = "intel_backlight";

        format = "<ramp> <label>";

        label = "%percentage%%";
        format-foreground = color.yellow;

        ramp-0 = "";
        ramp-1 = "";
        ramp-2 = "";
        ramp-3 = "";
        ramp-4 = "";
      };

      "module/workspaces" = {
        type = "internal/xworkspaces";

        pin-workspaces = true;
        enable-click = true;
        enable-scroll = false;

        icon-0 = "1;1";
        icon-1 = "2;2";
        icon-2 = "3;3";
        icon-3 = "4;4";
        icon-4 = "5;5";
        icon-5 = "6;6";
        icon-6 = "7;7";
        icon-7 = "8;8";
        icon-8 = "9;9";

        format = "<label-state>";
        format-padding = 0;

        label-monitor = "%name%";

        label-active = "%name%";
        label-active-foreground = color.primary;
        label-active-overline = color.primary;

        label-occupied = "%name%";
        label-occupied-foreground = color.alternate;

        label-urgent = "%name%";
        label-urgent-foreground = color.secondary;

        label-empty = "%name%";

        label-active-padding = 2;
        label-urgent-padding = 2;
        label-occupied-padding = 2;
        label-empty-padding = 2;
      };

      "module/cpu" = {
        type = "internal/cpu";

        interval = 1;

        format = "<label>";
        format-prefix = "";
        format-foreground = color.yellow;

        label = " %percentage%%";
      };

      "module/memory" = {
        type = "internal/memory";

        interval = 1;

        format = "<label>";
        format-prefix = "";
        format-foreground = color.blue;

        label = " %gb_used%";
      };

      "module/filesystem" = {
        type = "internal/fs";

        mount-0 = "/";

        interval = 30;

        fixed-values = true;

        format-mounted = "<label-mounted>";
        format-mounted-prefix = "";
        format-mounted-foreground = color.blue-gray;

        label-mounted = " %free%";
      };

      "module/battery" = {
        type = "internal/battery";

        full-at = 100;
        low-at = 20;

        battery = config.battery.name;
        adapter = config.battery.adapter;

        poll-interval = 5;

        time-format = "%H:%M";

        label-charging = "%percentage%%";
        format-charging = "<animation-charging> <label-charging>";
        format-charging-foreground = color.white;


        label-discharging = "%percentage%% (%time%)";
        format-discharging = "<ramp-capacity> <label-discharging>";
        format-discharging-foreground = color.orange;

        label-low = " %percentage%%";
        format-low = "<label-low>";
        format-low-foreground = color.red;

        label-full = "Full";
        format-full = "<label-full>";
        format-full-prefix = " ";
        format-full-foreground = color.white;

        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";

        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";

        animation-charging-framerate = 750;
      };

      "module/network" = {
        type = "internal/network";
        interface = config.network.interface;

        interval = "3.0";

        accumulate-stats = true;

        unknown-as-up = true;

        format-connected = "<ramp-signal> <label-connected>";
        format-connected-foreground = color.gray;

        format-disconnected = "<label-disconnected>";
        format-disconnected-prefix = "";
        format-disconnected-foreground = color.gray;

        label-connected = "%{A1:networkmanager_dmenu &:}%essid%%{A}";

        label-disconnected = "%{A1:networkmanager_dmenu &:} Offline%{A}";

        ramp-signal-0 = "";
        ramp-signal-1 = "";
        ramp-signal-2 = "";
      };

      "module/time" = {
        type = "internal/date";

        interval = "1.0";

        time = " %H:%M %D";

        format = "<label>";
        format-foreground = color.light-green;

        label = "%time%";
      };

      "module/volume" = {
        type = "internal/alsa";

        master-soundcard = "default";
        speaker-soundcard = "default";
        headphone-soundcard = "default";
        master-mixer = "Master";

        # Optionally define speaker and headphone mixers
        # Default: none
        #;speaker-mixer = Speaker
        # Default: none
        #;headphone-mixer = Headphone

        # NOTE: This is required if headphone_mixer is defined
        # Use the following command to list available device controls
        # $ amixer controls | sed -r "/CARD/\!d; s/.*=([0-9]+).*name='([^']+)'.*/printf '%3.0f: %s\n' '\1' '\2'/e" | sort
        # You may also need to use `amixer -c # controls` as above for the mixer names
        # Default: none
        #;headphone-id = 9

        # Use volume mapping (similar to amixer -M and alsamixer), where the increase in volume is linear to the ear
        # Default: false
        #;mapped = true

        # Interval for volume increase/decrease (in percent points)
        # Default: 5
        interval = 5;

        # Available tags:
        #   <label-volume> (default)
        #   <ramp-volume>
        #   <bar-volume>
        format-volume = "<ramp-volume> <bar-volume> <label-volume>";
        format-volume-background = color.background;
        format-volume-padding = 2;

        # Available tags:
        #   <label-muted> (default)
        #   <ramp-volume>
        #   <bar-volume>
        format-muted = "<label-muted>";
        format-muted-prefix = "婢";
        format-muted-background = color.background;
        format-muted-padding = 2;

        # Available tokens:
        #   %percentage% (default)
        label-volume = "%percentage%%";

        # Available tokens:
        #   %percentage% (default
        label-muted = " Muted";
        label-muted-foreground = color.foreground;

        # Only applies if <ramp-volume> is used
        ramp-volume-0 = "奄";
        ramp-volume-1 = "奔";
        ramp-volume-2 = "墳";

        # Only applies if <bar-volume> is used
        bar-volume-width = 10;
        bar-volume-gradient = false;

        bar-volume-indicator = "雷";
        bar-volume-indicator-foreground = color.foreground;

        bar-volume-fill = "絛";
        bar-volume-foreground-0 = color.foreground ;
        bar-volume-foreground-1 = color.foreground ;
        bar-volume-foreground-2 = color.foreground ;

        bar-volume-empty = "絛";
        bar-volume-empty-foreground = color.foreground;

        # If defined, it will replace <ramp-volume> when
        # headphones are plugged in to `headphone_control_numid`
        # If undefined, <ramp-volume> will be used for both
        # Only applies if <ramp-volume> is used
        ramp-headphones-0 = "";
      };
    };
}
