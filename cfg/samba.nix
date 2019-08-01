{ config, lib, pkgs, ... }:

let smbconf = builtins.readFile "/etc/nixos/real-configs/smb.conf";
in
{
  environment =	{
    systemPackages = with pkgs; [
      samba
      cifs_utils
    ];
  };
  services = {
    samba = {
      enable = true;
      nsswins = true;
      configText = lib.mkBefore "
        ${smbconf}
      ";
      syncPasswordsByPam = true;
    };
  };
  networking = {
    firewall = {
      allowPing = true;
      allowedTCPPorts = [ 445 139 ];
      allowedUDPPorts = [ 137 138 ];
    };
  };
}    
