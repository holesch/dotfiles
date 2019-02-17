" Vim filetype plugin
" Language: diff/patch file
" Maintainer: Serge Gebhardt <serge.gebhardt [-at-] gmail [-dot-] com>
" Last Change:  2012-sep-14

" Based on work by Andreas Bernauer

" Get fold level for diff mode
" Works with normal, context, unified, rcs, ed, subversion and git diffs.
" For rcs diffs, folds only files (rcs has no hunks in the common sense)
" foldlevel=1 ==> file
" foldlevel=2 ==> hunk
" context diffs need special treatment, as hunks are defined
" via context (after '***************'); checking for '*** '
" or ('--- ') only does not work, as the file lines have the
" same marker.
" Inspired by Tim Chase.
function! diff_fold#level() abort
    let l:line=getline(v:lnum)

    if l:line =~# '^\(diff\|Index\)' " file
        return '>1'
    elseif l:line =~# '^\(@@\|\d\)' " hunk
        return '>2'
    elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
        return '>2'
    elseif l:line =~# '^--- \d\+,\d\+ ----$' " context: file2
        return '>2'
    else
        return '='
    endif
endfunction

function! diff_fold#text() abort
    if getline(v:foldstart) =~# '^diff '
        let file_pattern = '\v%([abciow12]/\zs\f+|\zs/dev/null)$'
        for lnum in range(v:foldstart+1, v:foldend)
            let line = getline(lnum)
            let old = matchstr(line, '^--- '.file_pattern)
            if old !=# ''
                let new = matchstr(getline(lnum+1), '^+++ '.file_pattern)
                break
            endif
        endfor
        if old ==# '/dev/null'
            return v:folddashes."A ".new
        elseif new ==# '/dev/null'
            return v:folddashes."D ".old
        elseif old !=# new
            return v:folddashes."R ".old." -> ".new
        else
            return v:folddashes."M ".new
        endif
    endif
    return foldtext()
endfunction
