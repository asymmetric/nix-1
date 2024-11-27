{ mkCatppuccinDerivation }:

mkCatppuccinDerivation {
  pname = "micro";

  portRev = "2802b32308e5b1a827689c095f11ae604bbc85e6";
  portHash = "sha256-+Jf32S2CHackdmx+UmEKjx71ZCf4VfnxeA3yzz3MSLQ=";

  installTargets = [ "src" ];
}
