{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        utils.url = "github:numtide/flake-utils";
    };

    outputs = {self, nixpkgs, utils}:
    let out = system:
    let pkgs = nixpkgs.legacyPackages."${system}";
    in {

        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            rustc
            cargo
            gcc
            rustfmt
            clippy 
          ];
          RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
        };

    }; in with utils.lib; eachSystem defaultSystems out;

}
