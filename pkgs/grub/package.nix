{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "grub";

  portRev = "ffcceb344e2bc86adc8e64437459c1f38adf5b63";
  portHash = "sha256-bDw+W69jeSiE1VBdQqqaeZf7OqCN7q5XYJ5+94PILXE=";

  dontCatppuccinInstall = true;

  postInstall = ''
    mkdir -p $out/share/grub
    mv src $out/share/grub/themes
  '';
}
