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
#  system.activationScripts = {
#      text =
#      ''
#        #/etc/nixos/real-configs/mount-server noIdle
#        /etc/nixos/real-configs/mount-server bindMounts
#      '';
#  };
  

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
#    bindMounts = {
#      enable = true;
#      script = ''
#        sh $(./real-configs/mount-server bindMounts)
#      '';
#    };
#  };
}