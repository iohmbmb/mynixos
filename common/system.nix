{ config, pkgs, nixpkgs-unstable, quickshell, ... }:

let 
  externals = import ../external/packages/default.nix {inherit pkgs;};
  unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
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
    firewall = {
      enable = true;
    };
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
    fwupd.enable = config.networking.hostName == "sybils";
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
      enable = false;
      openDefaultPorts = false; # Open ports in the firewall for Syncthing
      user = "owner";
      configDir = "/home/owner/.config/syncthing";
      settings = {
        devices = {
          "caduceus" = {
            id = "52LZQ6D-G6PD6PJ-AICNMAJ-JOM7IGS-RXJ6DKU-SDJMYYA-GUQQI7B-FUDOEA6"; 
          };
          "telemachus" = {
            id = "LUB5HFA-GR6MBXA-MWUVHCW-JQHBMMS-KVDJIOW-RD3Y4T3-TFETDUF-M3VLTQH"; 
          };
        };
        folders = {
        };
      };
    };

    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    picom.enable = true;
    openssh = {
      enable = true;
      ports = [22];
    };
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
    direnv.enable = true;
    gamemode.enable = config.networking.hostName == "aegis";
    steam = {
      enable = config.networking.hostName == "aegis";
      gamescopeSession.enable = config.networking.hostName == "aegis";
    }; 

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    
    iio-hyprland.enable = true;

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        clang
        cmake
        ninja
        jdk
        pkg-config
        virtualglLib
        wayland
		    vulkan-loader
		    libxkbcommon
		    fontconfig
		    lua
		    alsa-utils
		    alsa-lib
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
        android-studio
        librewolf
        discord 
        unityhub 
        godot-custom
        aseprite
        unstable.youtube-music
        blender
        obsidian
        bruno
        dotnet-sdk
        flutter
        go
        gcc
        git
        zola
        scons
        tmux
        stremio
        pureref
        krita
        tor-browser
        mullvad-vpn
        externals.marvin
        woeusb
        qbittorrent
        kdePackages.qtdeclarative
        quickshell.packages."${system}".default
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
      wget
      curl
      xorg.xorgserver
      xorg.xinit
      polybar
      picom
      xwallpaper
      killall
      xorg.xmodmap
      xorg.xev
      rofi
      rofi-wayland
      gnumake
      bluetuith
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
      seahorse
      kitty
      ranger
      mpv
      neovim
      waybar
      dunst
      libnotify
      swaybg
      hyprshot
      jq
      imagemagick
      ffmpeg
      ncdu
      usbutils
      libinput
      wvkbd
      exiftool
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

