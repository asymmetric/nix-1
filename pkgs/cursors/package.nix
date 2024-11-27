{
  lib,
  mkCatppuccinDerivation,
  hyprcursor,
  inkscape,
  just,
  python3,
  whiskers,
  xcur2png,
  xorg,
}:

mkCatppuccinDerivation (finalAttrs: {
  pname = "catppuccin-cursors";
  version = "1.0.1";

  portRev = "refs/tags/v${finalAttrs.version}";
  portHash = "sha256-l01L0UiE9bgUOMHhs74Bndarw2b6TaJGW/xU/8rfoAk=";

  postPatch = "patchShebangs scripts/ build";

  nativeBuildInputs = [
    (python3.withPackages (p: [ p.pyside6 ]))
    hyprcursor
    inkscape
    just
    whiskers
    xcur2png
    xorg.xcursorgen
  ];

  buildPhase = ''
    runHook preBuild

    just all_with_hyprcursor

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share
    mv dist $out/share/icons

    runHook postInstall
  '';

  meta = {
    description = "Catppuccin cursor theme based on Volantes";
    license = lib.licenses.gpl2;
    platforms = lib.platforms.linux;
  };
})
