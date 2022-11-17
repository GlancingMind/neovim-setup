
{ pkgs, dsl, ... }:

{
  plugins = with pkgs.vimPlugins; [
    telescope-nvim
    telescope-fzy-native-nvim
  ];

  nnoremap = let
    telescope = sub-command: "<cmd>Telescope ${sub-command}<cr>";
  in {
    "<c-p>" = telescope "buffers";
    "<leader>e" = telescope "find_files";
    "<leader>f" = telescope "live_grep";
    "<leader>]" = telescope "tags";
    "<leader>h" = telescope "help_tags";
    "<leader>t" = telescope "";
  };

  use.telescope.load_extension = dsl.callWith "fzy_native";

  setup.telescope = {
    defaults = {
      mappings = {
        i = {
          "['<esc>']" = dsl.rawLua "require('telescope.actions').close";
        };
      };
    };
  };
}
