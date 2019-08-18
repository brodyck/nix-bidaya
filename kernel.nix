{ config, lib, pkgs, ... }:

{
  hardware.enableAllFirmware=true;
  boot = {
#   kernelPackages = pkgs.linuxPackages_latest_hardened;
    kernelPatches = [
    # Just so everyone knows, the value of 'patch' MUST be unquoted. No exceptions.
#      {
#       name = "";
#       patch = ./patches/amd-reset.patch;
#      }
    ];
   
    kernelPackages = pkgs.linuxPackages;
    kernelModules = [
      "zfs"
    ];

    kernelParams = [
#      ""
    ];

    blacklistedKernelModules = [
#      ""
    ];
      
    extraModprobeConfig = ''
#     ""
    '';

    kernel = {
      sysctl = {
        #"fs.inotify.max_user_watches" = 100000;
	"net.ipv4.ip_forward" = 1;
      };
    };
    
    initrd = {
      availableKernelModules = [
        "xhci_pci"
	"ahci"
	"mvsas"
	"usbhid"
	"usb_storage"
	"sd_mod"
      ];
      #kernelModules = [ "" ];
    };
  };
}