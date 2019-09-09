{ pkgs ? import <nixpkgs> {} }:

{

# have a subfolder in this folder with another 'default.nix' in it with that pkgs configurations

  nixos-generators = pkgs.callPackage ./nixos-generators { };

}