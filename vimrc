set nocompatible               " be iMproved
filetype off                   " required!

" ==========================================
" Vundle configs ---------------------------
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-endwise.git'
Bundle 'claco/jasmine.vim.git'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-ragtag.git'
Bundle 'tpope/vim-rails.git'
Bundle 'vim-ruby/vim-ruby.git'
"Bundle 'tpope/vim-pathogen.git'
" ==========================================


filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific plugins
filetype indent on    " Enable filetype-specific indenting
syntax on             " Enable syntax highlighting

set nocompatible

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

" RagTag init.
let g:ragtag_global_maps = 1

" Custom tab format, basend on languange conventions.
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd BufWritePre * :%s/\s\+$//e " Remove trailing spaces

" Enable custom syntax highlight
autocmd BufNewFile,BufRead {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}  set filetype=ruby
autocmd BufNewFile,BufRead *.json                                             set filetype=javascript
" Config erb to correct filetype
autocmd BufNewFile,BufRead *.js.erb                                           set filetype=javascript
autocmd BufNewFile,BufRead *.less.erb                                         set filetype=less

set showmatch "Show braces matchs

set cursorline "highlight current line

set incsearch "Select search match while typing

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"NERDTree Toggle using \][ keymap
noremap <Leader>][ :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2 "This changes current dir, so sync CommandT to look the same path as NERDTree is.

noremap <Leader>pr :ClearCtrlPCache<CR>:CtrlP pwd<CR>

" NERD Commenter: <Leader>c to toggle comments
map <Leader>c <plug>NERDCommenterToggle

" Global ignore file and directories -----------------
set wildignore+=.git,.hg    " Version control
set wildignore+=*.orig      " Merge resolution files

set wildignore+=vendor      " Rails
if has("mac")
  set wildignore+=.DS_Store " OSX bullshit
endif
" ----------------------------------------------------
