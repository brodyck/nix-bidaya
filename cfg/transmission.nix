{ config, lib, pkgs, ... }:
{
  environment =	{
    systemPackages = with pkgs; [
      transmission      
    ];
  };
  services.transmission = {
    enable = true;
    user = "brody";
    group = "brody";    
    port = 8881;
    home = "/disks/storage2/torrents";
    openFirewall = true;
    downloadDirPermissions = "766";
    settings = {
      download-dir = "/disks/storage2/torrents";
      incomplete-dir = "/disks/storage2/torrents/incomplete";
      incomplete-dir-enabled = true;
      watch-dir = "/disks/storage2/torrents/torrentfiles";
      watch-dir-enabled = true;
      rpc-whitelist = "127.0.0.1,172.17.69.200,192.168.69.200";
      rpc-bind-address = "*";
    };
  };
}