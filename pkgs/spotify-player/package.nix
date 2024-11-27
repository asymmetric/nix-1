{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "spotify-player";

  portRev = "34b3d23806770185b72466d777853c73454b85a6";
  portHash = "sha256-eenf1jB8b2s2qeG7wAApGwkjJZWVNzQj/wEZMUgnn5U=";

  installTargets = [
    "theme.toml"
    "README.md"
  ];
}
