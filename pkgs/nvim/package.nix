{
  lib,
  fetchCatppuccinPort,
  vimUtils,
}:

vimUtils.buildVimPlugin rec {
  pname = "catppuccin-nvim";
  version = builtins.substring 0 7 src.rev;

  src = fetchCatppuccinPort {
    port = "nvim";
    rev = "faf15ab0201b564b6368ffa47b56feefc92ce3f4";
    hash = "sha256-Oogw5wmYkx/zsMlPE/r6Kt3cy5sC92rwVzf0P9rzqyw=";
  };

  meta = {
    description = "Soothing pastel theme for (Neo)vim";
    homepage = "https://github.com/catppuccin/nvim/";
    license = lib.licenses.mit;
  };
}
