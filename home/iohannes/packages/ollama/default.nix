{ nixpkgs-unstable, ... }:
let
  unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
in
{
  services.ollama = {
    enable = true;
    package = unstable.ollama-rocm;
  };
}
