{ ... }:

{
  # setup config files
  home.file.kitty = {
    source = ./.config/kitty/conf;
    target = "/home/iohannes/.config/kitty";
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
}
