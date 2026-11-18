{ pkgs, osConfig, ...}:
let
  hostname = osConfig.networking.hostName;

  ollamaModel = if hostname == "aegis" 
                then "qwen2.5-coder:14b-base" 
                else "qwen2.5-coder:7b-base";
in
{
  programs.tmux = {
    enable = true;
    shortcut = "b";
    newSession = true;
    keyMode = "vi";
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
