{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$term" = "kitty";
    "$menu" = "rofi -show drun";
    bind = [
      "$mod, RETURN, exec, $term"
      "$mod, Q, killactive"
      "$mod, F, fullscreen"
      "$mod, V, togglefloating"
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
}
