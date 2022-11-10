{ neovimBuilder, neovim-unwrapped }:

neovimBuilder {
  imports = [
    ./modules/appearance.nix
    ./modules/lsp
    ./modules/treesitter
  ];

  package = neovim-unwrapped;

  enableViAlias = true;
  enableVimAlias = true;
}
