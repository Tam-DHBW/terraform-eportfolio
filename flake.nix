{
  description = "Terraform E-Portfolio";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
    present = pkgs.writeShellScriptBin "present" ''
      kitty -c kitty.conf -T "Terraform E-Portfolio" \
      presenterm --config-file presenterm.yaml slides/slides.md
    '';
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [ 
        terraform
        presenterm
        kitty
        present
        typst
      ];
    };
  };
}
