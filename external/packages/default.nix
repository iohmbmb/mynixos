# default.nix

{ pkgs, ... }:  # Take `pkgs` (Nixpkgs) and other arguments
  {
    # Define your list of applications here
    marvin = pkgs.callPackage ./marvin/default.nix {};
  }

