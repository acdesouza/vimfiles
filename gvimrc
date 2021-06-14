colorscheme luna  " Set color scheme

set guioptions-=T " Hide toolbar

set showtabline=1 " Show tab line

" Hack to fullscreen {{{
set lines=1280
set columns=800
" ------------------ }}}

if has("mac")
  set guifont=Menlo:h14
elseif has("gui_gtk2") || has("gui_gtk3")
  set guifont=Menlo\ 11
  set noantialias

  " Tab navigation like Firefox.
  nnoremap <C-S-tab> :tabprevious<CR>
  nnoremap <C-tab>   :tabnext<CR>
  nnoremap <C-t>     :tabnew<CR>
  inoremap <C-S-tab> <Esc>:tabprevious<CR>i
  inoremap <C-tab>   <Esc>:tabnext<CR>i
  inoremap <C-t>     <Esc>:tabnew<CR>
endif
