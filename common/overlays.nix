{
nur,
...
}:

{
  nixpkgs.overlays = [
    nur.overlays.default
    (final: prev: {  
      godot-custom = prev.godot_4_3.overrideAttrs (oldAttrs: {  
        src = final.fetchFromGitLab {  
          owner = "polyad-misc";  
          repo = "godot";  
          rev = "3e4f2982ff2169f6552b55823807f6dbf85ef36a";  
          hash = "sha256-SmxJgnXTkFPKShD1XM060t+PaCWG5lENt7+XG9fVxjo=";  
        };  
      }); 
    })  
    (final: prev: {
      iio-sensor-proxy = prev.iio-sensor-proxy.overrideAttrs (oldAttrs: {
        postPatch = oldAttrs.postPatch + ''
      sed -i -e 's/.*iio-buffer-accel/#&/' data/80-iio-sensor-proxy.rules
        '';
      });
    })
  ];
}
