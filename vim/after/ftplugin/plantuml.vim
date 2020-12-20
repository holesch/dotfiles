let &l:makeprg = expand('<sfile>:p:h') . '/plantuml-vim.sh '
            \ . fnameescape(expand('%')) . ' '
            \ . fnameescape(expand('%:r')) . '.svg'
setlocal commentstring='%s
