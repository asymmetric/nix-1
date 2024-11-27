{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "rofi";

  portRev = "b636a00fd40a7899a8206195464ae8b7f0450a6d";
  portHash = "sha256-zA8Zum19pDTgn0KdQ0gD2kqCOXK4OCHBidFpGwrJOqg=";

  installTargets = [ "basic/.local/share/rofi/themes" ];
}
