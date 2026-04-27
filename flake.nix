{
  description = "Terraform E-Portfolio";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    presenterm.url = "github:mfontanini/presenterm";
    presenterm.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, presenterm }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    present = pkgs.writeShellScriptBin "present" ''
      kitty -c kitty.conf -T "Terraform E-Portfolio" \
      presenterm --config-file presenterm.yaml slides/slides.md
    '';
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [ 
        terraform
        kitty
        present
        typst
      ] ++ [
        presenterm.outputs.packages.${system}.default
      ];
    };
  };
}
