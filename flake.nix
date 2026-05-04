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
    slides-present = pkgs.writeShellScriptBin "slides-present" ''
      kitty -T "Terraform E-Portfolio" -- presenterm slides/slides.md -x -X $@ 
    '';

    slides-export = pkgs.writeShellScriptBin "slides-export" ''
      presenterm slides/slides.md -e $@
    '';
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [ 
        terraform
        kitty
        python313Packages.weasyprint
        slides-present
        slides-export
      ] ++ [
        presenterm.outputs.packages.${system}.default
      ];

      KITTY_CONFIG_DIRECTORY = ".";
      PRESENTERM_CONFIG_FILE = "presenterm.yaml";
    };
  };
}
