{config, ...}:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.home.homeDirectory}/.config/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "lsd";
      ll = "lsd -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch --flake /home/iohannes/.config/nixos/ --no-reexec";
      clean-old = "sudo nix-collect-garbage --delete-old";
    };

    initContent = ''
      fastfetch --logo ~/Pictures/Wallpapers/Portrait/
      export CHROME_EXECUTABLE=/etc/profiles/per-user/iohannes/bin/chromium
      export ENV_SECRETS=/home/iohannes/Env
      eval "$(fzf --zsh)"
    '';

    history = {
      save = 10000;   
      size = 10000;   
      path = "${config.home.homeDirectory}/.zsh_history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "direnv"];
      theme = "gozilla";
    };
  };
}
