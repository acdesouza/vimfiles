colorscheme railscasts " Set color scheme

set guioptions-=T     "Hide toolbar

set showtabline=1 " Show tab line

" Hack to fullscreen {{{
set lines=1280
set columns=800
" ------------------ }}}

if has("mac")
  set guifont=Menlo:h14
else
  set guifont=Courier:h14
endif
