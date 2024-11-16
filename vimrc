let mapleader = " "
nnoremap <Leader>w :w<CR> " Save file
nnoremap <Leader>q :q<CR> " Quit Vim

" Remap 'x' to delete without affecting the clipboard
nnoremap x "_x
vnoremap x "_x

" Remap 'd' to delete without affecting the clipboard
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D

" Use leader key to delete with clipboard
nnoremap <Leader>x x
nnoremap <Leader>d d
nnoremap <Leader>D D
vnoremap <Leader>d d
vnoremap <Leader>D D

" Enable relative line numbers
set relativenumber
set number

" Optional: Enable file type plugins
filetype plugin on

" Enable syntax highlighting
syntax on

" Set filetype to markdown
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown

" Enable mouse support
set mouse=a

" Enable line wrapping
set wrap
set linebreak
set breakindent

" Use system clipboard for yank and paste
set clipboard=unnamed

" Enable highlighting of the current line
set cursorline

" Set the default indentation for markdown files
set tabstop=2       " Number of spaces that a <Tab> counts for
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent
set expandtab       " Use spaces instead of tabs

" Enable search highlighting
set hlsearch
set incsearch

colorscheme desert

" Set a reasonable timeout for key mappings
set timeoutlen=500

" Optional: Set a specific color scheme (choose one you prefer)

set termguicolors     " enable true colors support
