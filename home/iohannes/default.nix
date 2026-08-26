{ pkgs, ... }:

{
  imports = [
    ./dotfiles
    ./packages
  ];

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland.configType = "hyprlang";
  wayland.windowManager.hyprland.systemd.enable = false;

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

  };

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";
        "application/pdf" = "org.pwmt.zathura.desktop";
        "application/x-pdf" = "org.pwmt.zathura.desktop";
        "application/postscript" = "org.pwmt.zathura.desktop";
        "application/acrobat" = "org.pwmt.zathura.desktop";
        "application/vnd.pdf" = "org.pwmt.zathura.desktop";
        "text/pdf" = "org.pwmt.zathura.desktop";
        "text/x-pdf" = "org.pwmt.zathura.desktop";
        "application/octet-stream" = "org.pwmt.zathura.desktop";
        "image/bmp" = [ "sxiv.desktop" ];
        "image/gif" = [ "sxiv.desktop" ];
        "image/jpeg" = [ "sxiv.desktop" ];
        "image/jpg" = [ "sxiv.desktop" ];
        "image/pjpeg" = [ "sxiv.desktop" ];
        "image/png" = [ "sxiv.desktop" ];
        "image/tiff" = [ "sxiv.desktop" ];
        "image/webp" = [ "sxiv.desktop" ];
        "image/x-bmp" = [ "sxiv.desktop" ];
        "image/x-gray" = [ "sxiv.desktop" ];
        "image/x-icns" = [ "sxiv.desktop" ];
        "image/x-ico" = [ "sxiv.desktop" ];
        "image/x-pcx" = [ "sxiv.desktop" ];
        "image/x-png" = [ "sxiv.desktop" ];
        "image/x-portable-anymap" = [ "sxiv.desktop" ];
        "image/x-portable-bitmap" = [ "sxiv.desktop" ];
        "image/x-portable-graymap" = [ "sxiv.desktop" ];
        "image/x-portable-pixmap" = [ "sxiv.desktop" ];
        "image/x-xbitmap" = [ "sxiv.desktop" ];
        "image/x-xpixmap" = [ "sxiv.desktop" ];
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      music = null;
      publicShare = null;
      templates = null;
      setSessionVariables = false;
    };
  };
}

