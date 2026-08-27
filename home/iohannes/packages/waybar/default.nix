{pkgs, ...}:
{
  programs.waybar = {
    enable = true;

    # Import the layout configuration
    settings = import ./settings.nix { inherit pkgs; };
    
    # Import the CSS layout string
    style = import ./style.nix { };
  };
}
