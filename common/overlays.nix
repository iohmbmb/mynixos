{
nur,
...
}:

{
  nixpkgs.overlays = [
    nur.overlays.default
    (final: prev: {  
      godot-custom = prev.godotPackages_4_3.godot.overrideAttrs (oldAttrs: {  
        src = final.fetchFromGitLab {  
          owner = "polyad-misc";  
          repo = "godot";  
          rev = "4248411baf7a81b49e827f3f17d9dcc4b53b6c6a";  
          sha256 = "1xw3raajmlz7q6yxv29qichvhnjrnjsgsarfdchk06a3wdbdw5vm";  
        };  

        patches = (oldAttrs.patches or []) ++ [
          (prev.fetchpatch {
            name = "wayland-header-fix.patch";
            url = "https://github.com/godotengine/godot/commit/6ce71f0fb0a091cffb6adb4af8ab3f716ad8930b.patch";
            hash = "sha256-hgAtAtCghF5InyGLdE9M+9PjPS1BWXWGKgIAyeuqkoU=";
          })
        ];
      }); 
    })  
  ];
}
