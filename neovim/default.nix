{ neovimBuilder, neovim-unwrapped }:

neovimBuilder {
  imports = [
    ./modules/appearance.nix
    ./modules/lsp
  ];

  package = neovim-unwrapped;

  enableViAlias = true;
  enableVimAlias = true;
}
