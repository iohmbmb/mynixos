{ config, pkgs, quickshell, ... }:

let 
  mullvad-autostart = pkgs.makeAutostartItem {
    name = "mullvad-vpn";
    package = pkgs.mullvad-vpn;
  };
in
{

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than-30d";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      download-buffer-size = 524288000;
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    nameservers = ["1.1.1.1" "1.0.0.1" "2606:4700:4700::1111" "2606:4700:4700::1001"];
  };

  time = {
    timeZone = "Europe/Paris";
    hardwareClockInLocalTime = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    useXkbConfig = true; # use xkb.options in tty.
  };

  system = {
    userActivationScripts = {
      stdio = {
        text = ''
          rm -f ~/Android/Sdk/platform-tools/adb
          ln -s /run/current-system/sw/bin/adb ~/Android/Sdk/platform-tools/adb
        '';
        deps = [];
      };
    };
  };
  services = {
    ntp.enable = true;
    libinput.enable = true;

    displayManager = {
      sddm.enable = true;
    };

    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "intl";
      };
    };

    printing = {
      enable = true;
      drivers = [pkgs.gutenprint];
      browsing = true;
      browsedConf =''
    BrowseDNSSDSubTypes _cups,_print
    BrowseLocalProtocols all
    BrowseRemoteProtocols all
    CreateIPPPrinterQueues All
    BrowseProtocols all'';
    };

    # This is to auto-detect printers on the network
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
      dnsovertls = "true";
    };

    syncthing = {
      enable = true;
      openDefaultPorts = true; # Open ports in the firewall for Syncthing
      user = "iohannes";
      configDir = "/home/iohannes/.config/syncthing";
      settings = {
        devices = {
          "caduceus" = {
            id = "52LZQ6D-G6PD6PJ-AICNMAJ-JOM7IGS-RXJ6DKU-SDJMYYA-GUQQI7B-FUDOEA6"; 
          };
          "telemachus" = {
            id = "LUB5HFA-GR6MBXA-MWUVHCW-JQHBMMS-KVDJIOW-RD3Y4T3-TFETDUF-M3VLTQH"; 
          };
            #"backup" = {
            #id = "FQGKTN2-BQPU4FX-Q5ASJDU-2YEPMIJ-2BO773U-BFEENJX-PFBXLC2-AB5Z2AE"; 
          #};
        };
        folders = {
          "Nexus" = {
            id = "jd7s7-kohkx";
            path = "/home/iohannes/Documents/Obsidian/Nexus";
            devices = [ "caduceus" ];
            ignorePerms = true;
          };
          "KeypassDB" = {
            id = "yo99t-3hg9y";
            path = "/home/iohannes/Documents/Keypass\ Database";
            devices = [ "caduceus" ];
            ignorePerms = true;
          };
          "Wallpapers" = {
            id = "0b065-bt7xz";
            path = "/home/iohannes/Pictures/Wallpapers";
            devices = [ "caduceus" ];
            ignorePerms = true;
          };
          "WhatsApp" = {
            id = "r6vag-4nxpl";
            path = "/home/iohannes/Pictures/WhatsApp";
            devices = [ "telemachus" ];
            ignorePerms = true;
          };
        };
      };
    };

    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    picom.enable = true;
    openssh.enable = true;
    mullvad-vpn.enable = true;
  };

  security.rtkit.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  programs = {
    virt-manager.enable = true;
    gnome-disks.enable = true;
    zsh.enable = true;
    adb.enable = true;
    thunderbird.enable = true;

    gamemode.enable = config.networking.hostName == "aegis";
    steam = {
      enable = config.networking.hostName == "aegis";
      gamescopeSession.enable = config.networking.hostName == "aegis";
    }; 

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        clang
        cmake
        ninja
        jdk
        pkg-config
        virtualglLib
        sfml
        raylib
      ];
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  qt.enable = true;

  users = {
    users.iohannes = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbusers" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        keepassxc
        jetbrains.rider
        vivaldi
        librewolf
        chromium
        discord 
        unityhub 
        blender
        godot
        lutris
        obsidian
      ];
    };

    groups.libvirtd.members = ["iohannes"];
    extraUsers.iohannes.extraGroups = ["audio" "adbusers" "kvm"];
    defaultUserShell = pkgs.zsh;
  };


  environment = {
    sessionVariables = {
      HYPRSHOT_DIR = "/home/iohannes/Pictures/Screenshots";
    };
    systemPackages = with pkgs; [
      android-studio
      devenv
      wget
      curl
      xorg.xorgserver
      xorg.xinit
      polybar
      picom
      xwallpaper
      gcc
      killall
      xorg.xmodmap
      xorg.xev
      go
      rofi
      rofi-wayland
      gnumake
      bruno
      dotnet-sdk
      bluetuith
      git
      btop
      unzip
      zip
      p7zip
      unrar
      neofetch
      pulsemixer 
      sxiv
      zathura
      curl  
      xwallpaper 
      cobra-cli
      seahorse
      zola
      scons
      tmux
      kitty
      ranger
      mpv
      neovim
      waybar
      dunst
      libnotify
      swww
      hyprshot
      jq
      kdePackages.qtdeclarative
      imagemagick
      pureref
      flutter
      aseprite
      nix-prefetch-git
      mullvad-vpn
      ncdu
      quickshell.packages."${system}".default
    ];
  };      

  # Enable unfree packages
  nixpkgs = {
    config = {
      android_sdk = {
        accept_license = true;
      };
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-25.9.0" 
        "qbittorrent-4.6.4"
        "electron-33.4.11"
      ];
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    material-icons
    material-design-icons
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
  ];

  system.stateVersion = "23.11";
}

