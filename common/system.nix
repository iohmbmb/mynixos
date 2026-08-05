{ config, pkgs, lib, nixpkgs-unstable, quickshell, silentSDDM, ... }:

let 
  externals = import ../external/packages/default.nix {inherit pkgs;};
  unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
  sddm-theme = silentSDDM.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
    theme = "default";
  };
  hostname = config.networking.hostName;
  mainHost = "aegis";
  secondaryHost = "sybils";
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
      allowedTCPPorts = [ 8384 22000 ];
      allowedUDPPorts = [ 21027 ];
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
    fwupd.enable = hostname == secondaryHost;
    ntp.enable = true;
    libinput.enable = true;

    displayManager = {
      sddm = {
        package = pkgs.kdePackages.sddm; # use qt6 version of sddm
        enable = true;
        theme = sddm-theme.pname;
        extraPackages = sddm-theme.propagatedBuildInputs;
        settings = {
          General = {
            GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";

            InputMethod = "qtvirtualkeyboard";
          };
        };
      };
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
    avahi = { enable = true; nssmdns4 = true;
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
      settings = 
        {
          Resolve = {
            DNSOverTLS = true;
            DNSSEC = true;
            Domains = [ "~." ];
            FallbackDNS = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
          };
        };
    };

    syncthing = {
      enable = true;
      openDefaultPorts = true; # Open ports in the firewall for Syncthing
      user = "iohannes";
      dataDir = "/home/iohannes/.local/share/syncthing";
      configDir = "/home/iohannes/.config/syncthing";
      guiAddress = "127.0.0.1:8384";
      settings = {
        devices = {
          aegis = {id = "HWUPMNN-MO5W2GV-YTPPTWJ-CC3FMT6-A4SBD7H-BNP4WOG-BAPWTNF-2Y6DJQC";};
          phone = {id = "CDPWM3O-RDJRHZ3-7XU4PLD-ZHOY7CO-2DQLJA6-2TAHKR7-RUJ6JNT-Z3YHJQC";};
          device-p = {id = "2IQODMB-2CS4NUI-GJ7OROX-N2BYYM6-UUJEE52-NCISK7I-MA3BK63-2BWOAAE";};
          device-s = {id = "5HVHHOT-WHEREUT-2HSTDRE-GBNGPO4-YK5LPF2-XAUOUGZ-Z4UT7YO-ZANFXQE";};
        };
        folders = { 
          "Polyad" = {
            path = "/home/iohannes/Documents/Obsidian/Polyad";
            folderId = "ksryo-z5qhg";
            devices = ["device-p" "device-s" "aegis"];
          };
          "Nexus" = {
            path = "/home/iohannes/Documents/Obsidian/Nexus";
            devices = ["device-s" "aegis" "phone"];
          };
          "Keepass" = {
            path = "/home/iohannes/Documents/Keepass\ Database";
            devices = ["device-s" "aegis"];
          };
        };
      };
    };

    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    picom.enable = true;
    mullvad-vpn.enable = true;
    mullvad-vpn.package = pkgs.mullvad-vpn;
    openssh = {
      enable = true;
      ports = [22];
    };

    ollama = {
      enable = true; 
      package = pkgs.ollama-rocm;
      environmentVariables = {
        OLLAMA_CONTEXT_LENGTH = "32768";
      };
    };
  };

  security.rtkit.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  programs = {
    virt-manager.enable = true;
    gnome-disks.enable = true;
    zsh.enable = true;
    direnv.enable = true;
    gamemode.enable = true;
    steam = lib.mkIf(hostname == mainHost){
      enable = true;
      gamescopeSession.enable = true;
    }; 

    hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };

    iio-hyprland.enable = true;
    nix-ld = {
      enable = true;
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
        android-studio
        librewolf
        chromium
        discord 
        unityhub 
        godot-custom
        aseprite
        unstable.pear-desktop
        unstable.blender
        obsidian
        bruno
        dotnet-sdk_9
        flutter
        go
        nodejs
        csharp-ls
        nil
        typescript-language-server
        tailwindcss-language-server
        clang-tools
        basedpyright
        gcc
        git
        zola
        sass
        docker
        scons
        tmux
        krita
        mullvad-vpn
        externals.marvin
        woeusb
        qbittorrent
        libreoffice
        kdePackages.qtdeclarative
        quickshell.packages."${stdenv.hostPlatform.system}".default
        vscode-langservers-extracted
        linuxKernel.packages.linux_zen.xpadneo
        readest
        jetbrains.rider
        stremio-linux-shell
        nwg-look
      ];# ++ lib.optional (hostname == mainHost);
    };

    groups.libvirtd.members = ["iohannes"];
    extraUsers.iohannes.extraGroups = ["audio" "adbusers" "kvm" "docker"];
    defaultUserShell = pkgs.zsh;
  };

  environment = {
    sessionVariables = {
      HYPRSHOT_DIR = "/home/iohannes/Pictures/Screenshots";
    };
    systemPackages = with pkgs; [
      wget
      curl
      xorg-server
      xinit
      xmodmap
      xev
      polybar
      picom
      xwallpaper
      killall
      rofi
      gnumake
      cmake
      bluetuith
      btop
      unzip
      zip
      p7zip
      unrar
      hyfetch
      pulsemixer 
      sxiv
      zathura
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
      wf-recorder
      ncdu
      usbutils
      libinput
      wvkbd
      svkbd
      exiftool
      cameractrls-gtk3
      sddm-theme
      pkg-config
      lsd
      fzf
      lsof
      android-tools
      doctest
      file
      ripgrep
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
        "librewolf-152.0-1"
        "librewolf-unwrapped-152.0-1"
        "electron-33.4.11"
      ];
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
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

