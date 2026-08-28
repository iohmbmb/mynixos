{ osConfig, ... }:

{
  # setup config files
  home.file.kitty = {
    source = ./.config/kitty/conf;
    target = "/home/iohannes/.config/kitty";
    recursive = true;
  };

  home.file."/home/iohannes/.config/kitty/host-specific.conf".text = ''
  font_size ${if osConfig.networking.hostName == "sybils" then "20.0" else "22.0"}
  '';

  home.file.rofi = {
    source = ./.config/rofi;
    target = "/home/iohannes/.config/rofi";
    recursive = true;
  };

  home.file.dunst = {
    source = ./.config/dunst;
    target = "/home/iohannes/.config/dunst";
    recursive = true;
  };

  home.file.smart-move = {
    source = ./.settings/smart-move;
    target = "/home/iohannes/.config/smart-move";
    recursive = true;
  };

  home.file.start-process = {
    source = ./.settings/start-process;
    target = "/home/iohannes/.config/start-process";
    recursive = true;
  };

  home.file.wallpaper = {
    source = ./.settings/wallpaper;
    target = "/home/iohannes/.config/wallpaper";
    recursive = true;
  };

  home.file.svkbd-script = {
    source = ./.settings/svkbd-script;
    target = "/home/iohannes/.config/svkbd-script";
    recursive = true;
  };

  home.file.screen-record = {
    source = ./.settings/screen-record;
    target = "/home/iohannes/.config/screen-record";
    recursive = true;
  };

  home.file.waybar = {
    source = ./.settings/widgets;
    target = "/home/iohannes/.config/waybar";
    recursive = true;
  };
}
