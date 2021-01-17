{ config, lib, pkgs, ... }:
#https://grahamc.com/blog/nixos-system-version-prometheus
let
  snmpPort = 2002;
in
{
  environment =	{
    systemPackages = with pkgs; [
      prometheus
      prometheus-snmp-exporter
    ];
  };
  services.prometheus = {
    exporters.snmp = {
      enable = true;
      configurationPath = ./snmp.yml;
      openFirewall = true;
      port = snmpPort;
    };
    scrapeConfigs = [
      {
        job_name = "snmp-mikrotik-CRS328";
	metrics_path = "/snmp";
	params.module = [ "mikrotik-sw-r" ];
	static_configs = [
	  {
	    targets = [
	      "192.168.69.100"
	    ];
	  }
	];
        relabel_configs = [
          {
            source_labels = [ "__address__" ];
            target_label = "__param_target";
          }
          {
            source_labels = [ "__param_target" ];
            target_label = "instance";
          }
          {
            target_label = "__address__";
            replacement = "127.0.0.1:2002";
          }
        ];
      }
      {
        job_name = "snmp-mikrotik-mAP";
	metrics_path = "/snmp";
	params.module = [ "mikrotik-ap-r" ];
	static_configs = [
	  {
	    targets = [
	      "192.168.69.111"
	      "192.168.69.112"
	    ];
	  }
	];
        relabel_configs = [
          {
            source_labels = [ "__address__" ];
            target_label = "__param_target";
          }
          {
            source_labels = [ "__param_target" ];
            target_label = "instance";
          }
          {
            target_label = "__address__";
            replacement = "127.0.0.1:2002";
          }
        ];
      }
    ];
  };
  services.grafana.provision = {
      datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
	  access = "proxy";
	  editable = true;
	  url = "http://127.0.0.1:9090/";
        }
      ];
  };
  networking.firewall.allowedTCPPorts = [ snmpPort ];
  networking.firewall.allowedUDPPorts = [ snmpPort ];  
}