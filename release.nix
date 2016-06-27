{ pkgs ? import <nixpkgs> {} }:

(pkgs.callPackage ./mkHakyll.nix) {
  src     = ./src;
  name    = "hakyll-example";
  version = "1";
}
