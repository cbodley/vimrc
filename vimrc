call pathogen#infect()
filetype plugin indent on
syntax on
" color columns for c/c++
autocmd FileType c,cpp match ErrorMsg '\%>80v.\+'
" don't remember position for git commits
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
colorscheme default
set modeline
set nohlsearch
" show tabs as '▸'
set list
set listchars=tab:▸\ 

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp'],
                    \ })
        autocmd FileType c,cpp setlocal omnifunc=lsp#complete
        nmap <buffer> gd <plug>(lsp-definition)
        nmap <buffer> gi <plug>(lsp-implementation)
        nmap <buffer> gr <plug>(lsp-references)
        let g:lsp_diagnostics_enabled = 0
        hi def link lspReference Search
    augroup end
endif
