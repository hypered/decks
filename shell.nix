let
  nixpkgs = builtins.fetchTarball {
    sha256 = "1fxmy6fmsx6fp3h2k9jyg4q41dfl1777wswk9bx3v9hzm114pjy7";
    url = https://github.com/nixos/nixpkgs/archive/e9d4bab04458cd03cb9029d2d571c37cc017ffdc.tar.gz;
  };
  pkgs = import nixpkgs {};
in
  pkgs.runCommand "dummy" {
    buildInputs = [ pkgs.haskellPackages.pandoc ];
  } ""
