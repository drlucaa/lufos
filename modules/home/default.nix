{host, lib, ...}: let
  variables = import ../../hosts/${host}/variables.nix;
  inherit (variables) waybarChoice;

  # New variable system
  windowManager = variables.windowManager or "hyprland";
  barChoice = variables.barChoice or "waybar";

  # Legacy variable support (backwards compatibility)
  enableDMS = variables.enableDankMaterialShell or false;
  legacyBarChoice = if enableDMS then "dms" else "waybar";
  actualBarChoice = if variables ? barChoice then barChoice else legacyBarChoice;

in {
  imports = [
    ./amfora.nix
    ./bash.nix
    ./bashrc-personal.nix
    ./bat.nix
    ./bottom.nix
    ./btop.nix
    ./cava.nix
    ./config.nix
    ./emoji.nix
    ./eza.nix
    ./fastfetch
    ./fish
    ./fzf.nix
    ./gh.nix
    ./ghostty.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./kitty.nix
    ./lazygit.nix
    ./nvf.nix
    ./nwg-drawer.nix
    ./obs-studio.nix
    ./qt.nix
    ./scripts
    ./stylix.nix
    ./swappy.nix
    ./swaync.nix
    ./tealdeer.nix
    ./tmux.nix
    ./virtmanager.nix
    ./wlogout
    ./walker.nix
    ./xdg.nix
    ./yazi
    ./zoxide.nix
    ./environment.nix
  ]

  # Window Manager - conditional import based on windowManager variable
  ++ lib.optionals (windowManager == "niri") [
    ./niri
  ]
  ++ lib.optionals (windowManager == "hyprland") [
    ./hyprland
  ]

  # Bar - conditional import based on barChoice variable
  ++ lib.optionals (actualBarChoice == "dms") [
    ./dank-material-shell
  ]
  ++ lib.optionals (actualBarChoice == "noctalia") [
    ./noctalia-shell
  ]
  ++ lib.optionals (actualBarChoice == "waybar") [
    waybarChoice
  ];
}
