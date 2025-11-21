{osConfig, ...}:

{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;

      # General colors
      foreground = "#C6D0F5";
      background = "#303446";
      selection_foreground = "#303446";
      selection_background = "#F2D5CF";

      cursor = "#F2D5CF";
      cursor_text_color = "#303446";

      url_color = "#F2D5CF";

      active_border_color = "#BABBF1";
      inactive_border_color = "#737994";
      bell_border_color = "#E5C890";

      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      active_tab_foreground = "#232634";
      active_tab_background = "#CA9EE6";
      inactive_tab_foreground = "#C6D0F5";
      inactive_tab_background = "#292C3C";
      tab_bar_background = "#232634";

      mark1_foreground = "#303446";
      mark1_background = "#BABBF1";
      mark2_foreground = "#303446";
      mark2_background = "#CA9EE6";
      mark3_foreground = "#303446";
      mark3_background = "#85C1DC";

      # Define each of the 16 terminal colors as strings
      color0 = "#51576D";  # black
      color8 = "#626880";  # black (bright)

      color1 = "#E78284";  # red
      color9 = "#E78284";  # red (bright)

      color2 = "#A6D189";  # green
      color10 = "#A6D189"; # green (bright)

      color3 = "#E5C890";  # yellow
      color11 = "#E5C890"; # yellow (bright)

      color4 = "#8CAAEE";  # blue
      color12 = "#8CAAEE"; # blue (bright)

      color5 = "#F4B8E4";  # magenta
      color13 = "#F4B8E4"; # magenta (bright)

      color6 = "#81C8BE";  # cyan
      color14 = "#81C8BE"; # cyan (bright)

      color7 = "#B5BFE2";  # white
      color15 = "#A5ADCE"; # white (bright)

      # Font settings
      font_family = "JetBrains Mono";  # Change this to your preferred font

      font_size = 
        if osConfig.networking.hostName == "aegis" 
          then 18.0          # Set the desired font size
        else 14.0;
    };
  };
}

