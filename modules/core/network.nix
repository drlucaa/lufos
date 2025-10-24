{
  pkgs,
  host,
  options,
  ...
}: {
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
        8080
      ];
      allowedUDPPorts = [
        59010
        59011
      ];
    };
  };

  networking.networkmanager.ensureProfiles.profiles.home = {
    connection = { id = "Home wifi"; type = "wifi"; autoconnect = true; };
    wifi = { ssid = "Schlumpf Guest"; mode = "infrastructure"; };
    wifi-security = { key-mgmt = "wpa-psk"; psk = "fGA-cYYF3rkMwjz!smw9"; };
    ipv4.method = "auto"; ipv6.method = "auto";
  };

  environment.systemPackages = with pkgs; [networkmanagerapplet];
}
