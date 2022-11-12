{ pkgs, ... }:

{
  imports = [
    ./colorschemes/gruvbox
    ./statusline
  ];

  plugins = with pkgs.vimPlugins; [
    zen-mode-nvim
  ];

  setup.zen-mode = {
    window = {
      backdrop = 1;
      options = {
        cursorcolumn = false;
        cursorline = false;
      };
    };
  };

  set = {
    background="light";

    #highlight coloumn and cursorline
    cursorline = true;
    cursorcolumn = true;

    #set visual printline/mark on coloumn 80
    cc="80";
    syntax="on"; #enable syntax highlighting
    laststatus=2; #display status line always
  };
}
