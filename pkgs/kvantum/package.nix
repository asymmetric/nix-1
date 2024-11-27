{
  lib,
  mkCatppuccinDerivation,
}:

mkCatppuccinDerivation (finalAttrs: {
  pname = "catppuccin-kvantum";

  portRev = "bdaa531318d5756cea5674a750a99134dad0bbbc";
  portHash = "sha256-O85y8Gg0l+xQP1eQi9GizuKfLEGePZ3wPdBNR+0V4ZQ=";

  dontCatppuccinInstall = true;

  postInstall = ''
    mkdir -p $out/share
    mv themes $out/share/Kvantum/
  '';

  meta = {
    platforms = lib.platforms.linux;
  };
})
