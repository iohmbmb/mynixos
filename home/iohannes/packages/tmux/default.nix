{ pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    newSession = true;
    clock24 = true;
    extraConfig = ''
        bind h split-window -h # Split panes horizontal
        bind v split-window -v # Split panes vertically
    '';
    plugins = [
      pkgs.tmuxPlugins.vim-tmux-navigator
    ];
  };
}
