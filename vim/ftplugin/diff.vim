if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal nomodeline formatoptions-=croq formatoptions+=tl
setlocal foldmethod=expr
setlocal foldexpr=diff_fold#level()
setlocal foldtext=diff_fold#text()
setlocal foldcolumn=3

let b:undo_ftplugin = "setl ml< fo< fdm< fde< fdt< fdc<"
