{ config, lib, pkgs, ... }:
{
#  environment = {
#    systemPackages = with pkgs; [
#      ddclient
#    ];
#  };
  services = {
    ddclient = {
      enable = true;
      # Use imperative configuration to keep secrets out of the (world
      # readable) Nix store. If this option is not set, the NixOS options from
      # services.ddclient.* will be used to populate /etc/ddclient.conf.
      #ddclientSecrets="/var/lib/ddclient/secrets"
      #mkdir /var/lib/ddclient/secrets && cp wherever/ddclient.conf ${ddclientSecrets}/ddclient.conf
      configFile = "/var/lib/ddclient/secrets/ddclient.conf";
    };
  };
}
