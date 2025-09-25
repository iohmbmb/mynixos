{ pkgs ? import <nixpkgs> {}}:

let
  pname = "marvin";
  version = "1.68.0";

  src = pkgs.fetchurl {
    url = "amazingmarvin.s3.amazonaws.com/Marvin-1.68.0.AppImage";
    hash = "sha256-c6ql3loog0nU7dcCHe5ba7PEhcyQ+MwTTIAKKT5aOB4=";
  };
in
pkgs.appimageTools.wrapType2 { inherit pname version src; }
