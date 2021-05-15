{ config, lib, pkgs, ... }:

let
  #snmpdconf = builtins.readFile "/etc/nixos/config-files/snmpd.conf";
  snmpconfig = pkgs.writeTextFile {
    name = "snmpd.conf";
    text = ''
    	 mibs +MIKROTIK-MIB
	 mibs +ALL
	 trap2sink 192.168.69.202 brodyauth 
	 informsink 192.168.69.202 brodyauth 
	 trapcommunity brodyauth

	 #mikrotik stuff -- SSL isn't an option. Maybe transport over SSH is? In any case; different user/pass for read/write
	 wuser mikrotikw priv mikrotikw
	 createUser mikrotikw SHA f*fzn"Ug%~9BNuQk AES \;qK7X,u4qd=GN9?	 

	 ruser mikrotikr priv mikrotikr 
	 createUser mikrotikr SHA !LV#brF4T3A5`ABu AES wUfXGFp=ws@{s<5N	 

	 rouser brodyw auth brodyauth
	 createUser brodyw SHA dyckdyck DES dyckdyck

	 rocommunity brodysnmp12
      '';
  };
in
{
  environment =	{
    systemPackages = with pkgs; [
      net-snmp
    ];
  };
  systemd.services.snmpd = {
    description = "net-snmp daemon";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.net_snmp}/bin/snmpd -f -c ${snmpconfig}";
      KillMode = "process";
      Restart = "always";
    };
  };
  networking.firewall = { 
    allowedTCPPorts = [
      161 
      162
    ];
    allowedUDPPorts = [
      161 
      162
    ];
  };
}