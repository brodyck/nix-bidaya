{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "bidaya";
    hostId = "deadbeef";
    useDHCP = false;
    nameservers = [ "192.168.69.1" "8.8.8.8" "1.1.1.1" ];
    firewall = {
      enable = false;
      allowedTCPPorts = [
        8080
        8081
        8082
	8500 # consul webgui
	8300 # consul api
	5900 # vnc
	25565 # minecraft-newworld
	25563 # minecraft-sadworld
	25562 # minecraft-thorin
	25561 # minecraft-dnd	
	8123 # minecraft-thorin dynmap
	8124 # minecraft-dnd dynmap
	8125 # minecraft-sadworld
	
      ];
      allowedUDPPorts = [
        8080 
        8081
	8082
	5900 #vnc
      ];
      allowPing = true;
    };
    iproute2 = {
      enable = true;
    };
    bridges = {
      bridge0 = {
        interfaces = [ "enp5s0" ];
      };
    };
    interfaces = {
      enp1s0 = {
        macAddress = "00:02:c9:42:06:90";
        ipv4 = {
	  addresses = [
	    { address = "192.168.69.202"; prefixLength = 24; }
	  ];
	};
      };
    };
    defaultGateway = {
      address = "192.168.69.1";
      interface = "enp1s0";
      metric = 100;
    };
  };
  environment = {
    systemPackages = with pkgs; [
      iproute
      ethtool
      telnet
      nmap
    ];
  };
  boot = {
    # These are for the Mellenox Connectx-3 I own
    kernelParams = [
      "mlx4_core.port_type_array=2,1"
      "mlx4_core.num_vfs=8"
      "mlx4_core.probe_vf=0"
    ];
  };
}
