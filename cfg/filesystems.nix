{ config, lib, pkgs, ... }:
#let
#smbUsers = [ "thorin" ]
#folders = [ "/install-files" "/videos-share" "/music" "/books" ];
#storageDisk = [ "/disks/storage0" ];
#raidDIsk = [ "/disks/raid0-0" ];
#shareDirs = [ "/shares" ];
#diskOptions = [ "auto" ];
#bindMount = dirs: (user: map (x: dirs
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

  fileSystems = {
    

#  systemd.services = {
#    noIdle = {
#      description = "Prevent 'green' HDDs from idling";
#      enable = true;
#      serviceConfig = {
#        # https://manpages.debian.org/jessie/systemd/systemd.service.5.en.html
#        Type = "oneshot";
#	
#      };
#      script = ''
#        sh $(./real-configs/mount-server noIdle)
#      '';
#    };
#  };
}