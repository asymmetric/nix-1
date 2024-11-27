{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "alacritty";

  portRev = "f6cb5a5c2b404cdaceaff193b9c52317f62c62f7";
  portHash = "sha256-H8bouVCS46h0DgQ+oYY8JitahQDj0V9p2cOoD4cQX+Q=";

  dontCatppuccinInstall = true;

  postInstall = ''
    mkdir -p $out
    mv *.toml $out/
  '';
}
