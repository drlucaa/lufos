{ pkgs, ... }:

{
  # Install Niri and related packages
  home.packages = with pkgs; [
    niri
    udiskie
    xwayland-satellite
    swww
    grim
    slurp
    wl-clipboard
    swappy
  ];

  # XWayland satellite service for X11 app support
  systemd.user.services.xwayland-satellite = {
    Unit = {
      Description = "Xwayland outside Wayland";
      BindsTo = "graphical-session.target";
      After = "graphical-session.target";
    };
    Service = {
      Type = "notify";
      NotifyAccess = "all";
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      StandardOutput = "journal";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  # Place wallpapers in home directory
  home.file = {
    ".face.icon".source = ../hyprland/face.jpg;
    ".config/face.jpg".source = ../hyprland/face.jpg;
  };
}
