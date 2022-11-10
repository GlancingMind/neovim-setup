{ pkgs, lib, ...}:

{
  plugins = with pkgs.vimPlugins; [
    (nvim-treesitter.withPlugins (plugins:
      pkgs.tree-sitter.allGrammars))
    nvim-ts-autotag
    nvim-autopairs
  ];

  setup."nvim-treesitter.configs".setup = {
    highlight = {
      enable = true;
      disable = [];
    };
    indent = {
      enable = true;
      disable = [];
    };
    autotag = {
      enable = true;
    };
  };

  setup.nvim-autopairs.setup = {
    disable_filetype = [ "TelescopePrompt" ];
  };
}
