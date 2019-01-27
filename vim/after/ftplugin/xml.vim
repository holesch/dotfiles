if &filetype ==# 'xml'
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2

    let b:undo_ftplugin .= '|setl ts< sts< sw<'
endif
