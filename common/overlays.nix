{
pkgs,
nur,
...
}:

{
  nixpkgs.overlays = [
    nur.overlays.default
    (final: prev: {  
      godot = prev.godot_4_3.overrideAttrs (oldAttrs: {  
        src = final.fetchFromGitLab {  
          owner = "polyad-misc";  
          repo = "godot";  
          rev = "4248411baf7a81b49e827f3f17d9dcc4b53b6c6a";  
          sha256 = "1xw3raajmlz7q6yxv29qichvhnjrnjsgsarfdchk06a3wdbdw5vm";  
        };  
      }); 
    })  
  ];
}
