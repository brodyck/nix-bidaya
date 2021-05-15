{ stdenv, fetchFromGitHub, pkgs, bc, nukeReferences }:


let
  kernel = pkgs.linuxPackages.kernel;
  version = "${kernel.version}";
in
stdenv.mkDerivation rec {
  name = "rtl88x2bu-${kernel.modDirVersion}";

  src = fetchFromGitHub {
    owner = "cilynx";
    repo = "rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959";
    rev = "eece0638c546cd303da518c505cbe93513595030";
    sha256 = "0njsgi9yl8nww5zh0yirj3m8f90s1wdwa9fvjv9lfk15q4v93c60";
  };

  nativeBuildInputs = [ bc nukeReferences ];

  buildInputs = kernel.moduleBuildDependencies;
  
  NIX_CFLAGS_COMPILE="-Wno-error=incompatible-pointer-types";

  prePatch = ''
#    mkdir -p $out/lib/firmware/rtlwifi
#    cp -n firmware/* $out/lib/firmware/rtlwifi/.
    substituteInPlace ./Makefile --replace /lib/modules/ "${kernel.dev}/lib/modules/"
    substituteInPlace ./Makefile --replace '$(shell uname -r)' "${kernel.modDirVersion}"
    substituteInPlace ./Makefile --replace /sbin/depmod \#
    substituteInPlace ./Makefile --replace '$(MODDESTDIR)' "$out/lib/modules/${kernel.modDirVersion}/kernel/net/wireless/" 
  '';

  preInstall = ''
    mkdir -p "$out/lib/modules/${kernel.modDirVersion}/kernel/net/wireless/"
  '';

  postInstall = ''
    nuke-refs $out/lib/modules/*/kernel/net/wireless/*.ko
  '';
  
#      --replace /lib/firmware/ "${kernel.dev}/lib/firmware/" \      
  
}