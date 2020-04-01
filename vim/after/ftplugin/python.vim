if executable('pydoc3')
    setlocal keywordprg=pydoc3
endif

if !exists("current_compiler")
  compiler python
endif
