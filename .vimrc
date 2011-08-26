" Pathogen config
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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
set autoindent
set expandtab                             " Convert tabs char to spaces.
set tabstop=2 shiftwidth=2 softtabstop=2  " Set default tab size to 2

" Custom tab format, basend on languange conventions.
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

autocmd BufWritePre * :%s/\s\+$//e " Remove trailing spaces

" Enable custom sysntax highlight
autocmd BufNewFile,BufRead {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}  set filetype=ruby
autocmd BufNewFile,BufRead *.json                                             set filetype=javascript

set showmatch "Show braces matchs

set cursorline "highlight current line

set incsearch "Select search match while typing

set guifont=Courier:h14

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup


"NERDTree Toggle using \][ keymap
noremap <Leader>][ :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2 "Sincronizar o CommandT com o NERDTree

" NERD Commenter: Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle
imap <D-/> <Esc><plug>NERDCommenterToggle

let g:CommandTMaxHeight=20 "Show only 20 files, on Command-T
let g:CommandTMatchWindowAtTop=1 "Show Command-T on top of screen, so I don`t lost focus on first match
set wildignore+=.git/**,vendor/** "Ignore directories inside: .git, vendor
