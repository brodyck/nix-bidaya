{ config, lib, pkgs, ... }:
{
  environment =	{
    systemPackages = with pkgs; [
      openssh
      sshfs
    ];
  };
  services = {
    openssh = {
      enable = true;
      openFirewall = true;
      ports = [ 22 ];
      allowSFTP = true;
      permitRootLogin = "without-password";
      authorizedKeysFiles = [ "/home/brody/.ssh/authorized_keys" ];
      passwordAuthentication = false;
    };
  };
}
