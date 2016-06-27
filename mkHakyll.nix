{ pkgs, src, name, version }:

pkgs.stdenv.mkDerivation {
  name = "${name}-${version}";

  src = src;

  buildInputs = with pkgs; [ 
    glibcLocales 
    (haskellPackages.ghcWithPackages (ps: with ps; [
      hakyll
    ]))
  ];

  phases = [ "unpackPhase" "buildPhase" "installPhase" ];

  LC_ALL = "en_US.UTF-8";

  buildPhase = ''
    ghc --make site.hs
    ./site build
  '';

  installPhase = ''
    mkdir $out
    cp -r _site/* $out
  '';
}
