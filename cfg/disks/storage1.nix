{ config, lib, pkgs, modulesPath, ... }:
#let
#storageName=storage1
#in
{
  fileSystems."/disks/storage1" = { 
    device = "storage1/safe";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  # User directories
  fileSystems."/disks/storage1/user" = { 
    device = "storage1/safe/user";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/user/sham" = { 
    device = "storage1/safe/user/sham";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/user/raelynn" = { 
    device = "storage1/safe/user/raelynn";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/user/coleson" = { 
    device = "storage1/safe/user/coleson";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/user/thorin" = { 
    device = "storage1/safe/user/thorin";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/vms" = { 
    device = "storage1/safe/vms";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/secrets" = { 
    device = "storage1/safe/secrets";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/backups" = { 
    device = "storage1/safe/backups";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/books" = { 
    device = "storage1/safe/books";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/documents" = { 
    device = "storage1/safe/documents";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/music" = { 
    device = "storage1/safe/music";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/pictures" = { 
    device = "storage1/safe/pictures";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/torrents" = { 
    device = "storage1/safe/torrents";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/videos" = { 
    device = "storage1/safe/videos";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/videos-share" = { 
    device = "storage1/safe/videos-share";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/install-files" = { 
    device = "storage1/safe/install-files";
    fsType = "zfs";
    options = [ "nofail" ];
  };
  fileSystems."/disks/storage1/high-compression" = { 
    device = "storage1/safe/high-compression";
    fsType = "zfs";
    options = [ "nofail" ];
  };

}