{ config, lib, pkgs, ... }:
{
  users = {
    mutableUsers = true;
    users = {
      brody = {
        name = "brody";
        description = "Biggest Admin";
	shell = pkgs.bash;
        uid = 1000;
	createHome = true;
	home = "/home/brody";
	initialPassword = "initialpw";
	extraGroups = [ "wheel" ];
        subUidRanges = [{
	  startUid = 100000;
	  count = 65536;
        }];
        subGidRanges = [{
	  startGid = 100000;
	  count = 65536;
        }];
      };
      thorin = {
        name = "thorin";
        description = "Not an admin";
	shell = pkgs.bash;
        uid = 1001;
	createHome = true;
	home = "/home/thorin";
	initialPassword = "initialpw";
        subUidRanges = [{
	  startUid = 200000;
	  count = 65536;
        }];
        subGidRanges = [{
	  startGid = 200000;
	  count = 65536;
        }];
      };
#      let test = { name = test; uid = 1100; home = "/home/test"; subUidRanges = [{ startUid = 100000; count = 65536; }]; description = "this is a test"; };
#      in brody
    };
    groups = {
      samba = { gid = 500; };
      brody = { gid = 1000; };
      thorin = { gid = 1001; };
    };
  };
}
