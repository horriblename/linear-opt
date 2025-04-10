{
  inputs = {
    zimpl.url = "github:scipopt/zimpl";
    zimpl.flake = false;
    scip.url = "github:scipopt/scip";
    scip.flake = false;
  };
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    packages.${system} = {
      zimpl = pkgs.callPackage ./zimpl.nix {src = inputs.zimpl;};
      scip = pkgs.callPackage ./scip.nix {src = inputs.scip;};
    };

    devShells.${system}.default = pkgs.mkShell {
      packages = [self.packages.${system}.zimpl];
    };
  };
}
