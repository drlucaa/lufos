{ ...}:

{
  home.file = {
    "Pictures/Wallpapers" = {
      source = ../../wallpapers;
      recursive = true;
    };
    ".config/helix".source = ../config/helix;
    ".config/niri".source = ../config/niri;
    ".config/ly".source = ../config/ly;
    ".config/fish" = {
      source = ../config/fish;
      recursive = true;
    };
  };
}
