{ pkgs, osConfig, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    xwayland = {
      enable = true;
    };

    systemd = {
      enable = false;
    };

    settings = {
      monitor = (
        if (osConfig.networking.hostName == "aegis") then [
          "HDMI-A-1, 2560x1440@60, 2560x0, 1"
          "HDMI-A-2, 2560x1440@60, auto, 1"
        ] else if (osConfig.networking.hostName == "sybils") then [
            "eDP-1,preferred,auto, auto"
            ",preferred, auto, 1, mirror, eDP-1"
          ] else [",preferred,auto,auto"]
      );

      exec-once = [
        "swww-daemon"
        "bash ~/.config/start-process/start.sh"
        "bash ~/.config/wallpaper/random_wallpaper_multi.sh"
        "iio-hyprland"
        "mullvad-vpn"
        "marvin"
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

      #workspace = [
      #  "1, monitor:HDMI-A-1, default:true"
      #  "2, monitor:HDMI-A-2, default:true"
      #  "3, monitor:HDMI-A-1, default:true, persistent:true"
      #  "4, monitor:HDMI-A-2, default:true, persistent:true"
      #];

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

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      windowrule = [
        "float on, match:class ^(kitty)$, match:title ^(kitty)$"
        "workspace 2, match:class librewolf"
        "workspace 2, match:class discord"
        "float on, match:class discord"
        "float on, match:class marvin"
        "workspace 1, match:class marvin"
        "center on, match:class discord"
        "float on, match:class kiwix"
        "center on, match:class kiwix"
        "workspace 3, match:class com.github.th_ch.youtube_music"
        "float on, match:class com.github.th_ch.youtube_music"
        "center on, match:class com.github.th_ch.youtube_music"
        "workspace 2, match:class org.keepassxc.KeePassXC"
        "float on, match:class org.keepassxc.KeePassXC"
        "center on, match:class org.keepassxc.KeePassXC"
        "tile on, match:class Aseprite"
        "tile on, match:class Godot"
        "float on, match:class org.qbittorrent.qBittorrent"
        "center on, match:class org.qbittorrent.qBittorrent"
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
      "$menu" = "rofi -show combi -combi-modes 'window,drun,ssh' -modes combi -show-icons -font 'Hack Nerd 18'";
      bind = [
        "$mod, RETURN, exec, $term"
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod, P, exec, poweroff"
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
        "$mod, B, exec, [workspace 3] blender"
        "$mod_SHIFT, B, exec, $term bluetuith"
        "$mod_SHIFT, S, exec, hyprshot -m region"
        "$mod, R, exec, ~/.config/screen-record/start-record.sh"
        "$mod, X, exec, ~/.config/screen-record/stop-record.sh"
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
    };
  };
}
