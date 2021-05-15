{ config, lib, pkgs, ... }:
with builtins;
with lib.strings;
with lib.attrsets;
let
# This gets a list of all '.nix' files in a given folder (excludes '.nix~')
nixInFolder = dir: map (x: dir + "/" + x) (attrNames (filterAttrs (name: _: hasSuffix ".nix" name) (readDir dir)));
in
{
  imports = nixInFolder "/etc/nixos/cfg/disks";
  environment =	{
    systemPackages = with pkgs; [
#      linuxPackages_latest.zfsUnstable
#      zfsUnstable
    ];
  };

  boot = {
    supportedFilesystems = [ "zfs" ];
  };
  
  services.zfs = {
    autoSnapshot = {
      enable = true;
      frequent = 20; # keep the latest eight 15-minute snapshots (instead of four)
      #monthly = 1;  # keep only one monthly snapshot (instead of twelve)
    };

    # For some new version of NixOS
    trim = {
      enable = true;
    };
  };
}