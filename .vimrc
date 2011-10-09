filetype off          " force reloading *after* pathogen loaded

" Pathogen config
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
syntax on             " Enable syntax highlighting

set nocompatible

set guioptions-=T     "Hide toolbar

" status-line setup
set statusline=%m\      " file is modified
set statusline+=%f      " tail of the filename
set statusline+=%=      " left/right separator
set statusline+=%y\     " filetype
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ %P    " percent through file
set laststatus=2        " always show status-line
set showcmd             " show (partial) command in the last line of the screen
                        "    this also shows visual selection info

" Toggle column with line numbers
map <Leader>ln :set number!<CR>
" Toggle column with distance in lines
map <Leader>lr :set relativenumber!<CR>
" Initialize showing line numbers
set number            " Show line number

set encoding=utf-8    " Define file to utf-8
"Add utf-8 shebang line
noremap <D-1> :0put = '#-*- coding: utf-8 -*-'<CR>

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
let g:NERDTreeChDirMode=2 "This changes current dir, so sync CommandT to look the same path as NERDTree is.

" NERD Commenter: Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle
imap <D-/> <Esc><plug>NERDCommenterToggle

let g:CommandTMaxHeight=20        "Show only 20 files, on Command-T
let g:CommandTMatchWindowAtTop=1  "Show Command-T on top of screen, so I don`t lost focus on first match
set wildignore+=.git/**,vendor/** "Ignore directories inside: .git, vendor
" Re-read current dir to search for new files.
nmap <Leader>tr :CommandTFlush<CR>
