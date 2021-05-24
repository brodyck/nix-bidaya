{ config, lib, pkgs, modulesPath, ... }:
#let
#storageName=storage2
#in
{
  fileSystems."/disks/storage2" = { 
    device = "storage2/safe";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/vms" = { 
    device = "storage2/safe/vms";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/secrets" = { 
    device = "storage2/safe/secrets";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/backups" = { 
    device = "storage2/safe/backups";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/books" = { 
    device = "storage2/safe/books";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/documents" = { 
    device = "storage2/safe/documents";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/music" = { 
    device = "storage2/safe/music";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/pictures" = { 
    device = "storage2/safe/pictures";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/torrents" = { 
    device = "storage2/safe/torrents";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/videos" = { 
    device = "storage2/safe/videos";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/videos-share" = { 
    device = "storage2/safe/videos-share";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/install-files" = { 
    device = "storage2/safe/install-files";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage2/high-compression" = { 
    device = "storage2/safe/high-compression";
    fsType = "zfs";
    options = [ "nofail" ];
  };

}