{ pkgs, dsl, ... }:

{
  imports = [
    ./completion.nix
    ./servers.nix
  ];

  plugins = with pkgs.vimPlugins; [
    lspsaga-nvim
  ];

  use.lspsaga.init_lsp_saga = dsl.callWith {
    error_sign = "E";
    warn_sign = "W";
    hint_sign = "H";
    infor_sign = "I";
    border_style = "round";
  };

  # lsp finder
  nnoremap."<silent> gh" = "<Cmd>Lspsaga lsp_finder<CR>";

  # show code actions
  nnoremap."<silent> <leader> ca" = "<Cmd>Lspsaga code_action<CR>";
  vnoremap."<silent> <leader> ca" = "<Cmd><C-U>Lspsaga range_code_action<CR>";

  # show hover doc
  nnoremap."<silent> K" = "<Cmd>Lspsaga hover_doc<CR>";

  # show signature help
  nnoremap."<silent> <leader> gs" = "<Cmd>Lspsaga signature_help<CR>";

  # show rename window
  nnoremap."<silent> <leader> rs" = "<Cmd>Lspsaga rename<CR>";

  # preview definition
  nnoremap."<silent> <leader> K" = "<Cmd>Lspsaga preview_definition<CR>";

  # show diagnostics
  nnoremap."<silent> leader> sd" = "<Cmd>Lspsaga show_line_diagnostics<CR>";
  # jump diagnostic
  nnoremap."<silent> <leader> nd" = "<Cmd>Lspsaga diagnostic_jump_next<CR>";
  nnoremap."<silent> <leader> pd" = "<Cmd>Lspsaga diagnostic_jump_prev<CR>";
}
