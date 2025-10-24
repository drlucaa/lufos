{pkgs, lib, zen-browser, ...}: {
  # This file defines the system-wide packages and program settings for the core system.

  # --------------------------------------------------------------------------------
  # Program-specific Modules
  #
  # Enable and configure programs that have dedicated NixOS modules.
  # This is the preferred method as it often handles services and configurations automatically.
  # --------------------------------------------------------------------------------
  programs = {
    # Neovim (installed but not default editor)
    neovim.enable = false;
    neovim.defaultEditor = false;

    dconf.enable = true;
    seahorse.enable = true; # Passwords and keys manager
    hyprland = {
      enable = true;
      package = pkgs.hyprland; # Using unstable nixpkgs for latest version
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
    hyprlock.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true; # Network diagnostic tool
    adb.enable = true; # Android Debug Bridge
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # --------------------------------------------------------------------------------
  # Virtualization
  # --------------------------------------------------------------------------------
  virtualisation.libvirtd.enable = true; # For GNOME Boxes and other libvirt clients

  # --------------------------------------------------------------------------------
  # Nixpkgs Configuration
  # --------------------------------------------------------------------------------
  nixpkgs.config = {
    allowUnfree = true;
    # allowUnfreePredicate = pkg:
    #   builtins.elem (lib.getName pkg) [
    #     "cursor"
    #     "zed"
    #     "jdk"
    #     "claude"
    #   ];
  };

  # --------------------------------------------------------------------------------
  # System-wide Packages
  #
  # These packages are made available to all users in the system's PATH.
  # They are grouped by category for better organization.
  # --------------------------------------------------------------------------------
  environment.systemPackages = with pkgs; [
    # --- System Utilities ---
    appimage-run # For AppImage support
    brightnessctl # Screen brightness control
    cmatrix # Matrix movie effect
    cowsay # Fun terminal program
    duf # Disk usage utility
    dysk # Another disk usage utility
    gdu # Graphical disk usage
    glxinfo # For `inxi -G` GPU info
    gping # Graphical ping
    greetd.tuigreet # Login manager
    htop # System monitor
    inxi # System information tool
    killall # Kills all instances of a program
    libnotify # For notifications
    lm_sensors # Hardware temperatures
    lolcat # Rainbow colors in terminal
    lshw # Detailed hardware information
    ncdu # Disk usage analyzer
    nitch # Small fetch utility
    pavucontrol # Audio levels & devices
    pciutils # PCI device inspection
    pkg-config # Package information tool
    socat # Needed for screenshots
    unrar # For .rar files
    unzip # For .zip files
    usbutils # USB device tools
    v4l-utils # For OBS virtual camera, etc.
    wget # File downloader

    # --- GUI Applications ---
    amfora # Gemini protocol browser
    eog # Image viewer
    file-roller # Archive manager
    gedit # Simple text editor
    gimp # Photo editor
    nemo # File manager
    nemo-fileroller # Nemo archive integration
    nwg-displays # Display manager GUI
    nwg-drawer # Application drawer
    nwg-look # GTK theme switcher
    popsicle # USB flasher
    rhythmbox # Music player
    waypaper # Wallpaper GUI
    xwayland-satellite # X11 app support

    # --- Development Tools ---
    docker-compose # Docker container orchestration
    jdk # Java Development Kit
    nil # Nix language server
    nixd # Nix language server
    nixfmt-rfc-style # Nix formatter
    helix # Tui editor
    jujutsu # Git compatible vcs
    jjui # Tui for jujutsu
    zed-editor # AI-powered code editor

    # --- Terminal Tools ---
    bottom # btop-like utility
    eza # `ls` replacement
    ffmpeg # Video/audio editing
    onefetch # Git information tool
    playerctl # Media player control
    ripgrep # `grep` replacement
    sox # Audio support for ffmpeg
    ytmdl # YouTube music downloader

    # --- Web Browsers & Communication ---
    teams-for-linux
    vesktop # Discord alternative
    zen-browser

    # --- Other Applications ---
    audacity
    discord
    gamescope
    gnome-boxes # Simple VM manager
    gum # Glamorous shell scripts
    gtk3
    gtk4
    localsend
    mpv # Video player
    obsidian
    picard # Music tagger
    quick-webapps # Create web apps
    quickemu # Fast VM creation
    quickgui # GUI for quickemu
  ];
}
