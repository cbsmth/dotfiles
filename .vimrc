filetype off
filetype plugin indent on
syntax on
colorscheme paintbox
call pathogen#infect()
set nocompatible
set modelines=0
set ts=4
set shiftwidth=4
set softtabstop=4
set number
set incsearch
set smartindent
set vb t_vb=
set noerrorbells
set novisualbell
set tm=500
set encoding=utf-8
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
nnoremap <F5> :GundoToggle<CR>
let mapleader = ","
nnoremap/ /\v
vnoremap/ /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap<leader><space> :noh<cr>
nnoremap<up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap<leader>a :Ack
nnoremap<leader>ft Vatzf
nnoremap<leader>w <C-w>v<C-w>l
nnoremap<C-h> <C-w>h
nnoremap<C-j> <C-w>j
nnoremap<C-k> <C-w>k
nnoremap<C-l> <C-w>l
