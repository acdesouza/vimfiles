filetype off                   " required!
set nocompatible               " be iMproved
" Get over Ex mode
nnoremap Q <nop>

" ==========================================
" Vundle configs ---------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" ------------------------------------------

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
" original repos on github
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-endwise.git'
Plugin 'godlygeek/tabular'

"Plugin 'claco/jasmine.vim.git'
"Plugin 'groenewege/vim-less'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'tpope/vim-rails.git'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-ragtag.git'
Plugin 'elixir-lang/vim-elixir'

Plugin 'Pychimp/vim-luna'
Plugin 'altercation/vim-colors-solarized.git'

" ------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
" ==========================================


filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific plugins
set cindent           "To make html code indent properly. No idea why this works.
                      "http://stackoverflow.com/questions/815548/how-do-i-tidy-up-an-html-files-indentation-in-vi
filetype indent on    " Enable filetype-specific indenting
syntax on             " Enable syntax highlighting
set lazyredraw        " redraw only when we need to.
set wildmenu          " visual autocomplete for command menu

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

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' ' . (i + 1) . ':%{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction
set tabline=%!MyTabLine()

nnoremap <C-t>n :tabnew<CR>

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
autocmd BufNewFile,BufRead {Gruntfile,*.json}                                 set filetype=javascript
" Config erb to correct filetype
autocmd BufNewFile,BufRead *.js.erb                                           set filetype=javascript
autocmd BufNewFile,BufRead *.less.erb                                         set filetype=less
autocmd BufNewFile,BufRead *.js.coffee                                        set filetype=coffee

set showmatch "Show braces matchs

" This makes files with long lines freezing slow
" http://stackoverflow.com/questions/4775605/vim-syntax-highlight-improve-performance#comment11224954_7187629
"set cursorline "highlight current line

set incsearch "Select search match while typing

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Dear Vim,
"   We've reach year 2017.
"   We have SCMs.
"   Don't bother creating backup files
" Love,
" Me
set nobackup
set nowritebackup
set noswapfile

"set clipboard=unnamed "http://vim.wikia.com/wiki/Accessing_the_system_clipboard

"NERDTree Toggle using \][ keymap
noremap <Leader>][ :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2 "This changes current dir, so sync CommandT to look the same path as NERDTree is.

" NERDTree find current buffer on tree
noremap <leader>] :NERDTreeFind<cr>

noremap <Leader>pr :ClearCtrlPCache<CR>:CtrlP pwd<CR>

" NERD Commenter: <Leader>c to toggle comments
map <Leader>c <plug>NERDCommenterToggle

" CTags: <Leader>]r to refresh exuberant ctags file
set tags+=.git/tags
function! RefreshCTags()
  silent !ctags -R -f .git/tags .
  redraw!
endfunction
" Refresh ctags
noremap <Leader>]r :call RefreshCTags()<CR>

" Global ignore file and directories -----------------
set wildignore+=.git,.hg    " Version control
set wildignore+=*.orig      " Merge resolution files

set wildignore+=vendor      " Rails
set wildignore+=*/doc/app/*   " Rails docs
set wildignore+=tmp         " Thinking of Rails tmp. But, will work for more
set wildignore+=log         " Thinking of Rails log. But, will work for more


set wildignore+=_site       " Jekyll

if has("mac")
  set wildignore+=.DS_Store " OSX bullshit
endif
" ----------------------------------------------------

" Search ---------------------------------------------
" Grep opening on Location List
command! -nargs=+ GrepProject execute 'silent lgrep! -r --exclude-dir=.git --exclude-dir=.sass-cache --exclude-dir=coverage --exclude-dir=tmp --exclude-dir=log --exclude-dir=doc --exclude-dir=node_modules <args>' | lopen 20

" CtrlP ignore
"let g:ctrlp_custom_ignore = '|DS_Store\|git'
let g:ctrlp_custom_ignore = '\v[\/](bower_components|node_modules)$'

colorscheme luna-term " Set color scheme
