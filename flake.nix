{
  description = "A Nix-flake-based Node.js development environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells = {
        default = (pkgs.buildFHSEnv {
          name = "deno-fhs-env";
#          runScript = "bash";
          targetPkgs = pkgs: with pkgs; [
            deno
          ];
        }).env;
      };
      apps = {
        default = let
          serv = pkgs.writeShellApplication {
            name = "build";
            runtimeInputs = [pkgs.deno];
            text = "deno task lume";
          };
        in {
          program = "${serv}/bin/build";
          type = "app";
        };
        cms = let 
          serv = pkgs.writeShellApplication {
            name = "cms";
            runtimeInputs = [pkgs.deno];
            text = "deno task lume cms";
          };
        in {
          program = "${serv}/bin/cms";
          type = "app";
        };
      };        
    });
}
