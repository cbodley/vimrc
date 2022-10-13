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
" show tabs as '▸'
set list
set listchars=tab:▸\ 

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif
