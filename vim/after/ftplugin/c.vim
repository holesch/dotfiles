setlocal commentstring=//%s " Use // for commenting
setlocal formatoptions-=o " Don't continue comment with 'o' or 'O'
" Update static function declarations
nmap <buffer> <LocalLeader>F qfqgg]]:.,$g/^static .*(/norm "Fyy<CR>gg/^static .*);<CR>vip"fpddvip:norm t{C;<CR>
let b:undo_ftplugin .= '|setl cms< |unmap <buffer> <LocalLeader>F'
