{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "bidaya";
    hostId = "deadbeef";
    firewall = {
      enable = true;
      allowedTCPPorts = [
        8081
        8082
      ];
      allowedUDPPorts = [
        8081
	8082
      ];
      allowPing = true;
    };
    bridges = {
      enp4br0 = {
        interfaces = [ "enp4s0" ];
      };
    };
  };
}
