call pathogen#infect()
filetype plugin indent on
syntax on
autocmd FileType cpp,c,cc,cxx,h,hpp match ErrorMsg '\%>80v.\+'
colorscheme default
set modeline
set nohlsearch
set tags=./tags;
