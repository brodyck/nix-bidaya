{ config, lib, pkgs, ... }:
{
  environment =	{
    systemPackages = with pkgs; [
      openssh
      sshfs
      eternal-terminal
    ];
  };
  services = {
    openssh = {
      enable = true;
      openFirewall = true;
      ports = [ 22 ];
      allowSFTP = true;
      permitRootLogin = "without-password";
#      authorizedKeysFiles = [ "/home/brody/.ssh/authorized_keys" ];
      passwordAuthentication = false;
    };

    eternal-terminal = {
      enable = true;
      port = 2022;
    };
  };

  users.users = {
    brody = {
      openssh.authorizedKeys.keyFiles = [ /etc/nixos/cfg/ssh-keys/brody.pub ];
    };
  };
}
