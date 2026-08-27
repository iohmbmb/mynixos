{
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 24;
      rounding_power = 2;
      active_opacity = 1.0;
      inactive_opacity = 0.8;
      dim_inactive = true;
      dim_strength = 0.5;
      shadow = {
        enabled = true;
        range = 8;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };

      blur = {
        enabled = true;
        size = 7;
        passes = 2;
        ignore_opacity = true;
        #noise = 0.08;
        contrast = 1.5;
        brightness = 0.5;
        xray = false;
        new_optimizations = true;
      };
    };
  };
}
