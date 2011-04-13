set nocompatible

set guioptions-=T
set number
set ruler

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch

set incsearch

set guifont=Menlo:h13

call pathogen#runtime_append_all_bundles()

"NERDTree Toggle
noremap <Leader>][ :NERDTreeToggle<CR>
