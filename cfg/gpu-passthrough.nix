{ config, lib, pkgs, ... }:

# I'm including everything I needed in this file. That way i should be able to just dump this configuration in the future on another AMD-CPU/AMD-GPU device.

{
  environment = {
    systemPackages = with pkgs; [
      libvirt
      qemu_kvm
      win-qemu
      OVMF-CSM
      OVMF
    ];
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
      "amd_iommu=pt"
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
