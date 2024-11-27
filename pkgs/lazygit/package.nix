{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "lazygit";

  portRev = "d3c95a67ea3f778f7705d8ef814f87ac5213436d";
  portHash = "sha256-b2SoIeXT1BaoxvEeQ0VaPmnBND+7qUe342kOIkyOcAc=";

  installTargets = [ "themes-mergable" ];
}
