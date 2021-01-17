{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "bidaya";
    hostId = "deadbeef";
    useDHCP = false;
    nameservers = [ "192.168.69.1" "8.8.8.8" "1.1.1.1" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        8080
        8081
        8082
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
#      rttablesExtraConfig = "";
    };
    bridges = {
      bridge0 = {
        interfaces = [ "enp5s0" ];
#        rstp = true;
      };
#      bridge1 = {
#        interfaces = [ "enp1s0" ];
#      };
    };
    interfaces = {
      #enp1s0f0 = {
      #  useDHCP = true;
      #};
      enp1s0 = {
      #enp6s0 = {
        macAddress = "00:02:c9:42:06:90";
	useDHCP = false;
        ipv4 = {
	  addresses = [
	    { address = "192.168.69.202"; prefixLength = 24; }
	  ];
	  routes = [
	    # Gateways for my OPNSense OpenVPNs -- if they ever choose to let me apply routes to unreachable networks, like the regular 'ip route' command does
            { address = "10.4.20.0"; prefixLength = 24; via = "192.168.69.220"; options = { dev = "enp1s0"; mtu = "1500"; metric = "201"; }; }
#	    { address = "10.6.66.0"; prefixLength = 24; via = "192.168.69.220"; options = { dev = "enp1s0"; mtu = "1500"; metric = "201"; }; }
          ];
	};
      };
    };
    localCommands = ''
      #This network is hosted by a VM on this machine -- so the routes above will never actually apply.
      ip route add 10.4.20.0/24 via 192.168.69.220 dev enp1s0 proto static metric 201 mtu 1500
    '';
    defaultGateway = {
      address = "192.168.69.1";
      interface = "enp1s0";
      #interface = "enp6s0";
      metric = 100;
    };
  };
  environment = {
    systemPackages = with pkgs; [
      iproute
      ethtool
#      rdma-core
      # mstpd
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
  # These are for the Dell xl710 device I own
  services.udev.extraRules = ''
    KERNEL=="0000:01:00.0", SUBSYSTEM=="pci", DRIVER=="i40e", ATTR{sriov_numvfs}="0", ATTR{sriov_drivers_autoprobe}="0"
    KERNEL=="0000:01:00.1", SUBSYSTEM=="pci", DRIVER=="i40e", ATTR{sriov_numvfs}="0", ATTR{sriov_drivers_autoprobe}="0"
  '';
}
