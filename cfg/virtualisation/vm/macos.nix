{ config, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      python3
      python38Packages.pip
    ];
  };

#  virtualisation = {
#  };

}
