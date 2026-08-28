{pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    # Import the layout configuration
    settings = import ./settings.nix { inherit pkgs; };
    
    # Import the CSS layout string
    style = import ./style.nix { };
  };
}
