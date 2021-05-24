{ config, lib, pkgs, modulesPath, ... }:
#let
#storageName=storage3
#in
{
  fileSystems."/disks/storage3" = { 
    device = "storage3/safe";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/vms" = { 
    device = "storage3/safe/vms";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/secrets" = { 
    device = "storage3/safe/secrets";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/backups" = { 
    device = "storage3/safe/backups";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/books" = { 
    device = "storage3/safe/books";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/documents" = { 
    device = "storage3/safe/documents";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/music" = { 
    device = "storage3/safe/music";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/pictures" = { 
    device = "storage3/safe/pictures";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/torrents" = { 
    device = "storage3/safe/torrents";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/videos" = { 
    device = "storage3/safe/videos";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/videos-share" = { 
    device = "storage3/safe/videos-share";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/install-files" = { 
    device = "storage3/safe/install-files";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage3/high-compression" = { 
    device = "storage3/safe/high-compression";
    fsType = "zfs";
    options = [ "nofail" ];
  };

}