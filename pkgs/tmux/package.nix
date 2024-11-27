{
  lib,
  fetchCatppuccinPort,
  tmuxPlugins,
}:

tmuxPlugins.mkTmuxPlugin rec {
  pluginName = "catppuccin";
  version = builtins.substring 0 7 src.rev;

  src = fetchCatppuccinPort {
    port = "tmux";
    rev = "179572333b0473020e45f34fd7c1fd658b2831f4";
    hash = "sha256-9+SpgO2Co38I0XnEbRd7TSYamWZNjcVPw6RWJIHM+4c=";
  };

  meta = {
    description = "Soothing pastel theme for tmux";
    homepage = "https://github.com/catppuccin/tmux";
    license = lib.licenses.mit;
  };
}
