{ config, lib, pkgs, ... }:


{
  environment = {
    systemPackages = with pkgs; [
#      terraform_0_13
#      consul
#      lxd
    ];
  };

  services.consul = {
    enable = false;
    webUi = true;
    dropPrivileges = true;
  };

}
