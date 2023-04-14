{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, std }: std.growOn
    {
      inherit inputs;
      cellsFrom = ./cells;
      cellBlocks = with std.blockTypes; [
        (devshells "devshells" { ci.build = true; })
      ];
    }
    {
      devShells = std.harvest self [
        [ "root" "devshells" ]
        [ "nested" "devshells" ]
      ];
    };
}
