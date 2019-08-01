{ config, lib, pkgs, ... }:
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
}