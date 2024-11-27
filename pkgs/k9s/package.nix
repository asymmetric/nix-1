{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "k9s";

  portRev = "fdbec82284744a1fc2eb3e2d24cb92ef87ffb8b4";
  portHash = "sha256-9h+jyEO4w0OnzeEKQXJbg9dvvWGZYQAO4MbgDn6QRzM=";

  installTargets = [ "dist" ];
}
