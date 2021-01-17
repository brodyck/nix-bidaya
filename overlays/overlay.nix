self: super:

let
  callPackage = super.callPackage;
in
{
  rtl8822bu-ulli = callPackage ./pkgs/rtl8822bu { };
  rtl88x2bu = callPackage ./pkgs/rtl88x2bu { };
  nixos-generators = callPackage ./pkgs/nixos-generators { };
  mstflint-414 = callPackage ./pkgs/mstflint-414 { };
}