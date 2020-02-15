if exists("g:loaded_cmake") || v:version < 700
    finish
endif
let g:loaded_cmake = 1

if filereadable('CMakeLists.txt') && isdirectory('build')
    let &makeprg='{ cd build && cmake --build . -- $*'
    if filereadable('build/CTestTestfile.cmake')
        let &makeprg .= ' && ctest --output-on-failure'
    endif
    let &makeprg .= ' }'
endif
