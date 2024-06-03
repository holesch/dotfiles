if exists("g:loaded_clipboard")
    finish
endif
let g:loaded_clipboard = 1

if has('clipboard') && (empty($SSH_TTY) || !empty($DISPLAY) || empty($TMUX))
    " Prepend options to clipboard (^=), as the exclude pattern must be the
    " last entry (see clipboard-exclude)
    set clipboard^=unnamed " Use system clipboard
    if has('unnamedplus')
        " Use CLIPBOARD selection in addition to PRIMARY selection on X11
        set clipboard^=unnamedplus
    endif
else
    autocmd TextYankPost * call clipboard#save(v:event)
    for key in ["p", "P", "gp", "gP"]
        execute "nnoremap <expr> <silent> " . key .
                    \ " clipboard#paste('" . key . "')"
        execute "xnoremap <expr> <silent> " . key .
                    \ " clipboard#paste('" . key . "')"
    endfor
endif
