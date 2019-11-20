function! maputils#preserve(command) abort
    " Save and restore search and default register and view
    let search_save = @/
    let default_save = @@
    let view = winsaveview()

    execute a:command

    let @/ = search_save
    let @@ = default_save
    call winrestview(view)
endfunction

function! maputils#fzy(choice_command, vim_command) abort
    try
        let output = system(a:choice_command . " | fzy")
    catch /Vim:Interrupt/
        " Swallow errors from ^C, allow redraw! below
    endtry
    redraw!
    if v:shell_error == 0 && !empty(output)
        exec a:vim_command . ' ' . output
    endif
endfunction
