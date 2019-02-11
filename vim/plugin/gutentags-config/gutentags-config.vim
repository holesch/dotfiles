" Only generate tags for git repositories
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git', '.vim-git-root']

" Use the ./find-files.sh script to get the files to index
let g:gutentags_file_list_command = {
        \ 'markers': {
            \ '.git': expand('<sfile>:p:h') . '/find-files.sh',
            \ '.vim-git-root': expand('<sfile>:p:h') . '/find-files.sh',
        \ },
    \ }

" Enable ctags and cscope if installed
let g:gutentags_modules = []
for prg in ['ctags', 'cscope']
    if executable(prg)
        let g:gutentags_modules += [prg]
    endif
endfor
