{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch --flake /home/iohannes/.config/nixos/ --fast";
      clean-old = "sudo nix-collect-garbage --delete-old";
    };

    initContent = ''
      neofetch --crop-mode fit --kitty ~/Pictures/Wallpapers/Portrait/
      export CHROME_EXECUTABLE=/etc/profiles/per-user/iohannes/bin/chromium
      export ENV_SECRETS=/home/iohannes/Env
    '';

    history = {
      save = 10000;   
      size = 10000;   
      path = "$HOME/.zsh_history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "gozilla";
    };
  };
}
