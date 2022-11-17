{ pkgs, dsl, ... }:

{
  plugins = with pkgs.vimPlugins; [
    editorconfig-nvim
    hop-nvim
    mini-nvim

    trouble-nvim
    nvim-web-devicons
  ];

  setup.trouble = {};

  setup."mini.surround" = {};

  setup.hop = {};

  vim.g = {
    mapleader = ",";
  };

  nnoremap = {
    "." = ":";
    ":" = ".";
  };

  # expand directory path of current file by hitting %%
  cnoremap."%%" = ''<C-R>=fnameescape(expand("%:h"))."/"<cr>'';

  lua = ''
    -- search down into subfolders
    -- enables tab-completion for file search via :find
    vim.opt.path:append { "**" }
  '';

  set = {
    pastetoggle = "<F11>";
    encoding = "utf8";

    # enables completion window
    wildmenu = true;

    # show list of completions and complete to longest common substring
    wildmode = "longest:full,full";

    # completion popup menu
    completeopt = "preview,longest,menuone";

    # show types commands in bottom right corner
    showcmd = true;

    wrap = false;
    # allow backspace over everthing in insert mode
    backspace = "indent,eol,start";

    # activate row number
    number = true;

    expandtab = true;
    tabstop = 4;
    # number of spaces to use for autoindenting
    shiftwidth = 4;
    shiftround = true;
    smartindent = true;
    # insert tabs on the start of a line according to shiftwidth, not tabstop
    smarttab = true;
    autoindent = true;
    # copy the prevous indation on autoindenting
    copyindent = true;

    showmatch = true;
    # ignore case when searching
    ignorecase = true;
    # ignore case if search pattern is all lowercase, otherwise case sensitive
    smartcase = true;
    # don't highlight search terms
    hlsearch = false;

    # show search matches as you type
    incsearch = true;
    history=1000;
    undolevels=1000;
    visualbell = false;
    errorbells = false;
    backup = false;

    # prevent the need of saving before editing of a new file with :e"
    hidden = true;
  };
}
