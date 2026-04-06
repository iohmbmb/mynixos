{ lib, ... }:

{
  programs.opencode = {
    enable = lib.mkDefault false;
  };
}
