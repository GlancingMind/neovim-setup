{ pkgs, lib, dsl, ... }:

let
  inherit (lib) getExe;
  capabilities = dsl.rawLua "capabilities";
in {
  plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    vim-nix
  ];

  use.lspconfig.gopls.setup = dsl.callWith {
    cmd = [ (getExe pkgs.gopls) ];
    filetypes = [ "go" ];
    inherit capabilities;
  };

  use.lspconfig.nil_ls.setup = dsl.callWith {
    cmd = [ (getExe pkgs.nil) ];
    filetypes = [ "nix" ];
    #root_dir = dsl.callWith "nvim_lsp.util.root_pattern('flake.nix', '.git')";
    inherit capabilities;
  };
}
