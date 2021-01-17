{ config, lib, pkgs, ... }:

{
  services.rsyslog = {
    enable = true;
    defaultConfig = ''
      # "local1" is used for dhcpd messages.
#      local1.*                     -/var/log/dhcpd
#      mail.*                       -/var/log/mail
#      *.=warning;*.=err            -/var/log/warn
#     *.crit                        /var/log/warn
#      *.*;mail.none;local1.none    -/var/log/messages
    ''
    extraConfig = ''
      $ModLoad imtcp.so
      $InputTCPServerRun 514
      
      $ModLoad imudp.so
      $UDPServerRun 514
      $template DynamicFile,"/var/log/%FROMHOST%/%HOSTNAME%-syslog"

    '';
    extraParams = ''

    '';
  };
  networking.firewall = {
    allowedTCPPorts = [

    ];
    allowedUDPPorts = [

    ];
  };    
}