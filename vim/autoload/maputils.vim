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
