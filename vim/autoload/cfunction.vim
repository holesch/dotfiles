function! cfunction#xmap_a() abort
    call s:try(function("s:a_cfunction"), function("s:select_range"))
endfunction

function! cfunction#omap_a() abort
    call s:try(function("s:a_cfunction"), function("s:select_range_reverse"))
endfunction

function! cfunction#xmap_i() abort
    call s:try(function("s:i_cfunction"), function("s:select_range"))
endfunction

function! cfunction#omap_i() abort
    call s:try(function("s:i_cfunction"), function("s:select_range_reverse"))
endfunction

function! s:try(ai_func, select_func) abort
    let view = winsaveview()

    try
        let [begin, end] = a:ai_func()
        call a:select_func(begin, end)
    catch /^cfunction:/
        call winrestview(view)
    endtry
endfunction

function! s:a_cfunction() abort
    let cursor_lnum = line('.')
    let [func_begin, func_end] = s:i_cfunction()

    " match behavior of builtin text objects
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
    let cnt = v:count1 - 1
    let func_end = s:jump_to_func_end('cW')
    let func_begin = s:jump_to_func_begin()
    call s:go_to_line(func_end)
    while cnt > 0
        let func_end = s:jump_to_func_end('W')
        let cnt -= 1
    endwhile
    return [func_begin, func_end]
endfunction

function! s:select_range(from, to) abort
    call s:go_to_line(a:from)
    normal! V
    call s:go_to_line(a:to)
endfunction

function! s:select_range_reverse(to, from) abort
    call s:select_range(a:from, a:to)
endfunction

function! s:jump_to_func_end(flags) abort
    let func_end = search('\m\C^}', a:flags)
    if func_end == 0
        throw "cfunction: no closing bracket found"
    endif

    return func_end
endfunction

function! s:jump_to_func_begin() abort
    call s:jump_to_matching_opening_bracket()

    " line below previous } or line below previous blank line or top of file
    " this includes e.g. doxygen comments above functions
    return search('\m\C^\%(}.*\|\s*\)\n\zs\|^\%1l', 'bW')
endfunction

function! s:jump_to_matching_opening_bracket() abort
    let opening = searchpair('{', '', '}', 'bW',
        \ {-> synIDattr(synID(line('.'), col('.'), 1), 'name') =~?
        \ 'comment\|string\|cCharacter'})
    if opening == 0
        throw "cfunction: no opening bracket found"
    endif
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

let s:next_pattern = '\v\C^%(\S.*)?\{|%$'
function! cfunction#nmap_next() abort
    call s:jump("m'", v:count1, s:next_pattern, 'esW')
endfunction

function! cfunction#xmap_next() abort
    call s:jump("m'gv", v:count1, s:next_pattern, 'esW')
endfunction

let s:prev_pattern = '\v\C^%(\S.*)?\{|^%1l'
function! cfunction#nmap_prev() abort
    call s:jump("m'", v:count1, s:prev_pattern, 'besW')
endfunction

function! cfunction#xmap_prev() abort
    call s:jump("m'gv", v:count1, s:prev_pattern, 'besW')
endfunction

function! s:jump(pre_cmd, count, pattern, flags) abort
    let cnt = a:count
    execute "normal! " . a:pre_cmd
    while cnt > 0
        call search(a:pattern, a:flags)
        let cnt -= 1
    endwhile
endfunction
