{ pkgs, ... }:

{
  plugins = [
    pkgs.vimPlugins.gruvbox-nvim
  ];

  set = {
    termguicolors = true; # Enable true color support.
  };

  lua = builtins.readFile ./gruvbox.lua;
}
