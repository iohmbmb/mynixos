{pkgs, ...}: {

  mainBar = {
    layer = "top";
    position = "top";
    height = 30;

    # Decide where the modules go
    modules-left = [ "hyprland/workspaces" ];
    modules-center = [ "clock" ];
    # Added "network" to the right modules list
    modules-right = [ "pulseaudio" "backlight" "network" "tray" ];
  } // (import ./modules.nix {inherit pkgs;});
}
