" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
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
set clipboard=unnamedplus

" Set the default indentation for markdown files
set tabstop=2       " Number of spaces that a <Tab> counts for
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent
set expandtab       " Use spaces instead of tabs

" Enable search highlighting
set hlsearch
set incsearch

" colorscheme desert

" Set a reasonable timeout for key mappings
set timeoutlen=500

set termguicolors     " enable true colors support

" Yank highlight functionality
if has('textprop') && has('timers')
  " Define the text property type for yanked text
  silent! call prop_type_delete('yank_prop')
  call prop_type_add('yank_prop', {
    \ 'highlight': 'IncSearch',
    \ 'combine': v:false
  \})

  function! Highlight(timeout) abort
    if !v:event.visual && v:event.operator == 'y' && !(empty(v:event.regtype))
      let start = getpos("'[")
      let start_line = start[1]
      let start_col = start[2]
      let end_line = getpos("']")[1]
      let shift = start_line == end_line ? start_col - 1 : 0
      let length = len(v:event.regcontents[-1]) + 1 + shift
      let bufnr = str2nr(expand('<abuf>'))

      call prop_add(start_line, start_col, {
        \ 'end_lnum': end_line,
        \ 'end_col': length,
        \ 'type': 'yank_prop'
      \})

      call timer_start(a:timeout, {-> prop_remove({'bufnr': bufnr, 'type': 'yank_prop', 'all': v:true}, start_line, end_line)})
    endif
  endfunction

  " Set up autocommand to highlight yanked text
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * call Highlight(100)
  augroup END
endif
