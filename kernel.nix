{ config, lib, pkgs, ... }:

{
boot = {
    kernelPackages = pkgs.linuxPackages_latest_hardened;
      kernelModules = [
        "kvm-amd"
	"zfs"
	"iommu"
	"amd_iommu"
	"vfio" 
	"vfio_pci"
	"vfio_virqfd"
	"vfio_iommu_type1"
      ];
      
      kernelParams = [
        "iommu=pt"
        "amd_iommu=pt"
	"kvm_amd.npt=1"
	"hugepages=8192"
	"rd.driver.pre=vfio_pci"
	"vfio-pci.ids=1002:67df,1002:aaf0"
	"vfio-pci.disable_vga=1"
	"kvm.ignore_msrs=1"
	"kvm.report_ignored_msrs=0"
	"kvm_amd.nested=1"
      ];

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

    
    #extraModprobeConfig = ''
    #  options iwlwifi fw_monifor=1
    #'';
  };
}