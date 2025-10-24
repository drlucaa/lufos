{
  host,
  terminal,
  browser,
  ...
}:
''
    binds {
        // === System & Overview ===
        Mod+X repeat=false { toggle-overview; }
        Mod+O repeat=false { toggle-overview; }
        Mod+Shift+Slash { show-hotkey-overlay; }

        // === Application Launchers ===
        Mod+T hotkey-overlay-title="Open Terminal" { spawn "${terminal}"; }
        Mod+Space hotkey-overlay-title="Application Launcher" {
        spawn "walker";
        }
        Mod+Shift+V hotkey-overlay-title="Clipboard Manager" {
          spawn "dms" "ipc" "call" "clipboard" "toggle";
        }
        Mod+M hotkey-overlay-title="Task Manager" {
          spawn "dms" "ipc" "call" "processlist" "toggle";
        }
        Mod+Alt+S hotkey-overlay-title="Settings" {
          spawn "dms" "ipc" "call" "settings" "toggle";
        }
        Mod+N hotkey-overlay-title="Notification Center" { spawn "dms" "ipc" "call" "notifications" "toggle"; }
        Mod+Shift+N hotkey-overlay-title="Notepad" { spawn "dms" "ipc" "call" "notepad" "toggle"; }

        // === Security ===
        Mod+Alt+L hotkey-overlay-title="Lock Screen" {
          spawn "dms" "ipc" "call" "lock" "lock";
        }
        Super+L hotkey-overlay-title="Hyprlock" { spawn "hyprlock"; }
        Mod+Shift+Q { quit; }
        Ctrl+Alt+Delete hotkey-overlay-title="Task Manager" {
          spawn "dms" "ipc" "call" "processlist" "toggle";
        }

        // === Audio Controls ===
        XF86AudioRaiseVolume allow-when-locked=true {
          spawn "dms" "ipc" "call" "audio" "increment" "3";
        }
        XF86AudioLowerVolume allow-when-locked=true {
          spawn "dms" "ipc" "call" "audio" "decrement" "3";
        }
        XF86AudioMute allow-when-locked=true {
          spawn "dms" "ipc" "call" "audio" "mute";
        }
        XF86AudioMicMute allow-when-locked=true {
          spawn "dms" "ipc" "call" "audio" "micmute";
        }

        // === Keyboard Brightness Controls ===
        XF86KbdBrightnessUp allow-when-locked=true {
          spawn "kbdbrite.sh" "up";
        }
        XF86KbdBrightnessDown allow-when-locked=true {
          spawn "kbdbrite.sh" "down";
        }

        // === Monitor Brightness Controls ===
        XF86MonBrightnessUp allow-when-locked=true {
         spawn "dms" "ipc" "call" "brightness" "increment" "5" "";
        }
        XF86MonBrightnessDown allow-when-locked=true {
         spawn "dms" "ipc" "call" "brightness" "decrement" "5" "";
        }

        // === Window Management ===
        Mod+Q repeat=false { close-window; }
        Mod+Alt+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }
        Mod+W { toggle-window-floating; }
        Mod+Ctrl+W { switch-focus-between-floating-and-tiling; }
        Mod+V { toggle-column-tabbed-display; }

        // === Focus Navigation ===
        Mod+Left  { focus-column-left; }
        Mod+Down  { focus-window-down; }
        Mod+Up    { focus-window-up; }
        Mod+Right { focus-column-right; }
        Mod+H     { focus-column-left; }
        Mod+J     { focus-window-down; }
        Mod+K     { focus-window-up; }
        Mod+L     { focus-column-right; }

        // === Window Movement ===
        Mod+Shift+Left  { move-column-left; }
        Mod+Shift+Down  { move-window-down; }
        Mod+Shift+Up    { move-window-up; }
        Mod+Shift+Right { move-column-right; }
        Mod+Shift+H     { move-column-left; }
        Mod+Shift+J     { move-window-down; }
        Mod+Shift+K     { move-window-up; }
        Mod+Shift+L     { move-column-right; }

        // === Column Navigation ===
        Mod+Home { focus-column-first; }
        Mod+End  { focus-column-last; }
        Mod+Ctrl+Home { move-column-to-first; }
        Mod+Ctrl+End  { move-column-to-last; }

        // === Monitor Navigation ===
        Mod+Ctrl+Left  { focus-monitor-left; }
        Mod+Ctrl+Right { focus-monitor-right; }
        Mod+Ctrl+H     { focus-monitor-left; }
        Mod+Ctrl+J     { focus-monitor-down; }
        Mod+Ctrl+K     { focus-monitor-up; }
        Mod+Ctrl+L     { focus-monitor-right; }

        // === Move to Monitor ===
        Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

        // === Workspace Navigation ===
        Mod+U                { focus-workspace-down; }
        Mod+I                { focus-workspace-up; }
        Mod+Ctrl+Down        { focus-workspace-down; }
        Mod+Ctrl+Up          { focus-workspace-up; }
        Mod+Ctrl+Alt+Down    { move-column-to-workspace-down; }
        Mod+Ctrl+Alt+Up      { move-column-to-workspace-up; }

        // === Move Workspaces ===
        Mod+Shift+Page_Down { move-workspace-down; }
        Mod+Shift+Page_Up   { move-workspace-up; }
        Mod+Shift+U         { move-workspace-down; }
        Mod+Shift+I         { move-workspace-up; }

        // === Mouse Wheel Navigation ===
        Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

        Mod+WheelScrollRight      { focus-column-right; }
        Mod+WheelScrollLeft       { focus-column-left; }
        Mod+Ctrl+WheelScrollRight { move-column-right; }
        Mod+Ctrl+WheelScrollLeft  { move-column-left; }

        Mod+Shift+WheelScrollDown      { focus-column-right; }
        Mod+Shift+WheelScrollUp        { focus-column-left; }
        Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

        // === Numbered Workspaces ===
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }

        // === Move to Numbered Workspaces ===
        Mod+Ctrl+1 { move-column-to-workspace 1; }
        Mod+Ctrl+2 { move-column-to-workspace 2; }
        Mod+Ctrl+3 { move-column-to-workspace 3; }
        Mod+Ctrl+4 { move-column-to-workspace 4; }
        Mod+Ctrl+5 { move-column-to-workspace 5; }
        Mod+Ctrl+6 { move-column-to-workspace 6; }
        Mod+Ctrl+7 { move-column-to-workspace 7; }
        Mod+Ctrl+8 { move-column-to-workspace 8; }
        Mod+Ctrl+9 { move-column-to-workspace 9; }

        // === Column Management ===
        Mod+BracketLeft  { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }
        Mod+Period { expel-window-from-column; }

        // === Sizing & Layout ===
        Mod+R { switch-preset-column-width; }
        Mod+Shift+R { switch-preset-window-height; }
        Mod+Ctrl+R { reset-window-height; }
        Mod+Ctrl+F { expand-column-to-available-width; }
        Mod+Ctrl+C { center-column; }

        // === Manual Sizing ===
        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        // === Screenshots ===
        Mod+Shift+S { screenshot; }
        XF86Launch1 { screenshot; }
        Ctrl+XF86Launch1 { screenshot-screen; }
        Alt+XF86Launch1 { screenshot-window; }
        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        // === Ignis Screen Recording ===
        Mod+Alt+Shift+R hotkey-overlay-title="Record Screen" { spawn "ignis" "run-command" "recorder-record-screen"; }
        Mod+Alt+Shift+S hotkey-overlay-title="Record Region" { spawn "ignis" "run-command" "recorder-record-region"; }
        Mod+Alt+Shift+W hotkey-overlay-title="Record Portal" { spawn "ignis" "run-command" "recorder-record-portal"; }

        // === System Controls ===
        Mod+Escape hotkey-overlay-title="Ignis Power Menu" { spawn "ignis" "open-window" "PowerMenu"; }
        Mod+Alt+P { power-off-monitors; }

        // === Custom Application Launchers ===
        Mod+Shift+G { spawn "gtk-launch" "WebApp-Github3829"; }
        Ctrl+Mod+M { spawn "gtk-launch" "WebApp-Messages8512"; }
        Mod+Alt+R { spawn "gtk-launch" "WebApp-Restream9853"; }
        Mod+E { spawn "gtk-launch" "WebApp-ProtonMail2575"; }
        Mod+Shift+D { spawn "gtk-launch" "WebApp-Descript2748"; }
        Mod+Shift+C { spawn "gtk-launch" "WebApp-Claude7860"; }
        Mod+Ctrl+G { spawn "gtk-launch" "WebApp-GoogleMeet8814"; }
        Mod+Shift+Ctrl+C { spawn "${terminal}" "claude"; }
        Mod+Alt+G { spawn "gtk-launch" "WebApp-GitLabBlackDonOS4386"; }
        Ctrl+Mod+N { spawn "obsidian"; }
        Mod+B { spawn "${browser}"; }
        Mod+D { spawn "vesktop"; }
        Mod+S { spawn "steam"; }
        Mod+Shift+O { spawn "flatpak" "run" "com.obsproject.Studio"; }
        Mod+Ctrl+O { spawn "obs"; }
        Mod+Z { spawn "/home/don/.local/bin/zed-fix"; }
        Mod+F { spawn "nemo"; }
        Ctrl+Mod+V { spawn "virt-manager"; }
        Ctrl+Mod+E { spawn "emopicker9000"; }

        // === Color picker ===
        Mod+C { spawn-sh "niri msg pick-color | grep 'Hex:' | cut -d' ' -f2 | wl-copy"; }

        // === Dynamic Cast ===
        Mod+P { set-dynamic-cast-monitor; }
        Mod+Shift+P { set-dynamic-cast-window; }
        Mod+Ctrl+P { clear-dynamic-cast-target; }
    }
''
