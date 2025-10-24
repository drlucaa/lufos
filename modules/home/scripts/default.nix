{
  pkgs,
  username,
  host,
  profile,
  ...
}: {
  home.packages = [
    (import ./emopicker9000.nix {inherit pkgs;})
    (import ./task-waybar.nix {inherit pkgs;})
    (import ./nvidia-offload.nix {inherit pkgs;})
    (import ./wallsetter.nix {
      inherit pkgs;
      inherit username;
    })
    (import ./screenshootin.nix {inherit pkgs;})
    (import ./hm-find.nix {inherit pkgs;})
  ];
}
