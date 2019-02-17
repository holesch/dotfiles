setlocal commentstring=//%s " Use // for commenting
setlocal comments-=://
setlocal comments+=f:// " Don't continue comments after //
let b:vcm_tab_complete = "omni"

let b:undo_ftplugin .= '|setl cms< com< |unlet b:vcm_tab_complete'
