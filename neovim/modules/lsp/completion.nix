{ pkgs, dsl, ... }:

with dsl; {
  plugins = with pkgs.vimPlugins; [
    # Completion
    nvim-cmp
    cmp-buffer
    cmp-nvim-lsp
    # Completion entry formating
    lspkind-nvim
    (pkgs.nerdfonts.override {
      fonts = [ "FantasqueSansMono" ];
    })
  ];

  setup.cmp = {
    mapping = {
      "['<C-d>']" = rawLua "cmp.mapping.scroll_docs(-4)";
      "['<C-f>']" = rawLua "cmp.mapping.scroll_docs(4)";
      "['<C-Space>']" = rawLua "cmp.mapping.complete()";
      "['<C-e>']" = rawLua "cmp.mapping.close()";
      "['<CR>']" = rawLua "cmp.mapping.confirm({ select = true, })";
    };
    sources = [
      { name = "nvim_lsp"; }
      { name = "buffer"; }
    ];
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
