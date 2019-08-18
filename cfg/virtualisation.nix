{ config, lib, pkgs, ... }:

{
  imports = [
    ./gpu-passthrough.nix
  ];
  environment = {
    systemPackages = with pkgs; [
      libvirt
      qemu_kvm
      win-qemu
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
