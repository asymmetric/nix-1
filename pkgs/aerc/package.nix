{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "aerc";

  portRev = "ca404a9f2d125ef12db40db663d43c9d94116a05";
  portHash = "sha256-OWIkHsKFts/zkrDUtbBPXHVSrHL/F0v3LB1rnlFAKmE=";

  installTargets = [ "dist/" ];
}
