{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          packages = with pkgs; [
            ripgrep
          ];
        };
        nested = pkgs.mkShell {
          packages = with pkgs; [
            nodejs
            # yarn
          ];
        };
      };
    };
}
