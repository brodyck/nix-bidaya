{ config, lib, pkgs, ... }:

{
  powerManagement.cpuFreqGovernor = "performance";

  boot = {
    #extraTTYs = [ "ttyS0" ];
   
    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "console=tty0"
      "console=ttyS0,115200n8"
      "console=ttyS2,115200n8"      
    ];

    kernelModules = [
#      "zfs"
#      "88x2bu"
#      "spl"
    ];
    
#    extraModulePackages = [
#      pkgs.rtl88x2bu
#    ];

    blacklistedKernelModules = [ "" ];
      
#    extraModprobeConfig = '' "88x2bu" '';

    kernel = {
      sysctl = {
        #"fs.inotify.max_user_watches" = 100000;
	"net.ipv4.ip_forward" = 1;
	"kernel.numa_balancing" = 0;
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
    };
  };
}