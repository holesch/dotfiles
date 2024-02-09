let &l:makeprg = "shellcheck --external-sources -P SCRIPTDIR --format gcc %"
setlocal formatoptions-=o " Don't continue comment with 'o' or 'O'
