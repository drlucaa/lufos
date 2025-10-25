{ stylixImage, ... }:
''
  spawn-at-startup "bash" "-c" "wl-paste --watch cliphist store &"
  spawn-at-startup "swww-daemon"
  spawn-at-startup "swww" "img" "${stylixImage}"
  spawn-at-startup "wal" "-R"
  spawn-at-startup "waybar"
  spawn-at-startup "/usr/lib/mate-polkit/polkit-mate-authentication-agent-1"
  spawn-at-startup "/usr/lib/xdg-desktop-portal-gtk"
  spawn-at-startup "/usr/lib/xdg-desktop-portal-gnome"
  spawn-at-startup "crystal-dock" "-d"
''
