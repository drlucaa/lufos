{ lib, ... }: {
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/sda";

      content = {
        type = "gpt";
        partitions = {
          ESP = {
            type = "EF00";
            start = "1M";
            end = "1G";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };

          swap = {
            size = "8G"; # (>= RAM if you want hibernation)
            content = {
              type = "luks";
              name = "swap";
              content = {
                type = "swap";
              };
            };
          };

          root = {
            size = "100%";
            content = {
              type = "luks"; # encrypted root
              name = "root";
              extraOpenArgs = [ "--allow-discards" ]; # uncomment for SSDs
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # force format if needed
                subvolumes = {
                  "@root" = {
                    mountpoint = "/";
                    mountOptions = [ "compress=zstd" "noatime" "space_cache=v2" ];
                  };
                  "@home" = { mountpoint = "/home"; };
                  "@nix"  = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "@log"  = { mountpoint = "/var/log"; };
                  "@snapshots" = { mountpoint = "/.snapshots"; };
                };
              };
            };
          };
        };
      };
    };
  };
}
