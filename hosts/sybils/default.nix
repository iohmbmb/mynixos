{
  imports = [ ../../common/overlays.nix 
    ../../common/system.nix 
    ../../home/home-manager.nix 
    ./hardware.nix 
  ];

  networking.hostName = "sybils";
}
