{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 0;
      #"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
      layout = "master";
    };

    #workspace = [
    #  "1, monitor:HDMI-A-1, default:true, persistent:true"
    #  "2, monitor:HDMI-A-2, default:true, persistent:true"
    #  "3, monitor:HDMI-A-1, default:true, persistent:true"
    #  "4, monitor:HDMI-A-2, default:true, persistent:true"
    #];

    input = {
      kb_layout = "us";
      kb_variant = "intl";
      follow_mouse = 1;
      sensitivity = 0;
      touchpad = {
        natural_scroll = false;
      };
    };

    device = {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    };

    master = {
      new_status = "master";
    };

    misc = {
      force_default_wallpaper = -1;
      disable_hyprland_logo = true;
    };
  };
}
