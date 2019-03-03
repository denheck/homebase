let mapleader = "\<Space>" 
let maplocalleader = "\<bs>"

filetype on
filetype plugin indent on
set encoding=utf-8
syntax on " enable syntax highlighting

" Install Plugins
" Need to run :PlugInstall before plugins will work
"call plug#begin('~/.vim/plugged')
"Plug 'SirVer/ultisnips'
"Plug 'flazz/vim-colorschemes'
"Plug 'Chiel92/vim-autoformat', { 'on': 'Autoformat' }
"Plug 'reasonml-editor/vim-reason-plus'
"Plug 'vim-airline/vim-airline'
"Plug 'derekwyatt/vim-scala'

" Better Rainbow Parenthesis (https://github.com/kien/rainbow_parentheses.vim)
"Plug 'kien/rainbow_parentheses.vim'
" Golang
" Plug 'fatih/vim-go'
" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" Elixir
" Plug 'elixir-lang/vim-elixir'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'scrooloose/nerdtree'
"Plug 'mileszs/ack.vim'
" send text from VIM to another TMUX terminal (REPL)
"Plug 'jpalardy/vim-slime'

" install php language server plugin for use with 
" TODO might be able to get this from DockerHub for improved performance
" https://hub.docker.com/r/felixfbecker/php-language-server/
" Plug 'felixfbecker/php-language-server', {'do': 'docker build -t php-language-server .'}

" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
" Plug 'w0rp/ale'

" Needed for Deoplete
" 1. Ensure Neovim is installed (doesn't have to be used as VIM8 will talk to it over rpc) 
"    'pip3 install neovim' for Deoplete to work
" 2. Ensure latest VIM is installed with +python3 and +timers
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif

"Plug 'purescript-contrib/purescript-vim'
"Plug 'frigoeu/psc-ide-vim'

" Language Server Protocol (LSP) Client
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"call plug#end() 

" Register Language Servers (LSP) with respective languages
let g:LanguageClient_serverCommands = {
    \ 'reason': ['/usr/local/bin/reason-language-server.exe'],
    \ 'ocaml': ['/usr/local/bin/reason-language-server.exe'],
    \ 'php': ['/usr/local/bin/docker', 'run', '-i', '-v', $HOME.'/projects:'.$HOME.'/projects', 'felixfbecker/php-language-server:latest', 'php', 'bin/php-language-server.php']
    \ }

" Change g:LanguageClient_loggingLevel to DEBUG for more info
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile = $HOME.'/.vim/LanguageClient.log'
let g:LanguageClient_serverStderr = $HOME.'/.vim/LanguageServer.log'

" ALE completion
" Enable completion where available.
" This setting must be set before ALE is loaded.
" let g:ale_completion_enabled = 1

" Better Rainbow Parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]

" number of spaces a tab counts for when a file is read
set tabstop=4
" number of spaces added/removed when a tab is added/removed
set softtabstop=4
" convert tabs to spaces
set expandtab

" UI Configuration
set number " show line numbers
set showcmd " show command in bottom bar
" set cursorline " adds horizontal line to the line your cursor is on

" vim-airline package configuration (https://github.com/bling/vim-airline)
set laststatus=2

" disable word wrap
set nowrap

" disable .swp files
set noswapfile

" highlight all search matches
set hlsearch

" NERDTree (https://github.com/scrooloose/nerdtree)
" autocmd VimEnter * NERDTree " Open NERDTree when vim starts

" override default php indentation
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4

" override default ruby indentation
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

" override default c indentation
autocmd FileType c setlocal expandtab shiftwidth=2 tabstop=2

" override default js indentation
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 

autocmd Filetype vim setlocal expandtab tabstop=2 shiftwidth=2

" ALTERNATIVE COLOR SCHEMES
" -------------------------
" antares
" badwolf
" Benokai
" birds-of-paradise
" blacklight
" brogrammer
" buddy
" burnttoast256
" busierbee
" CandyPaper
" Chasing_Logic
" deepsea
" desertEx
" desertink
" distinguished
" evening
colorscheme antares

" OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" yank to clipboard (Doesn't seem to work in TMUX)
" if has("clipboard")
"   set clipboard=unnamed " copy to the system clipboard

"   if has("unnamedplus") " X11 support
"    set clipboard+=unnamedplus
"  endif
"endif

if $TMUX == ''
  set clipboard+=unnamed
endif

vnoremap <C-c> :w !pbcopy<CR><CR>

" configure vim-slime to use TMUX 
let g:slime_target = "tmux"

" open NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>

" search for word under cursor with Ack.vim
noremap <Leader>a :Ack <cword><cr>

" switch to normal mode
" inoremap <LocalLeader>n <Esc>

" map leader Space pressed in quick succession to save the file
nnoremap <Leader>s <Esc>:w<CR>

" open FZF fuzzy finder
nnoremap <Leader>f :FZF<CR>

" cycle through listed buffers
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>

" VIM Slime
nnoremap <Leader>cc :SlimeSend<CR>
nnoremap <Leader>cl :SlimeSendCurrentLine<CR>

" configure ack.vim to use the Silver Searcher
let g:ackprg = 'ag --vimgrep'

" set tags file to search recursively for a tags file starting in the current
" current directory until it gets to the root
" set tags=./tags;

" Ultisnips expand trigger
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsEditSplit="vertical"

" Prevents strange characters from showing in NERDTree file explorer
let g:NERDTreeNodeDelimiter = "\u00a0"

" Deoplete
let g:deoplete#enable_at_startup = 1
