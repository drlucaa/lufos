{
  config,
  pkgs,
  lib,
  ...
}:
let
  accent = "#${config.lib.stylix.colors.base0D}";
in
{
  programs.fish = {
    enable = true;

    # Disable fish greeting
    interactiveShellInit = ''
      set fish_greeting

      # Launch fastfetch on first terminal spawn
      if not set -q FASTFETCH_LAUNCHED
        set -gx FASTFETCH_LAUNCHED 1
        fastfetch
      end

      # Load personal config if it exists
      if test -f $HOME/.fishrc-personal
        source $HOME/.fishrc-personal
      end

      # Function to rebuild a specific NixOS configuration
      rebuild() {
        if [ -z "$1" ]; then
          echo "Usage: rebuild <system-config-name>"
          return 1
        fi
        sudo nixos-rebuild switch --flake ~/lufos#$1
      }
    '';

    # Shell initialization for PATH additions
    shellInit = ''
      # Add local bin directories to PATH
      fish_add_path $HOME/.local/bin
      fish_add_path $HOME/.pub-cache/bin
      fish_add_path $HOME/Development/Repos/flutter/bin
    '';

    # Vim-style key bindings (matching zsh config) + HyDE history bindings
    functions = {
      fish_user_key_bindings = ''
        bind \eh backward-word
        bind \ej down-line-or-history
        bind \ek up-line-or-history
        bind \el forward-word

        # HyDE: Quick history access with Alt+number (1-9)
        bind_M_n_history
      '';

      # HyDE function: Bind Alt+number to recall history items
      bind_M_n_history = ''
        for i in (seq 9)
          set -l command
          if test (count $history) -ge $i
            set command "commandline -r \$history[$i]"
          else
            set command "echo \"No history found for number $i\""
          end

          if contains fish_vi_key_bindings $fish_key_bindings
            bind -M default \e$i "$command"
            bind -M insert \e$i "$command"
          else
            bind \e$i "$command"
          end
        end
      '';
    };

    # Shell aliases (migrated from zsh + HyDE inspired)
    shellAliases = {
      sv = "sudo nvim";
      rebuild = "sudo nixos-rebuild switch --flake ~/lufos#<system config name>";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      v = "nvim";
      cat = "bat";
      ".." = "cd ..";
    };

    # Fish plugins for enhanced functionality
    plugins = [
      # Tide - The ultimate Fish prompt (like Powerlevel10k for Fish)
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      # FZF integration for Fish
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      # Auto-complete matching pairs
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      # Notifications when long commands finish
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      # Clean failed commands from history
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
    ];
  };
}
