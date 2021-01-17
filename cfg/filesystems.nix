{ config, lib, pkgs, ... }:

{
  environment =	{
    systemPackages = with pkgs; [
#      linuxPackages_latest.zfsUnstable
#      zfsUnstable
    ];
  };

  boot = {
#    zfs = {
#      enableUnstable = true;
#      extraPools = [
#        "storage0"
#        "storage1"
#        "storage2"	
#        "ssd-raid0-0"
#        "ssd0"
#      ];
#    };
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

#  systemd.services.hddSpinUp = {
#    description = "Keep 'green' hdds running";
#    script = ''
#      /etc/nixos/scripts/
#    '';
#    wantedBy = [ "multi-user.target" ];
#  };
}