{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        utils.url = "github:numtide/flake-utils";
    };

    outputs = {self, nixpkgs, utils}:
    let out = system:
    let pkgs = nixpkgs.legacyPackages."${system}";
    in {

        devShell = pkgs.mkShell.override { inherit (pkgs.swift) stdenv; } {
            buildInputs = with pkgs; [
              swift
              swiftPackages.swiftpm
              swiftPackages.Foundation
              swiftPackages.XCTest
              swiftPackages.stdenv
            ];
            LD_LIBRARY_PATH = "${pkgs.swiftPackages.Dispatch}/lib";
        };

    }; in with utils.lib; eachSystem defaultSystems out;

}
