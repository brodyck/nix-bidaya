{ stdenv, pkgs }:

stdenv.mkDerivation rec {
  name = "nixos-generators";
  version = "git-1.0.0";
  src = pkgs.fetchFromGitHub {
    owner  = "nixos-community";
    repo   = "nixos-generators";
    rev    = "defb4eed143c0473c4b348cccc00b4e1fa7e1755";
    sha256 = "10xncifdfhilxclxyf72h7dcfn8yn1h34qbkvdq9l76ghv5qjniq";
  };
  # There is a variable in the makefile of this repo that is not set when making a derivation like this, but if you use 'nix-env -f https://repoaddress -i' it reads the 'PREFIX' properly.
  makeFlags = [ "PREFIX=$(out)" ];
}