{ ... }:

{
  programs.git = {
    enable = true;
    userName = "nerdwerd";
    userEmail = "nerdwerd@gangoons.com";
    extraConfig = {
      init = { defaultBranch = "master"; };
    };

    lfs = {
      enable = true;
    };
  };

  programs.lazygit = { 
    enable = true;
  };
}
