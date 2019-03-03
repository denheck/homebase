with import <nixpkgs> {};

vim_configurable.customize {
    name = "my_vim";
    vimrcConfig = {
        customRC = builtins.readFile ./.vimrc;
        plug.plugins = with pkgs.vimPlugins; [
          youcompleteme 
          ack-vim 
          vim-nix 
          vim-colorschemes 
          vim-airline 
          rainbow_parentheses 
          fzf-vim 
          fzfWrapper
          nerdtree 
          vim-slime
          nerdtree
        ];
    };
}
