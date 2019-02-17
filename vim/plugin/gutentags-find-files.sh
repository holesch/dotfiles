#!/bin/sh

ext=\
'c|h|'\
'py|'\
'sh|'\
'vim|'\
'cpp|hpp|cxx|hxx|'\
'bb|bbappend|bbclass|inc|'\
'java|'\
'lua|'\
'rb|'\
'js|javascript|es|'\
'pl|'\
'rs|'\
'tcl|'\
'php'\

{
    git ls-files
    git ls-files --others --exclude-standard
} | egrep --ignore-case '\.('"$ext"')$'
