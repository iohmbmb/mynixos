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
        modules-right = [ "clock" ];

        # Configure the modules
        "clock" = {
          format = "{:%I:%M %p}"; # Explicitly sets your 12h AM/PM layout!
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
      };
    };
  };
}
