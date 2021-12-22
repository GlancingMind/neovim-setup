{
  description = "A very basic flake";

  inputs = {
    nixpkgs-unstable.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    flake-utils.url = github:numtide/flake-utils;
    nix2vim = {
      url = github:gytis-ivaskevicius/nix2vim;
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, nix2vim }:
  flake-utils.lib.eachDefaultSystem(system: let
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ nix2vim.overlay ];
    };

    unstable-pkgs = nixpkgs-unstable.legacyPackages.${system};

    packages = rec {
      default = neovim;
      neovim = pkgs.callPackage ./neovim {
        inherit (unstable-pkgs) neovim-unwrapped;
      };
    };

    apps = {
      default = flake-utils.lib.mkApp {
        name = "nvim";
        drv = packages.neovim;
      };
    };

    devShells = {
      default = pkgs.callPackage ./shells {};
    };
  in { inherit packages apps devShells; });
}
