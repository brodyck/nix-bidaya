{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "bidaya";
    hostId = "deadbeef";
    firewall = {
      enable = true;
      #allowedTCPPorts = [ ];
      #allowedUDPPorts = [ ];
      allowPing = true;
    };
    bridges = {
      enp4br0 = {
        interfaces = [ "enp4s0" ];
      };
    };
  };
}
