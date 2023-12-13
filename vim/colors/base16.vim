let g:base16colorspace = 256  " Access colors present in 256 color space

execute "runtime colors/base16-google-light.vim"
let g:colors_name = "base16"

call g:Base16hi("User1", "", "", g:base16_cterm00, g:base16_cterm0D, "", "")
call g:Base16hi("User2", "", "", g:base16_cterm00, g:base16_cterm09, "", "")
call g:Base16hi("MatchParen", "", "", g:base16_cterm00, "", "", "")
highlight SpellBad ctermbg=NONE cterm=underline
highlight SpellLocal ctermbg=NONE cterm=underline
highlight SpellCap ctermbg=NONE cterm=underline
highlight SpellRare ctermbg=NONE cterm=underline
highlight CursorLineNr cterm=NONE

highlight! link Error Underlined
highlight! link WildMenu Search
highlight! link Sneak Search
highlight! link vimCommentString Comment
highlight! link doxygenComment Comment
highlight! link doxygenBrief Comment
highlight! link doxygenSpecialOnelineDesc Comment
highlight! link doxygenParam doxygenSpecial
highlight! link doxygenParamName doxygenSpecial
highlight! link StatusLineTerm StatusLine
highlight! link StatusLineTermNC StatusLineNC
