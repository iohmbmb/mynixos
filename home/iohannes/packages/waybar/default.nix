{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        # Decide where the modules go
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        # Added "network" to the right modules list
        modules-right = [ "pulseaudio" "network" "tray" ];

        # Configure the modules
        "clock" = {
          format = "{:%I:%M %p}"; # Explicitly sets your 12h AM/PM layout!
          format-alt = "{:%A, %B %d, %Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "on-click" = "mode";
        };

        # Added the pulseaudio module
        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{icon} {volume}% {format_source}";
          format-bluetooth-muted = "   {icon} {format_source}";
          format-muted = "   {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "  ";
            headset = "  ";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol"; # Opens your volume mixer when clicked
        };

        # Added the system tray configuration block
        "tray" = {
          icon-size = 16;     # Sets the size of your tray icons
          spacing = 10;       # Adds space (in pixels) between icons
        };

        # Added the network configuration block
        "network" = {
          format-wifi = "  {essid} ({signalStrength}%)";
          format-ethernet = "🖧  {ifname}";
          format-disconnected = "⚠️ Disconnected";
          tooltip-format = "IP: {ipaddr}\n Gateway: {gwaddr}\n Interface: {ifname}";
        };
      };
    };
  };
}
