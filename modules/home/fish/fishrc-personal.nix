{pkgs, ...}: {
  home.packages = with pkgs; [fish];

  home.file.".fishrc-personal".text = ''
    # This file allows you to define your own Fish shell customizations
    # Below are examples migrated from zshrc-personal

    # Environment variables
    set -gx BROWSER "flatpak run app.zen_browser.zen"
    set -gx EDITOR hx
    set -gx VISUAL hx
    set -gx LANG en_US.UTF-8
  '';
}
