call pathogen#infect()
filetype plugin indent on
syntax on
" color columns for c/c++
autocmd FileType cpp,c,cc,cxx,h,hpp match ErrorMsg '\%>80v.\+'
" don't remember position for git commits
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
colorscheme default
set modeline
set nohlsearch
" search parent directories for ctags
set tags=./tags;
