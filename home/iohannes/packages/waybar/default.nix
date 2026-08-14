{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        # Decide where your modules go
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "clock" "tray" ];

        # Configure the modules
        "clock" = {
          format = "{:%I:%M %p}"; # Explicitly sets your 12h AM/PM layout!
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        # 2. Added the system tray configuration block
        "tray" = {
          icon-size = 16;     # Sets the size of your tray icons
          spacing = 10;       # Adds space (in pixels) between icons
        };
      };
    };
  };
}
