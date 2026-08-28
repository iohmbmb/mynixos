{ pkgs, ...}:
{
  imports = [
    ./monitors.nix
    ./start-up.nix
    ./environment.nix
    ./general.nix 
    ./rules.nix
    ./decorations.nix
    ./animations.nix
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = false;
  };
}
