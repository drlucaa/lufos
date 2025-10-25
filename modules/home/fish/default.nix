{ pkgs, ... }:

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
    '';

    # Shell initialization for PATH additions
    shellInit = ''
      # Add local bin directories to PATH
      fish_add_path $HOME/.local/bin
    '';

    shellAbbrs = {
      # Better defaults
      cat = "bat";
      man = "batman";

      # System aliases
      c = "clear";

      # NixOS specific
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";

      # Git
      lg = "lazygit";
      ju = "jjui";

      # Docker
      ld = "lazydocker";
      dcu = "docker compose up -d";
      dcd = "docker compose down";

      # Directory navigation shortcuts
      ".." = "cd ..";
      "..." = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";

      # Always mkdir with parents
      mkdir = "mkdir -p";
    };

    functions = {
      cx = "mkdir -p -- $argv; and cd -- $argv";
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
