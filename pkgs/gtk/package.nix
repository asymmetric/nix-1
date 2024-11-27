{
  lib,
  mkCatppuccinDerivation,
  fetchFromGitHub,
  git,
  gtk3,
  python3,
  sassc,
  accents ? [ "mauve" ],
  allAccents ? true,
  flavor ? "frappe",
  size ? "standard",
  tweaks ? [ ],
}:

mkCatppuccinDerivation (finalAttrs: {
  pname = "catppuccin-gtk";
  version = "1.0.3";

  portRev = "refs/tags/v${finalAttrs.version}";
  portHash = "sha256-q5/VcFsm3vNEw55zq/vcM11eo456SYE5TQA3g2VQjGc=";

  postPatch = ''
    ln -sf ${finalAttrs.finalPackage.colloid} sources/colloid
  '';

  nativeBuildInputs = [
    (python3.withPackages (ps: [ ps.catppuccin ]))
    git # `git apply` is used for patches
    gtk3
    sassc
  ];

  dontConfigure = true;
  dontCatppuccinInstall = true;

  buildFlags =
    [
      flavor
      "--dest"
      "dist"
    ]
    ++ lib.optional allAccents "--all-accents"
    ++ lib.optionals (accents != [ ]) [
      "--accent"
      (toString accents)
    ]
    ++ lib.optionals (size != [ ]) [
      "--size"
      size
    ]
    ++ lib.optionals (tweaks != [ ]) [
      "--tweaks"
      (toString tweaks)
    ];

  postBuild = ''
    python3 build.py $buildFlags
  '';

  postInstall = ''
    mkdir -p $out/share
    mv dist $out/share/themes
  '';

  passthru = {
    colloid = fetchFromGitHub {
      owner = "vinceliuice";
      repo = "Colloid-gtk-theme";
      rev = "1a13048ea1bd4a6cb9b293b537afd16bf267e773";
      hash = "sha256-zYEoOCNI74Dahlbi5fniuL5PYXcGM4cVM1T2vnnGrcc=";
    };
  };

  meta = {
    description = "Soothing pastel theme for GTK";
    license = lib.licenses.gpl3Plus;
  };
})
