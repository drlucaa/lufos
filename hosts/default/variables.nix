{
  # --- User Identification ---
  # Used for Git commits and general user info.
  gitUsername = "Luca Fondo";
  gitEmail = "luca.fondo@trai.ch";

  # --- Core Desktop Choices ---
  # The window manager to use. This is a fundamental choice.
  # Options: "niri", "hyprland"
  # windowManager = "hyprland";

  # The bar/shell to use. This is your main desktop interface.
  # Options: "dms" (Dank Material Shell), "noctalia", "waybar"
  barChoice = "waybar";

  # The default shell for your terminal.
  # Options: "fish", "zsh"
  defaultShell = "zsh";

  # --- Display & Input ---
  # Configure your monitors here. Run `hyprctl monitors` to get the correct values.
  # Example: "monitor=HDMI-A-1,1920x1080@60,auto,1"
  extraMonitorSettings = ''
  monitor=,preferred,auto,1
  '';

  # Keyboard layout settings
  keyboardLayout = "us";
  consoleKeyMap = "us";

  # --- Default Programs ---
  browser = "zen";
  terminal = "ghostty";

  # --- Stylix Theming ---
  # Enable system-wide theming from your wallpaper.
  stylixEnable = true;
  # Path to the wallpaper you want to use for theming.
  stylixImage = ../../wallpapers/15.png;

  # --- Hardware & Drivers ---
  # For Nvidia Prime (hybrid graphics on laptops). Find these with `lspci | grep VGA`.
  intelID = "PCI:0:2:0";
  nvidiaID = "PCI:1:0:0";

  # --- Feature Toggles ---
  # Set these to `true` or `false` to enable or disable features for this host.
  enableNFS = false;               # Network File System
  printEnable = false;             # Printing support
  thunarEnable = true;             # Thunar file manager
  controllerSupportEnable = false; # Gaming controller support
  flutterdevEnable = false;        # Flutter development environment
  syncthingEnable = false;         # File synchronization

  # --- Window Manager Specific Settings ---

  # Hyprland Animations
  # Ignored if windowManager is not "hyprland".
  # Options: animations-def.nix, animations-end4.nix, etc.
  animChoice = ../../modules/home/hyprland/animations-end4.nix;

  # Waybar Choice
  # This is only used if `barChoice` is set to "waybar".
  waybarChoice = ../../modules/home/waybar/waybar-ddubs.nix;
  clock24h = true; # For Waybar clock format

  # Startup Applications (for Hyprland)
  # Ignored if windowManager is not "hyprland".
  startupApps = [
    # "exec-once = my-app"
  ];
}
