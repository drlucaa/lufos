{ lib, ... }: {
  programs.alacritty =
    let
      font_family = lib.mkForce "Monaspace Neon";
    in
    {
      enable = true;
      settings = {
        font = {
          normal = {
            family = font_family;
            style = "Regular";
          };
          bold = {
            family = font_family;
            style = "Bold";
          };
          italic = {
            family = font_family;
            style = "Italic";
          };
          bold_italic = {
            family = font_family;
            style = "Bold Italic";
          };
          size = 15;
        };
      };
    };
}
