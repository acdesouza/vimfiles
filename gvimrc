colorscheme railscasts  " Set color scheme

set guioptions-=T " Hide toolbar

set showtabline=1 " Show tab line

" Hack to fullscreen {{{
set lines=1280
set columns=800
" ------------------ }}}

if has("mac")
  set guifont=Menlo:h14
elseif has("gui_gtk2")
  set guifont=DejaVuSansMono\ 14
endif
