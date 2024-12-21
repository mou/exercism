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
            buildInputs = with pkgs; [
              gcc
            ];
        };

    }; in with utils.lib; eachSystem defaultSystems out;

}
