function! s:hexedit() abort
    if !exists("b:hexedit") || !b:hexedit
        " hex mode should be considered a read-only operation
        " save values for modified and read-only for restoration later,
        " and clear the read-only flag for now
        let oldmodified=&modified
        let oldreadonly=&readonly
        let &readonly=0
        let oldmodifiable=&modifiable
        let &modifiable=1
        setlocal binary
        silent :e " reload file in binary mode
        let &filetype="xxd"
        " set status
        let b:hexedit=1
        " switch to hex editor
        %!xxd
        augroup Hexedit
            autocmd!
            autocmd BufWritePre <buffer> call <SID>hex_write_pre()
            autocmd BufWritePost <buffer> call <SID>hex_write_post()
        augroup END
        " restore values for modified and read only state
        let &modified=oldmodified
        let &readonly=oldreadonly
        let &modifiable=oldmodifiable
    endif
endfunction

function! s:hex_write_pre() abort
    %!xxd -r
endfunction

function! s:hex_write_post() abort
    %!xxd
    setlocal nomodified
endfunction

command -bar Hexedit call <SID>hexedit()
