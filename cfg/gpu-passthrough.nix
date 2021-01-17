{ config, lib, pkgs, ... }:

# I'm including everything I needed in this file. That way i should be able to just dump this configuration in the future on another AMD-CPU/AMD-GPU device.

{
  environment = {
    systemPackages = with pkgs; [
      libvirt
      qemu
#      win-qemu
      OVMF-CSM
      OVMF
      irqbalance
    ];
  };

  services = {
    irqbalance.enable = false;
  };

  boot = {
    kernelPatches = [
    # Just so everyone knows, the value of 'patch' MUST be unquoted. No exceptions.
      {
        name = "amd-reset";
        patch = ../patches/amd-reset.patch;
      }
      {
        name = "amd-navi-reset";
	patch = ../patches/amd-navi-reset.patch;
      }
    ];

    kernelModules = [
      "kvm_amd"
      "amd_iommu"
      "vfio"
      "vfio_pci"
      "vfio_virqfd"
      "vfio_iommu_type1"
    ];

    kernelParams = [
      "iommu=pt"
      "topoext"
      "amd_iommu=pt"
      "isolcpus=4-7,12-15"
      "nohz_full=4-7,12-15"
      "rcu_nocbs=4-7,12-15"
      "video=efifb:off" # if you need to access the terminal via an external monitor, comment this out
      "kvm_amd.npt=1" 
      "kvm_amd.nested=1"     
      "hugepages=8192" 
      "rd.driver.pre=vfio_pci"
      "pci=nocrs"
#     "vfio_pci.ids=1002:731f,1002:ab38"
#     "vfio_pci.disable_vga=1"
      "vfio_pci.disable_idle_d3=1"
      "kvm.ignore_msrs=1"
      "kvm.report_ignored_msrs=0"
      "vfio_iommu_type1.allow_unsafe_interrupts=1"
    ];

    # if you need to access the terminal via an external monitor, comment this portion out
    blacklistedKernelModules = [ 
      "amdgpu"
      "radeon"
    ];
   
    extraModprobeConfig = ''
      options vfio_pci ids=1002:731f,1002:ab38
#     options vfio_pci disable_idle_d3=1
#     options vfio_pci disable_vga=1
#     options vfio_iommu_type1 allow_unsafe_interrupts=1
#     options kvm ignore_msrs=1
#     options kvm report_ignored_msrs=0
#     options kvm_amd nested=1
      options kvm_amd npt=1
    '';
  };
  
  virtualisation = {
    libvirtd = {
      #onShutDown = shutdown;
      qemuOvmf = true;
    };

  };
}