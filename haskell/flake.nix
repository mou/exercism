{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        utils.url = "github:numtide/flake-utils";
    };

    outputs = {self, nixpkgs, utils}:
    let out = system:
    let
      pkgs = nixpkgs.legacyPackages."${system}";
      hPkgs = pkgs.haskell.packages."ghc983";
      devEnv = [
        hPkgs.ghc # GHC compiler in the desired version (will be available on PATH)
        hPkgs.ghcid # Continuous terminal Haskell compile checker
        hPkgs.ormolu # Haskell formatter
        hPkgs.hlint # Haskell codestyle checker
        hPkgs.hoogle # Lookup Haskell documentation
        hPkgs.haskell-language-server # LSP server for editor
        hPkgs.implicit-hie # auto generate LSP hie.yaml file from cabal
        hPkgs.retrie # Haskell refactoring tool
        # hPkgs.cabal-install
        stack-wrapped
        pkgs.zlib # External C library needed by some Haskell packages
      ];
      stack-wrapped = pkgs.symlinkJoin {
        name = "stack"; # will be available as the usual `stack` in terminal
        paths = [ pkgs.stack ];
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/stack \
            --add-flags "\
              --no-nix \
              --system-ghc \
              --no-install-ghc \
            "
        '';
      };
    in {

        devShell = pkgs.mkShell {
          buildInputs = devEnv;
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath devEnv;
        };

    }; in with utils.lib; eachSystem defaultSystems out;

}
