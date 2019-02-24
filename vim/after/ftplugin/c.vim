setlocal commentstring=//%s " Use // for commenting
setlocal comments-=://
setlocal comments+=f:// " Don't continue comments after //
let b:undo_ftplugin .= '|setl cms< com<'
