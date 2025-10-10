{ pkgs, osConfig, ...}:

let
  discordWindowRule = if osConfig.networking.hostName == "aegis" then 
    ''
      windowrulev2 =  size 1200 800,class:discord
    ''
  else
    ''
      windowrulev2 =  size 860 600,class:discord
    '';
  youtubeWindowRule = if osConfig.networking.hostName == "aegis" then 
    ''
      windowrulev2 = size 1200 800,class:com.github.th_ch.youtube_music
    ''
  else
    ''
      windowrulev2 = size 800 600,class:com.github.th_ch.youtube_music
    '';
  keepassWindowRule = if osConfig.networking.hostName == "aegis" then 
    ''
      windowrulev2 = size 1200 800,class:org.keepassxc.KeePassXC
    ''
  else
    ''
      windowrulev2 = size 860 600,class:org.keepassxc.KeePassXC
    '';
  purerefWindowRule = if osConfig.networking.hostName == "aegis" then 
    ''
      windowrulev2 = size 1200 800,class:PureRef
    ''
  else
    ''
      windowrulev2 = size 500 500,class:PureRef
    '';

  qbittorrent = if osConfig.networking.hostName == "aegis" then 
    ''
      windowrulev2 = size 1200 800,class:org.qbittorrent.qBittorrent
    ''
  else
    ''
      windowrulev2 = size 500 500,class:org.qbittorrent.qBittorrent
    '';
in
  {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    extraConfig = ''
      ${discordWindowRule}
      ${youtubeWindowRule}
      ${keepassWindowRule}
      ${purerefWindowRule}
      ${qbittorrent}
    '';

    xwayland = {
      enable = true;
    };

    systemd = {
      enable = false;
    };

    settings = {
      monitor = (
        if (osConfig.networking.hostName == "aegis") then [
          "DP-3, preferred, 0x0, auto"
          "HDMI-A-1, 2560x1440@60, 2560x0, auto"
        ] else if (osConfig.networking.hostName == "sybils") then [
            "eDP-1,preferred,auto,auto,transform,0"
          ] else [",preferred,auto,auto"]
      );

      exec-once = [
        "swww-daemon"
        "bash ~/.config/start-process/start.sh"
        "bash ~/.config/wallpaper/random_wallpaper_multi.sh"
        "iio-hyprland"
        "mullvad-vpn"
        "marvin"
        "[silent] org.keepassxc.KeePassXC"
        "[silent] com.github.th_ch.youtube_music"
      ];

      env = ([
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE,24"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ]);

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
      };

      workspace = ["name:1, monitor:DP-3, default:true"];

      dwindle = {
        pseudotile = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "intl";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      layerrule = [
        "blur, waybar"
        "ignorealpha 0, waybar"
        "noanim, waybar"
      ];

      windowrule = [
        "float,class:^(kitty)$,title:^(kitty)$"
        "workspace 1,class:Marvin"
        "workspace 2,class:librewolf"
        "workspace 2,class:discord"
        "float,class:discord"
        "center,class:discord"
        "workspace 3,class:com.github.th_ch.youtube_music"
        "float,class:com.github.th_ch.youtube_music"
        "center,class:com.github.th_ch.youtube_music"
        "workspace 2,class:org.keepassxc.KeePassXC"
        "float,class:org.keepassxc.KeePassXC"
        "center,class:org.keepassxc.KeePassXC"
        "tile,class:Aseprite"
        "float,class:PureRef"
        "center,class:PureRef"
        "float,class:org.qbittorrent.qBittorrent"
        "center,class:org.qbittorrent.qBittorrent"
        "float,class:Emulator"
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 0.8;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = "yes";

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%" 
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];};

      "$mod" = "SUPER";
      "$term" = "kitty";
      "$menu" = "rofi -show drun -show-icons";
      bind = [
        "$mod, RETURN, exec, $term"
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod, E, exit"
        "$mod, W, exec, librewolf"
        "$mod_SHIFT, W, exec, ~/.config/wallpaper/random_wallpaper_multi.sh"
        "$mod, SPACE, exec, $menu"
        "$mod, D, exec, [workspace 2; float] discord"
        "$mod, K, exec, [float] keepassxc"
        "$mod, U, exec, unityhub"
        "$mod, G, exec, godot"
        "$mod, O, exec, [float] obsidian"
        "$mod, M, exec, [workspace 1] marvin"
        "$mod, S, exec, kitty pulsemixer"
        "$mod, T, exec, thunderbird"
        "$mod_SHIFT, B, exec, $term bluetuith"
        "$mod_SHIFT, S, exec, hyprshot -m region"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod_SHIFT, left, exec, ~/.config/smart-move/smart-move.sh 'l'"
        "$mod_SHIFT, right, exec, ~/.config/smart-move/smart-move.sh 'r'"
        "$mod_SHIFT, up, exec, ~/.config/smart-move/smart-move.sh 'u'"
        "$mod_SHIFT, down, exec, ~/.config/smart-move/smart-move.sh 'd'"
        "$mod_SHIFT, H, exec, ~/.config/smart-move/smart-move.sh 'l'"
        "$mod_SHIFT, L, exec, ~/.config/smart-move/smart-move.sh 'r'"
        "$mod_SHIFT, K, exec, ~/.config/smart-move/smart-move.sh 'u'"
        "$mod_SHIFT, J, exec, ~/.config/smart-move/smart-move.sh 'd'"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      plugins = {
        touch_gestures = {
          hyprgrass-bind = [
            ", edge:d:u, exec, .config/wvkbd-script/wvkbd-toggle"
          ];

          sensitivity = 2.0;
          workspace_swipe_fingers = 3;
          workspace_swipe_edge = "d";
          long_press_delay = 400;
        };
      };
    };
  };

  wayland.windowManager.hyprland.plugins = 
    [
      pkgs.hyprlandPlugins.hyprgrass
    ];
}
