{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "nerdwerd";
        email = "nerdwerd@gangoons.com";
      };
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
