{ pkgs, dsl, ... }:

with dsl; {
  plugins = with pkgs.vimPlugins; [
    # Completion
    nvim-cmp
    cmp-buffer
    cmp-nvim-lsp
    cmp-nvim-lsp-signature-help
    cmp-nvim-lsp-document-symbol
    # Completion entry formating
    lspkind-nvim
    (pkgs.nerdfonts.override {
      fonts = [ "FantasqueSansMono" ];
    })
  ];

  setup.cmp = {
    sources = [
      { name = "nvim_lsp_signature_help"; }
      { name = "nvim_lsp_document_symbol"; }
      { name = "nvim_lsp"; }
      { name = "buffer"; }
      { name = "path"; }
    ];
    mapping = {
      "['<C-n>']" = rawLua ''cmp.mapping.select_next_item({
          behavior = require('cmp').SelectBehavior.Insert
        })'';
      "['<Down>']" = rawLua ''cmp.mapping.select_next_item({
          behavior = require('cmp').SelectBehavior.Select
        })'';
      "['<Tab>']" = rawLua ''cmp.mapping.select_next_item({
        behavior = require('cmp').SelectBehavior.Select
      })'';

      "['<C-p>']" = rawLua ''cmp.mapping.select_prev_item({
          behavior = require('cmp').SelectBehavior.Insert
        })'';
      "['<Up>']" = rawLua ''cmp.mapping.select_prev_item({
          behavior = require('cmp').SelectBehavior.Select
        })'';
      "['<S-Tab>']" = rawLua ''cmp.mapping.select_prev_item({
        behavior = require('cmp').SelectBehavior.Select
      })'';

      "['<C-d>']" = rawLua "cmp.mapping.scroll_docs(-4)";
      "['<C-f>']" = rawLua "cmp.mapping.scroll_docs(4)";
      "['<C-Space>']" = rawLua "cmp.mapping.complete()";
      "['<C-e>']" = rawLua "cmp.mapping.close()";
      "['<CR>']" = rawLua ''cmp.mapping.confirm({
          behavior = require('cmp').ConfirmBehavior.Replace,
          select = true,
        })'';
    };
  };

  use.lspkind.init = callWith {
    menu ={
      buffer = "[Buffer]";
      nvim_lsp = "[LSP]";
    };
    symbol_map = {
      Text = "";
      Method = "";
      Function = "";
      Constructor = "";
      Field = "ﰠ";
      Variable = "";
      Class = "ﴯ";
      Interface = "";
      Module = "";
      Property = "ﰠ";
      Unit = "";
      Value = "";
      Enum = "";
      Keyword = "";
      Snippet = "";
      Color = "";
      File = "";
      Reference = "";
      Folder = "";
      EnumMember = "";
      Constant = "";
      Struct = "";
      Event = "";
      Operator = "";
      TypeParameter = "";
    };
  };
}
