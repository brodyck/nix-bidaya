{ config, lib, pkgs, ... }:
with builtins;
with lib.strings;
with lib.attrsets;
let
# This gets a list of all '.nix' files in a given folder (excludes '.nix~')
nixInFolder = dir: map (x: dir + "/" + x) (attrNames (filterAttrs (name: _: hasSuffix ".nix" name) (readDir dir)));
in
{
#  imports = nixInFolder "/etc/nixos/cfg/virtualisation/vm";
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
