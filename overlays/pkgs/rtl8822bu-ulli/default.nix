{ stdenv, fetchFromGitHub, pkgs, bc, nukeReferences }:


let
  kernel = pkgs.linuxPackages.kernel;
  version = "${kernel.version}";
in
stdenv.mkDerivation rec {
  name = "rtl8822bu-${kernel.modDirVersion}";

  src = fetchFromGitHub {
    owner = "ulli-kroll";
    repo = "rtl8822bu";
    rev = "2ba08debec2ba05d8505e340c2438b4b8fe16c7d";
    sha256 = "067a98q1xljsx8ka579ah3h1y3kpbnv3ggyb7v073a3ddmxg6wki";
  };

  nativeBuildInputs = [ bc nukeReferences ];

  buildInputs = kernel.moduleBuildDependencies;
  
  NIX_CFLAGS_COMPILE="-Wno-error=incompatible-pointer-types";

  prePatch = ''
    mkdir -p $out/lib/firmware/rtlwifi
    cp -n firmware/* $out/lib/firmware/rtlwifi/.
    substituteInPlace ./Makefile \
      --replace /lib/modules/ "${kernel.dev}/lib/modules/" \
      --replace '$(shell uname -r)' "${kernel.modDirVersion}" \
      --replace 'all: modules' 'all: modules

install:
	install -p -m 644 ''$(MODULE_NAME).ko ''$(MODDESTDIR)

uninstall:
	rm -f ''$(MODDESTDIR)/''$(MODULE_NAME).ko
	# -a ''${KVER}

' \
      --replace '$(MODDESTDIR)' "$out/lib/modules/${kernel.modDirVersion}/kernel/net/wireless/" 
     substituteInPlace ./os_dep/linux/ioctl_linux.c \
       --replace '0x012D' '0x0115'
  '';

  preInstall = ''
    mkdir -p "$out/lib/modules/${kernel.modDirVersion}/kernel/net/wireless/"
  '';

  postInstall = ''
    nuke-refs $out/lib/modules/*/kernel/net/wireless/*.ko
  '';
  
#      --replace /lib/firmware/ "${kernel.dev}/lib/firmware/" \      
  
}