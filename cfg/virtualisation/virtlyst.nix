{ config, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      virtlyst
    ];
  };

  services = {
    virtlyst = {
      enable = true;
      adminPassword = "dyck";
      httpSocket = ":3000";
    };
  };


  networking.firewall = {
    allowedTCPPorts = [
      3000 
    ];
    allowedUDPPorts = [
      3000
    ];    
  };
}
