{...}: {

  "hyprland/workspaces" = {
    format = "{icon}";
    format-icons = {
      default= "";
      active= "";
      persistent= "";
    };
  };

  "backlight" = {
    # Format uses Nerd Font symbols for visual anchors
    format = "{icon} {percent}%";
    format-icons = ["󰃞" "󰃟" "󰃠"];

    # Enables scrolling over the bar to change brightness
    on-scroll-up = "brightnessctl set 1%+";
    on-scroll-down = "brightnessctl set 1%-";
  };

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
    on-click = "kitty wiremix"; # Opens your volume mixer when clicked
  };

  # Added the system tray configuration block
  "tray" = {
    icon-size = 16;     # Sets the size of your tray icons
    spacing = 10;       # Adds space (in pixels) between icons
  };

  # Added the network configuration block
  "network" = {
    format-wifi = " ";
    format-ethernet = "🖧 ";
    format-disconnected = "⚠️ Disconnected";
    tooltip-format = "IP: {ipaddr}\ Gateway: {gwaddr}\ Interface: {ifname}";
    tooltip-format-wifi = "SSID: {essid}\ IP: {ipaddr}\ Gateway: {gwaddr}\ Interface: {ifname}";
    tooltip-format-ethernet = "Ethernet\ IP: {ipaddr}\ Gateway: {gwaddr}\ Interface: {ifname}";
    on-click = "kitty impala";
  };

  "battery" = {
    states = {
      warning = 30;
      critical = 15;
    };
    format = "{icon} {capacity}%";
    format-charging = " {capacity}%";
    format-plugged = " {capacity}%";
    format-alt = "{icon} {time}";
    format-icons = [ "" "" "" "" "" ];
  };

  "custom/weather" = {
    format = "{}";
    tooltip = true;
    interval = 900;
    returnType = "json";
    signal = 5;
    exec = "/home/iohannes/.config/waybar/weather.sh";
    on-click = "pkill -RTMIN+5 .waybar-wrapped";
  };
}
