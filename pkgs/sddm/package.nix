{
  lib,
  mkCatppuccinDerivation,
  just,
  kdePackages,
  background ? null,
  font ? "Noto Sans",
  fontSize ? "9",
  loginBackground ? false,
}:

mkCatppuccinDerivation (finalAttrs: {
  pname = "catppuccin-sddm";
  version = "1.0.0";

  portRev = "refs/tags/v${finalAttrs.version}";
  portHash = "sha256-SdpkuonPLgCgajW99AzJaR8uvdCPi4MdIxS5eB+Q9WQ=";

  postPatch =
    ''
      substituteInPlace pertheme/*.conf \
        --replace-fail 'Font="Noto Sans"' 'Font="${font}"' \
        --replace-fail 'FontSize=9' 'FontSize=${toString fontSize}'
    ''
    + lib.optionalString (background != null) ''
      substituteInPlace $configFile \
        --replace-fail 'Background="backgrounds/wall.jpg"' 'Background="${background}"' \
        --replace-fail 'CustomBackground="false"' 'CustomBackground="true"'
    ''
    + lib.optionalString loginBackground ''
      substituteInPlace $configFile \
        --replace-fail 'LoginBackground="false"' 'LoginBackground="true"'
    '';

  nativeBuildInputs = [
    just
  ];

  propagatedBuildInputs = [
    kdePackages.qtsvg
  ];

  dontCatppuccinInstall = true;

  dontWrapQtApps = true;

  buildPhase = ''
    runHook preBuild
    just build
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/sddm
    mv dist $out/share/sddm/themes

    runHook postInstall
  '';

  postFixup = ''
    mkdir -p $out/nix-support
    echo ${kdePackages.qtsvg} >> $out/nix-support/propagated-user-env-packages
  '';

  meta = {
    platforms = lib.platforms.linux;
  };
})
