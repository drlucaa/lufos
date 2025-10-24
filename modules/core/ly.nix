{ config, lib, pkgs, ... }:
{
  # Ensure greetd is disabled when ly is enabled
  services.greetd.enable = lib.mkIf config.services.displayManager.ly.enable (lib.mkForce false);

  # Enable ly with the Matrix animation
  # Animations: "doom", "colormix", "matrix"
  services.displayManager.ly = {
    enable = lib.mkDefault true;
  };

}
