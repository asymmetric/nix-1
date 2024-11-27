{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "zathura";

  portRev = "0adc53028d81bf047461bc61c43a484d11b15220";
  portHash = "sha256-/vD/hOi6KcaGyAp6Az7jL5/tQSGRzIrf0oHjAJf4QbI=";

  installTargets = [ "src" ];
}
