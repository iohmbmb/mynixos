{
pkgs,
nur,
...
}:

{
  nixpkgs.overlays = [
    nur.overlays.default
  ];
}
