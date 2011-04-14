set nocompatible

set guioptions-=T
set number "Show line number
set ruler

set encoding=utf-8
noremap <D-1> :0put = '#-*- coding: utf-8 -*-'<CR> "Add utf-8 shebang line

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab "Convert tabs char to spaces.

set showmatch "Show braces matchs

set cursorline "highlight current line

set incsearch "Select search match while typing

set guifont=Menlo:h13

"Pathogen config
call pathogen#runtime_append_all_bundles()

"NERDTree Toggle using \][ keymap
noremap <Leader>][ :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2 "Sincronizar o CommandT com o NERDTree

