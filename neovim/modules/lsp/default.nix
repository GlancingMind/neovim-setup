{ pkgs, lib, dsl, ... }:

let
  inherit (lib) getExe;
  capabilities = dsl.rawLua "capabilities";
in {
  imports = [
    ./completion.nix
  ];

  plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
  ];

  use.lspconfig.gopls.setup = dsl.callWith {
    cmd = [ (getExe pkgs.gopls) ];
    inherit capabilities;
  };

  use.lspconfig.rnix.setup = dsl.callWith {
    cmd = [ (getExe pkgs.rnix-lsp) ];
    inherit capabilities;
  };
}
