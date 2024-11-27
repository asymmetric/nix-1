{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "palette";

  portRev = "b85d36adec22631684ae64ced0a5cdd15462de3b";
  portHash = "sha256-8AZVLJq5fKbMd/YFbqwgpHB7p4iTPTIMmC39R+3ZZ80=";

  installTargets = [
    "README.md"
    "palette.json"
  ];
}
