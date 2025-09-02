{
inputs,
nvf,
home-manager,
...
}:

{
  imports = [ home-manager.nixosModules.default ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.iohannes = import ./iohannes;
    extraSpecialArgs = {inherit inputs;};
    sharedModules = [nvf.homeManagerModules.default];
    backupFileExtension = "back";
  };
}
