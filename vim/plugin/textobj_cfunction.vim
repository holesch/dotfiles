if exists("g:loaded_cfunction") || v:version < 700
    finish
endif
let g:loaded_cfunction = 1

xnoremap <silent> <Plug>TextobjCFunctionA :<C-U>call cfunction#xmap_a()<CR>
onoremap <silent> <Plug>TextobjCFunctionA :<C-U>call cfunction#omap_a()<CR>
xnoremap <silent> <Plug>TextobjCFunctionI :<C-U>call cfunction#xmap_i()<CR>
onoremap <silent> <Plug>TextobjCFunctionI :<C-U>call cfunction#omap_i()<CR>
