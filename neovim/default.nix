{ neovimBuilder, neovim-unwrapped }:

neovimBuilder {
  imports = [
    ./modules/appearance.nix
  ];

  package = neovim-unwrapped;

  enableViAlias = true;
  enableVimAlias = true;
}
