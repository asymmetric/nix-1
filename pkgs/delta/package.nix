{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "delta";

  portRev = "0674ec5114c08393d808e2516d153c7e6df00d41";
  portHash = "sha256-JvkTvAe1YltgmYSHeewzwg6xU38oGOIYoehXdHwW1zI=";

  installTargets = [
    "catppuccin.gitconfig"
    "README.md"
  ];
}
