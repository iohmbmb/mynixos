{ appimageTools, fetchurl }:
let
  pname = "marvin";
  version = "1.68.0";

  src = fetchurl {
    url = "amazingmarvin.s3.amazonaws.com/Marvin-1.68.0.AppImage";
    hash = "";
  };
in
appimageTools.wrapType2 { inherit pname version src; }
