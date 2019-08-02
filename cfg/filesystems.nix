{ config, lib, pkgs, ... }:
#let
#folders = [ "/install-files" "/videos-share" "/music" "/books";
#mountDisks = [ "/disks/storage0" "/disks/raid0-0" ]
#shareDirs = [ "/shares/thorin" ]
#mountListOfFolders = 
#in

{
  environment =	{
    systemPackages = with pkgs; [
      zfs
    ];
  };

  boot.zfs = {
    extraPools = [
      "storage0"
      "raid0-0"
      "ssd0"
    ];
  };
  systemd.services = {
    noIdle = {
      enable = true;
      script = ''
        sh $(./real-configs/mount-server noIdle)
      '';
    };
    bindMounts = {
      enable = true;
      script = ''
      sh $(./real-configs/mount-server bindMounts)
    '';
    };
  };
}