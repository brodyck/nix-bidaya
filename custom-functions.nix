{ config, lib, pkgs, ... }:

{
nixFilesIn = dir: mapAttrs (name: _: import (dir + "/${name}"))
                           (filterAttrs (name: _: hasSuffix ".nix" name)
                                        (readDir dir));
}					