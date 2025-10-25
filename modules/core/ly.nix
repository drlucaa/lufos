{ ... }:

{
  # Ensure greetd is disabled when ly is enabled
  services.greetd.enable = false;

  # Enable ly with the Matrix animation
  # Animations: "doom", "colormix", "matrix"
  services.displayManager.ly = {
    enable = true;
    settings = {
      save_file = "/etc/ly/save";
      hide_border = true;
      min_refresh_delta = 5;
    };
  };

}
