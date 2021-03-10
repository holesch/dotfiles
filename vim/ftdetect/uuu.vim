au BufNewFile,BufRead *.lst
    \  if getline(1) =~# '^uuu_version '
    \|     set filetype=config
    \| endif
