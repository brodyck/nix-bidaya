{ config, lib, pkgs, ... }:
#https://community.grafana.com/t/installing-on-nixos/6712
{
  environment =	{
    systemPackages = with pkgs; [
      grafana
    ];
  };
  services.grafana = {
    addr = "";
    enable = true;
    port = 2000;
    domain = "localhost";
    protocol = "http";
    dataDir = "/var/lib/grafana";
    provision.enable = true;
    users = {
      allowSignUp = true;
    };
  };
  networking.firewall.allowedTCPPorts = [ 2000 ];
}