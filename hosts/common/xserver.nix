{
    services.xserver = {
        # Enable the X11 windowing system.
        enable = true;

          # Enable the GNOME Desktop Environment.
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        windowManager.i3.enable = true;

        # Keyboard settings
        xkb = {
            layout = "us";
            variant = "alt-intl";
            options = "caps:escape";
        };

    };

    # Enable touchpad support 
    services.libinput.enable = true;

}
