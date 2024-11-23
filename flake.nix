{
  description = "Soothing pastel theme for Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, self }:

    let
      inherit (nixpkgs) lib;
      systems = lib.systems.flakeExposed;

      # flake-utils pollyfill
      forEachSystem =
        fn:
        lib.foldl' (
          acc: system:
          lib.recursiveUpdate acc (
            lib.mapAttrs (lib.const (value: {
              ${system} = value;
            })) (fn system)
          )
        ) { } systems;

      mkModule =
        {
          name ? "catppuccin",
          type,
          file,
        }:
        { pkgs, ... }:
        {
          _file = "${self.outPath}/flake.nix#${type}Modules.${name}";

          imports = [ file ];

          catppuccin.sources = lib.mkDefault self.packages.${pkgs.stdenv.hostPlatform.system};
        };
    in

    lib.mergeAttrsList [
      (forEachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells.default = import ./shell.nix { inherit pkgs; };

          formatter = pkgs.nixfmt-rfc-style;

          packages =
            let
              catppuccinPackages = import ./default.nix { inherit pkgs; };
            in
            catppuccinPackages // { default = pkgs.emptyFile; };
        }
      ))

      {
        homeManagerModules.catppuccin = mkModule {
          type = "homeManager";
          file = ./modules/home-manager;
        };

        nixosModules.catppuccin = mkModule {
          type = "nixos";
          file = ./modules/nixos;
        };
      }
    ];
}
