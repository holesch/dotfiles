scriptencoding utf-8

let s:fnamecollapse = get(g:, 'airline#extensions#tabline#fnamecollapse', 1)

function! airline#extensions#tabline#formatters#cwd#format(bufnr, buffers)
    let fmod = get(g:, 'airline#extensions#tabline#fnamemod', ':p:~')
    let _ = ''
    let win_ids = win_findbuf(a:bufnr)

    if !empty(win_ids)
        " Use the first window-ID. This might be the wrong one, if the same
        " buffer is open in multiple tabs
        let tabnr_winnr = win_id2tabwin(win_ids[0])
        let cwd = getcwd(tabnr_winnr[1], tabnr_winnr[0])
        let cwd_mod = fnamemodify(cwd, fmod)

        if s:fnamecollapse
            let collapse_pattern = '\v\w\zs.{-}\ze(\\|\/).{-}(\\|\/)'
            let _ .= substitute(cwd_mod ,collapse_pattern , '', 'g')
        else
            let _ .= cwd_mod
        endif
    else
        let _ .= '[no cwd]'
    endif

    return airline#extensions#tabline#formatters#default#wrap_name(a:bufnr, _)
endfunction

