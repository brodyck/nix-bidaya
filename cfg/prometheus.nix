{ config, lib, pkgs, ... }:
#https://grahamc.com/blog/nixos-system-version-prometheus
with builtins;
with lib.strings;
with lib.attrsets;
let
# This gets a list of all '.nix' files in a given folder (excludes '.nix~')
nixInFolder = dir: map (x: dir + "/" + x) (attrNames (filterAttrs (name: _: hasSuffix ".nix" name) (readDir dir)));
prometheusPort = 9090;
in
{
  imports = nixInFolder "/etc/nixos/cfg/prometheus-configs";
  
  environment =	{
    systemPackages = with pkgs; [
      prometheus
      prometheus-apcupsd-exporter
      prometheus-haproxy-exporter
      prometheus-alertmanager
      prometheus-xmpp-alerts
      prometheus-node-exporter
    ];
  };
  services.prometheus = {
    enable = true;
#    listenAddress = 0.0.0.0;
    port = prometheusPort;
  };
  networking.firewall.allowedTCPPorts = [ prometheusPort ];
  networking.firewall.allowedUDPPorts = [ prometheusPort ];   
}