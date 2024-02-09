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

" === Subversive ===
let g:subversiveCurrentTextRegister = 'r'

" === TermDebug ===
let g:termdebug_wide = 1

" === Recover ===
let g:RecoverPlugin_Prompt_Verbose = 1

" === zip ===
augroup plugin_config
    autocmd!
    autocmd BufReadCmd *.whl call zip#Browse(expand("<amatch>"))
augroup END
