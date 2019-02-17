function! tabset#set(width) abort
    if a:width
        let &l:tabstop = a:width
    else
        setlocal noexpandtab!
    endif
    if &expandtab
        echo "Indent with " . &tabstop . " Spaces"
    else
        echo "Indent with Tabs (" .  &tabstop . ")"
    endif
endfunction
