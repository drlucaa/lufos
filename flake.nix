{
  description = "fulos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko.url = "github:nix-community/disko";
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
    flake-utils.url = "github:numtide/flake-utils";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
    elephant.url = "github:abenz1267/elephant";
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let

    # Helper function to create a host configuration
    mkHost = {hostname, system ? "x86_64-linux", profile, username}: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        host = hostname;
        inherit profile;
        inherit username;
        zen-browser = inputs.zen-browser.packages.${system}.default;
      };
      modules = [./profiles/${profile}];
    };

  in {
    nixosConfigurations = {
      # Host-specific configurations
      nix-desktop = mkHost { hostname = "nix-desktop"; profile = "nvidia"; username = "luca"; };
    };
  };
}
