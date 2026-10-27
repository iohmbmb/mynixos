{pkgs, inputs, ...}:

let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
in
{
    wayland.windowManager.hyprland.plugins = [
        pkgs-unstable.hyprlandPlugins.hyprgrass
    ];
}
