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
        # Create a background session named 'qwen' running your model with a fake screen size
      new-session -d -s qwen -x 80 -y 24 'ollama run ${ollamaModel}'
    '';
    plugins = [
      pkgs.tmuxPlugins.vim-tmux-navigator
    ];
  };
}
