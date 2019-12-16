" === Gutentags ===
" Only generate tags for git repositories
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git', '.vim-git-root']

" Use the ./gutentags-find-files.sh script to get the files to index
let g:gutentags_file_list_command = {
        \ 'markers': {
            \ '.git': expand('<sfile>:p:h') . '/gutentags-find-files.sh',
            \ '.vim-git-root': expand('<sfile>:p:h') . '/gutentags-find-files.sh',
        \ },
    \ }

" Enable ctags and cscope if installed
let g:gutentags_modules = []
for prg in ['ctags', 'cscope']
    if executable(prg)
        let g:gutentags_modules += [prg]
    endif
endfor

" === targets ===
" l for "last" collides with l for "line", use N for "last" instead
let g:targets_nl = 'nN'

" === Syntax settings ===
let g:is_posix = 1 " use POSIX syntax for .sh

" === Ultisnips ===
if has('python3')
    let g:UltiSnipsUsePythonVersion = 3
endif

" === CtrlP ===
let g:ctrlp_extensions = ['tag']
let g:ctrlp_show_hidden = 1
if executable('ag')
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" === netrw ===
let g:netrw_altfile = 1 " CTRL-^ jumps to last edited file

" === bitbake ===
let g:bb_create_on_empty = 0

" === Sneak ===
let g:sneak#label = 1

" === TMUX navigator ===
let g:tmux_navigator_disable_when_zoomed = 1

" === VimCompletesMe ===
let g:vcm_direction = 'p' " Search backwards when Tab completing

" === Subversive ===
let g:subversiveCurrentTextRegister = 'r'

" === TermDebug ===
let g:termdebug_wide = 1
