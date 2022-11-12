{ neovimBuilder, neovim-unwrapped }:

neovimBuilder {
  imports = [
    ./modules/essentials.nix
    ./modules/appearance.nix
    ./modules/lsp
    ./modules/treesitter
  ];

  package = neovim-unwrapped;

  enableViAlias = true;
  enableVimAlias = true;
}
