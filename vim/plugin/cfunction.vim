if exists("g:loaded_cfunction") || v:version < 700
    finish
endif
let g:loaded_cfunction = 1

xnoremap <silent> <Plug>(CFunctionTextObjA) :<C-U>call cfunction#xmap_a()<CR>
onoremap <silent> <Plug>(CFunctionTextObjA) :<C-U>call cfunction#omap_a()<CR>
xnoremap <silent> <Plug>(CFunctionTextObjI) :<C-U>call cfunction#xmap_i()<CR>
onoremap <silent> <Plug>(CFunctionTextObjI) :<C-U>call cfunction#omap_i()<CR>
