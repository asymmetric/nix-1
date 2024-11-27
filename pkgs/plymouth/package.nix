{
  lib,
  mkCatppuccinDerivation,
}:

mkCatppuccinDerivation (finalAttrs: {
  pname = "catppuccin-plymouth";

  portRev = "e0f58d6fcf3dbc2d35dfc4fec394217fbfa92666";
  portHash = "sha256-He6ER1QNrJCUthFoBBGHBINouW/tozxQy3R79F5tsuo=";

  dontCatppuccinInstall = true;

  postPatch = ''
    substituteInPlace themes/**/*.plymouth \
      --replace-fail '/usr' '${placeholder "out"}'
  '';

  postInstall = ''
    mkdir -p $out/share/plymouth
    mv themes/ $out/share/plymouth/themes/
  '';

  meta = {
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
})
