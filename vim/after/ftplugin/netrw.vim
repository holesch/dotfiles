nnoremap <buffer> <Space> /\v^(\\| )*
setlocal suffixes-=.h,.info " Don't let vinegar move those files to the bottom
setlocal nospell
augroup netrw_fixups
    autocmd!
    autocmd BufLeave * setlocal autowrite
augroup END
