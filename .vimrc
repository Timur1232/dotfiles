" Taken from https://github.com/rexim/dotfiles/blob/master/.vimrc
syntax on
filetype plugin indent on

set nomodeline
set modelines=0
set tabstop=4
set shiftwidth=4
set expandtab
set guifont=Iosevka\ 20
set guioptions-=m
set guioptions-=T
set noesckeys
set relativenumber
set number
set ignorecase
set smartcase
set incsearch
set cinoptions=l1
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set autoindent
set autochdir

colorscheme habamax

autocmd BufEnter * if &filetype == "go" | setlocal noexpandtab
autocmd BufNewFile,BufRead ?\+.c3 setf c
