let g:base16colorspace = 256  " Access colors present in 256 color space

runtime colors/base16-monokai.vim
let g:colors_name = "base16-monokai-custom"

call g:Base16hi("User1", "", "", g:base16_cterm00, g:base16_cterm0D, "", "")
call g:Base16hi("MatchParen", "", "", g:base16_cterm00, "", "", "")
call g:Base16hi("SpellBad", "", "", "", g:base16_cterm00, "", "")
call g:Base16hi("SpellLocal", "", "", "", g:base16_cterm00, "", "")
call g:Base16hi("SpellCap", "", "", "", g:base16_cterm00, "", "")
call g:Base16hi("SpellRare", "", "", "", g:base16_cterm00, "", "")

highlight! link Error Underlined
highlight! link WildMenu Search
highlight! link Sneak Search
highlight! link vimCommentString Comment
highlight! link doxygenComment Comment
highlight! link doxygenBrief Comment
highlight! link doxygenSpecialOnelineDesc Comment
highlight! link doxygenParam doxygenSpecial
highlight! link doxygenParamName doxygenSpecial
