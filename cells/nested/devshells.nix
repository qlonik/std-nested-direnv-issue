{ inputs, cell }: {
  nested = inputs.std.lib.dev.mkShell {
    packages = with inputs.nixpkgs; [
      nodejs
      # yarn
    ];
  };
}
