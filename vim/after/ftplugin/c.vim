setlocal commentstring=//%s " Use // for commenting
set formatoptions-=o " Don't continue comment with 'o' or 'O'
let b:undo_ftplugin .= '|setl cms<'
