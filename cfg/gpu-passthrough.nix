{ config, lib, pkgs, ... }:

# I'm including everything I needed in this file. That way i should be able to just dump this configuration in the future on another AMD-CPU/AMD-GPU device.

{
#  nixpkgs.config.packageOverrides = pkgs: {
#    linux = pkgs.linux.override {
#      ignoreConfigErrors = true;
#      extraConfig = ''
#        CONFIG_PREEMPT y
#        CONFIG_RCU_FAST_NO_HZ y
#        CONFIG_RCU_NOCB_CPU y
#        CONFIG_HZ 1000
#        CONFIG_SCHED_AUTOGROUP y
#        CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE y
#        CONFIG_CPU_FREQ_GOV_PERFORMANCE y
#        CONFIG_NO_HZ_FULL y
#      '';
#    };
#  };

  environment = {
    systemPackages = with pkgs; [
      libvirt
      qemu_kvm
      win-qemu
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
      "video=efifb:off"
      "kvm_amd.npt=1" 
      "kvm_amd.nested=1"     
      "hugepages=8192" 
      "rd.driver.pre=vfio_pci"
      "pci=nocrs"
#     "vfio_pci.ids=1002:67df,1002:aaf0"
#     "vfio_pci.disable_vga=1"
      "vfio_pci.disable_idle_d3=1"
      "kvm.ignore_msrs=1"
      "kvm.report_ignored_msrs=0"
      "vfio_iommu_type1.allow_unsafe_interrupts=1"
    ];

    blacklistedKernelModules = [
      "amdgpu"
      "radeon"
    ];
   
    extraModprobeConfig = ''
      options vfio_pci ids=1002:67df,1002:aaf0
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
      enable = true;
      #onShutDown = shutdown;
      qemuOvmf = true;
    };

  };
}
