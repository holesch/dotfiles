if exists("g:loaded_cfunction") || v:version < 700
    finish
endif
let g:loaded_cfunction = 1

xnoremap <silent> <Plug>(CFunctionTextObjA) :<C-U>call cfunction#xmap_a()<CR>
onoremap <silent> <Plug>(CFunctionTextObjA) :<C-U>call cfunction#omap_a()<CR>
xnoremap <silent> <Plug>(CFunctionTextObjI) :<C-U>call cfunction#xmap_i()<CR>
onoremap <silent> <Plug>(CFunctionTextObjI) :<C-U>call cfunction#omap_i()<CR>

nnoremap <silent> <Plug>(CFunctionNext) :<C-U>call cfunction#nmap_next()<CR>
xnoremap <silent> <Plug>(CFunctionNext) :<C-U>call cfunction#xmap_next()<CR>
onoremap <silent> <Plug>(CFunctionNext) :<C-U>call cfunction#nmap_next()<CR>
nnoremap <silent> <Plug>(CFunctionPrev) :<C-U>call cfunction#nmap_prev()<CR>
xnoremap <silent> <Plug>(CFunctionPrev) :<C-U>call cfunction#xmap_prev()<CR>
onoremap <silent> <Plug>(CFunctionPrev) :<C-U>call cfunction#nmap_prev()<CR>
