{ pkgs, ...}:
{
    programs.tmux = {
        enable = true;
        shortcut = "b";
        newSession = false;
        keyMode = "vi";
        clock24 = true;
        extraConfig = ''
        bind h split-window -h # Split panes horizontal
        bind v split-window -v # Split panes vertically
        set -g @resurrect-hook-pre-restore-pane-processes 'tmux switch-client -n && tmux kill-session -t=0'
        '';
        plugins = [
            pkgs.tmuxPlugins.vim-tmux-navigator
            pkgs.tmuxPlugins.resurrect
        ];
    };
}
