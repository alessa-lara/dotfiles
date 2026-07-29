{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    };

    outputs = { self, nixpkgs }: 
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        # development environment
        devShells.${system}.default = pkgs.mkShell {
            packages = [
                pkgs.gcc
                pkgs.clang-tools
            ];
        };
    };
}
