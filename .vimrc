set nocompatible

set guioptions-=T "Hide toolbar

set number "Show line number
set ruler "Show line and column number

set encoding=utf-8    " Define file to utf-8
"Add utf-8 shebang line
noremap <D-1> :0put = '#-*- coding: utf-8 -*-'<CR>

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set nowrap
set expandtab "Convert tabs char to spaces.
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

"Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

set showmatch "Show braces matchs

set cursorline "highlight current line

set incsearch "Select search match while typing

set guifont=Courier:h14

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"Pathogen config
call pathogen#runtime_append_all_bundles()

"NERDTree Toggle using \][ keymap
noremap <Leader>][ :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2 "Sincronizar o CommandT com o NERDTree

" NERD Commenter: Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle
imap <D-/> <Esc><plug>NERDCommenterToggle

let g:CommandTMaxHeight=20 "Show only 20 files, on Command-T
set wildignore+=.git/**,vendor/** "Ignore directories inside: .git, vendor


" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

