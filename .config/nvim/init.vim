set tabstop=2
set shiftwidth=2
set noexpandtab
set smarttab
set hlsearch
set autoindent

if has("autocmd")
  filetype plugin indent on
endif

" start at to last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

augroup python_files
    autocmd!
    autocmd FileType python setlocal noexpandtab
    autocmd FileType python set tabstop=2
    autocmd FileType python set shiftwidth=2
augroup END

call plug#begin('~/.vim/plugged')
Plug 'jalvesaq/Nvim-R'
Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'
call plug#end()
"set mouse=a
let R_assign = 0

au BufReadPost,BufNewFile *.html :syntax sync fromstart

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile
