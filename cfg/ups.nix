{ config, lib, pkgs, ... }:


{
  environment = {
    systemPackages = with pkgs; [
      apcupsd
      upower
    ];
  };

  services.apcupsd = {
    enable = true;
    configText = ''
      UPSTYPE usb
    '';
  };
  networking.firewall = {
    allowedTCPPorts = [
      3551
    ];
    allowedUDPPorts = [
      3551
    ];
  };
}
