{ config, lib, pkgs, ... }:

{
  environment = {
      systemPackages = with pkgs; [
        gns3-server
      ];
  };
  networking.firewall = {
    allowedTCPPorts = [
      3080
    ];
  };
}