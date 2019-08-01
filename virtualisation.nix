{ config, lib, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      libvirt
      qemu_kvm
      lxd
      docker
      docker-compose
      OVMF-CSM
      OVMF
    ];
  };
    
  virtualisation = {

    libvirtd = {
      enable = true;
      #onShutDown = shutdown;
      qemuOvmf = true;
    };
    
    lxd = {
      enable = true;
      zfsSupport = true;
    };
    
#   lxc = {
#     enable = true;
#     usernetConfig = ''
#       bf veth lxcbr0 10
#     '';
#    };

    docker = {
      enable = true;
      storageDriver = "overlay";
    };
  };
}
