{ pkgs, ... }:

{
  imports = [
    ./dotfiles
    ./packages
  ];

  programs.home-manager.enable = true;

  home = {
    stateVersion = "24.05";

    username = "iohannes";
    homeDirectory = "/home/iohannes";

    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      XDG_SCREENSHOTS_DIR = "$HOME/Pictures/Screenshots";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS =
        "\${HOME}/.steam/root/compatibilitytools.d";
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
      LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib";
    };

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    xdg = {
      enable = true;
      userDirs = {
        enable = true;
        createDirectories = true;
        desktop = null;
        music = null;
        publicShare = null;
        templates = null;
      };
    };
  };
}

