{osConfig, ...}:
{
  wayland.windowManager.hyprland.settings = {
    monitor = (
      if (osConfig.networking.hostName == "aegis") then [
        "HDMI-A-1, 2560x1440@60, 2560x0, 1"
        "HDMI-A-2, 2560x1440@60, auto, 1"
      ] else if (osConfig.networking.hostName == "sybils") then [
          "eDP-1,preferred, auto, 1"
          ",preferred, auto, 1, mirror, eDP-1"
        ] else [",preferred,auto,auto"]
    );
  };
}
