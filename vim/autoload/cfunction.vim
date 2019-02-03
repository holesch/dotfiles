function! cfunction#xmap_a() abort
    call s:try(function("s:xmap_a"))
endfunction

function! cfunction#omap_a() abort
    call s:try(function("s:omap_a"))
endfunction

function! cfunction#xmap_i() abort
    call s:try(function("s:xmap_i"))
endfunction

function! cfunction#omap_i() abort
    call s:try(function("s:omap_i"))
endfunction

function! s:try(func) abort
    let view = winsaveview()

    try
        call a:func()
    catch /^cfunction:/
        call winrestview(view)
    endtry
endfunction

function! s:xmap_a() abort
    let [begin, end] = s:a_cfunction()
    call s:select_range(begin, end)
endfunction

function! s:omap_a() abort
    let [begin, end] = s:a_cfunction()
    call s:select_range(end, begin)
endfunction

function! s:xmap_i() abort
    let [begin, end] = s:i_cfunction()
    call s:select_range(begin, end)
endfunction

function! s:omap_i() abort
    let [begin, end] = s:i_cfunction()
    call s:select_range(end, begin)
endfunction

function! s:a_cfunction() abort
    let cursor_lnum = line('.')
    let [func_begin, func_end] = s:i_cfunction()

    if cursor_lnum < func_begin
        let end = func_end
        let begin = s:include_white_space_above(func_begin)
    else
        let end = s:include_white_space_below(func_end)
        let begin = end == func_end
                    \ ? s:include_white_space_above(func_begin)
                    \ : func_begin
    endif

    return [begin, end]
endfunction

function! s:i_cfunction() abort
    let func_end = s:jump_to_func_end()
    let func_begin = s:jump_to_func_begin()
    return [func_begin, func_end]
endfunction

function! s:select_range(from, to) abort
    call s:go_to_line(a:from)
    normal! V
    call s:go_to_line(a:to)
endfunction

function! s:jump_to_func_end() abort
    let func_end = search('\m\C^}', 'cW')
    if func_end == 0
        throw "cfunction: no closing bracket found"
    endif

    return func_end
endfunction

function! s:jump_to_func_begin() abort
    let opening = searchpair('{', '', '}', 'bW',
        \ {-> synIDattr(synID(line('.'), col('.'), 1), 'name') =~?
        \ 'comment\|string'})
    if opening == 0
        throw "cfunction: no opening bracket found"
    endif

    return search('\m\C^\%(}.*\|\s*\)\n\zs\|^\%1l', 'bW')
endfunction

function! s:include_white_space_above(lnum) abort
    call s:go_to_line(a:lnum)
    return search('\m\C\S.*\n\zs\|^\%1l', 'cbW')
endfunction

function! s:include_white_space_below(lnum) abort
    call s:go_to_line(a:lnum)
    return search('\m\C^\zs.*\n.*\S\|\%$', 'cW')
endfunction

function! s:go_to_line(lnum) abort
    return setpos('.', [0, a:lnum, 1, 1, 1])
endfunction
