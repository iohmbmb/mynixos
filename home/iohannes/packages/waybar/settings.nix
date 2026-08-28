{ pkgs, ... }: {
  mainBar = {
    layer = "top";
    position = "top";
    height = 36;

    # Keep all modules on the exact same row layout
    modules-left = [ "hyprland/workspaces" "custom/weather" ];
    modules-center = [ "clock" ];
    modules-right = [ "pulseaudio" "backlight" "network" "battery" "tray"];

    # Automatically imports and merges all module logic
    } // (import ./modules.nix { inherit pkgs; });
}
