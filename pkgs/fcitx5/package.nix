{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "fcitx5";

  portRev = "3471b918d4b5aab2d3c3dd9f2c3b9c18fb470e8e";
  portHash = "sha256-1IqFVTEY6z8yNjpi5C+wahMN1kpt0OJATy5echjPXmc=";

  dontCatppuccinInstall = true;

  postInstall = ''
    mkdir -p $out/share/fcitx5
    mv src/ $out/share/fcitx5/themes/
  '';
}
