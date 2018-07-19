setlocal commentstring=//%s " Use // for commenting
setlocal comments-=://
setlocal comments+=f:// " Don't continue comments after //
setlocal comments-=mb:*
setlocal comments+=mb:*\  " Add extra space for Doxygen comments
