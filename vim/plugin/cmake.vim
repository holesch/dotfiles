if exists("g:loaded_cmake") || v:version < 700
    finish
endif
let g:loaded_cmake = 1

function! s:update_makeprg() abort
    if filereadable('CMakeLists.txt') && isdirectory('build')
        let &makeprg='{ cd build && cmake --build . -- $*'
        if filereadable('build/CTestTestfile.cmake')
            let &makeprg .= ' && ctest --output-on-failure'
        endif
        let &makeprg .= ' }'
    endif
endfunction

call s:update_makeprg()

function s:cmake_dir(...) abort
    if a:0 == 0
        echo resolve("build")
    else
        silent call system("rm -f build && ln -s " . a:1 . " build")
        if v:shell_error != 0
            echoerr "Changing build dir to " . a:1 . " failed"
        endif
        call s:update_makeprg()
    endif
endfunction

command! -nargs=? -bar -complete=dir CMakeDir call <SID>cmake_dir(<f-args>)
