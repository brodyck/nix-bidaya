{ config, lib, pkgs, ... }:
{ 
  environment =	{
    systemPackages = with pkgs; [
      mlocate
    ];
  };
  services = {
    locate = {
      enable = true;
      locate = pkgs.mlocate;
      localuser = null;
      interval = "02:15";
    };
  };
}