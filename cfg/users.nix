{ config, lib, pkgs, ... }:
{
  nix.trustedUsers = [ "brody" "root" ];
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
	extraGroups = [ "wheel" "lxd" "kvm" "libvirt" ];
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
	createHome = false;
	home = "/disks/storage1/thorin";
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
      
#      coleson = {
#        name = "coleson";
#        description = "brother";
#	shell = pkgs.bash;
#        uid = 1005;
#	createHome = false;
#	home = "/disks/storage1/coleson";
#	initialPassword = "initialpw";
#        subUidRanges = [{
#	  startUid = 300000;
#	  count = 65536;
#        }];
#        subGidRanges = [{
#	  startGid = 300000;
#	  count = 65536;
#	}];
#      };
      
      raelynn = {
        name = "raelynn";
        description = "sister";
	shell = pkgs.bash;
        uid = 1003;
	createHome = false;
	home = "/disks/storage1/raelynn";
	initialPassword = "initialpw";
        subUidRanges = [{
	  startUid = 400000;
	  count = 65536;
        }];
        subGidRanges = [{
	  startGid = 400000;
	  count = 65536;
	}];
      };            

     sham = {
        name = "sham";
        description = "Not an admin";
	shell = pkgs.bash;
        uid = 1004;
	createHome = false;
	home = "/disks/storage1/sham";
	initialPassword = "initialpw";
        subUidRanges = [{
	  startUid = 500000;
	  count = 65536;
        }];
        subGidRanges = [{
	  startGid = 500000;
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
#      coleson = { gid = 1005; };
      raelynn = { gid = 1003; };
      sham = { gid = 1004; };            
    };
  };
}
