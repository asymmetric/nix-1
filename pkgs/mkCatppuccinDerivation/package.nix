{
  lib,
  stdenvNoCC,
  catppuccinInstallHook,
  fetchCatppuccinPort,
}:

args:

let
  knownArguments = [
    "fetchSubmodules"
    "meta"
    "nativeBuildInputs"
    "portHash"
    "portRev"
  ];
in

stdenvNoCC.mkDerivation (
  finalAttrs:

  let
    args' = if lib.isFunction args then args finalAttrs else args;
  in

  {
    version = args'.version or builtins.substring 0 7 args'.portRev;

    src = fetchCatppuccinPort {
      port = finalAttrs.pname;
      rev = args'.portRev;
      hash = args'.portHash;
      fetchSubmodules = args'.fetchSubmodules or false;
    };

    nativeBuildInputs = args'.nativeBuildInputs or [ ] ++ [ catppuccinInstallHook ];

    meta = {
      description = "Soothing pastel theme for ${finalAttrs.pname}";
      homepage = "https://github.com/catppuccin/${finalAttrs.pname}";
      license = lib.licenses.mit;
      platform = lib.platforms.all;
    } // args'.meta or { };
  }
  // lib.removeAttrs args' knownArguments
)
