{ config, lib, pkgs, ... }:

{
  services.journald = {
#    enableHttpGateway = true; # port 19532
    extraConfig = "      
      Storage=persistent
      ReadKMsg=true
      ForwardToConsole=yes
      TTYPath=/dev/console
    ";
  };
  networking.firewall = {
    allowedTCPPorts = [
      19532
    ];
    allowedUDPPorts = [
      19532
    ];
  };    
}