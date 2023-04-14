{ inputs, cell }: {
  default = inputs.std.lib.dev.mkShell {
    packages = with inputs.nixpkgs; [
      ripgrep
    ];
  };
}
