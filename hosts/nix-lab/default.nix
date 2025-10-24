{inputs, pkgs, ...}: {
  imports = [
    ./host-packages.nix
    ./disko.nix
    inputs.disko.nixosModules.disko
  ];

  # Enable ly display manager
  services.displayManager.ly.enable = true;

  # Keep niri available at system level for ly display manager to detect it
  programs.niri.package = pkgs.niri;

  # Ensure niri session is available to display manager
  services.displayManager.sessionPackages = [ pkgs.niri ];
}
