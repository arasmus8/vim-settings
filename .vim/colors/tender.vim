"
" tender v0.3.4
" A tender color scheme for vim and its plugins
" author: Jacobo Tabernero http://jacoborus.codes
" license: MIT
" background: dark
"
" This file was generated by Estilo
" https://github.com/jacoborus/estilo

let g:colors_name="tender"
hi clear
if exists("syntax_on")
  syntax reset
endif
if has("gui_running")
  set background=dark
endif

hi ColorColumn guifg=NONE ctermfg=NONE guibg=#323232 ctermbg=236 gui=NONE cterm=NONE
hi link CursorColumn CursorLine
hi CursorLine guifg=NONE ctermfg=NONE guibg=#323232 ctermbg=236 gui=NONE cterm=NONE
hi CursorLineNr guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Directory guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#eeeeee ctermfg=255 guibg=#818f21 ctermbg=100 gui=NONE cterm=NONE
hi DiffChange guifg=#eeeeee ctermfg=255 guibg=#66afce ctermbg=74 gui=NONE cterm=NONE
hi DiffDelete guifg=#282828 ctermfg=235 guibg=#f43753 ctermbg=203 gui=NONE cterm=NONE
hi DiffText guifg=#66afce ctermfg=74 guibg=#eeeeee ctermbg=255 gui=bold cterm=bold
hi ErrorMsg guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi VertSplit guifg=#282828 ctermfg=235 guibg=#282828 ctermbg=235 gui=NONE cterm=NONE
hi Folded guifg=#666666 ctermfg=242 guibg=#1d1d1d ctermbg=234 gui=NONE cterm=NONE
hi FoldColumn guifg=#666666 ctermfg=242 guibg=#1d1d1d ctermbg=234 gui=NONE cterm=NONE
hi IncSearch guifg=#282828 ctermfg=235 guibg=#e9edb2 ctermbg=193 gui=NONE cterm=NONE
hi LineNr guifg=#444444 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi NonText guifg=#444444 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Normal guifg=#eeeeee ctermfg=255 guibg=#282828 ctermbg=235 gui=NONE cterm=NONE
hi PMenu guifg=#282828 ctermfg=235 guibg=#66afce ctermbg=74 gui=NONE cterm=NONE
hi PMenuSel guifg=#282828 ctermfg=235 guibg=#b8c468 ctermbg=149 gui=NONE cterm=NONE
hi PmenuSbar guifg=#d1b580 ctermfg=180 guibg=#d1b580 ctermbg=180 gui=NONE cterm=NONE
hi PmenuThumb guifg=#f9b943 ctermfg=215 guibg=#f9b943 ctermbg=215 gui=NONE cterm=NONE
hi Question guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Search guifg=#e9edb2 ctermfg=193 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi SpecialKey guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#d1b580 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#282828 ctermfg=235 guibg=#66afce ctermbg=74 gui=bold cterm=bold
hi StatusLineNC guifg=#282828 ctermfg=235 guibg=#666666 ctermbg=242 gui=bold cterm=bold
hi TabLine guifg=#999999 ctermfg=246 guibg=#444444 ctermbg=238 gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#444444 ctermbg=238 gui=NONE cterm=NONE
hi TabLineSel guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Title guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Visual guifg=NONE ctermfg=NONE guibg=#0b0b0b ctermbg=232 gui=NONE cterm=NONE
hi WarningMsg guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#282828 ctermfg=235 guibg=#b8c468 ctermbg=149 gui=bold cterm=bold
hi Comment guifg=#666666 ctermfg=246 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Constant guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#d1b580 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Character guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Number guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Float guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Statement guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Operator guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Exception guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Special guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Error guifg=#eeeeee ctermfg=255 guibg=#f43753 ctermbg=203 gui=NONE cterm=NONE
hi Todo guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi cssVendor guifg=#818f21 ctermfg=100 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssTagName guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssAttrComma guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssBackgroundProp guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssBorderProp guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssBoxProp guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssDimensionProp guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssFontProp guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssTextProp guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssValueLength guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssValueInteger guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssValueNumber guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssIdentifier guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssIncludeKeyword guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssImportant guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssClassName guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssClassNameDot guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssProp guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssAttr guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssUnitDecorators guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi cssNoise guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitcommitBranch guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitcommitDiscardedType guifg=#c12038 ctermfg=125 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitcommitSelectedType guifg=#818f21 ctermfg=100 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitcommitHeader guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitcommitUntrackedFile guifg=#c12038 ctermfg=125 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitcommitDiscardedFile guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitcommitSelectedFile guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi helpHeadline guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi helpNote guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi javaScriptOperator guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi javaScriptBraces guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi jsonEscape guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi jsonNumber guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi jsonBraces guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi jsonBoolean guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi jsonKeywordMatch guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi jsonQuote guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi jsonNoise guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH1 guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingRule guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingDelimiter guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownListMarker guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownBlockquote guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownRule guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownLinkText guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownLinkTextDelimiter guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownLinkDelimiter guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownIdDeclaration guifg=#818f21 ctermfg=100 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownAutomaticLink guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrl guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrlTitle guifg=#d1b580 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrlDelimiter guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrlTitleDelimiter guifg=#9b7425 ctermfg=3 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeDelimiter guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCode guifg=#d1b580 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownEscape guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownError guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimCommentTitle guifg=#818f21 ctermfg=100 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimError guifg=#eeeeee ctermfg=255 guibg=#f43753 ctermbg=203 gui=NONE cterm=NONE
hi yamlFlowString guifg=#d1b580 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi yamlFlowStringDelimiter guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi yamlKeyValueDelimiter guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FugitiveblameHash guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FugitiveblameUncommitted guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FugitiveblameTime guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FugitiveblameNotCommittedYet guifg=#d1b580 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NERDTreeHelp guifg=#c9c9c9 ctermfg=251 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NERDTreeHelpKey guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NERDTreeHelpCommand guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NERDTreeHelpTitle guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NERDTreeUp guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NERDTreeCWD guifg=#66afce ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NERDTreeOpenable guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NERDTreeClosable guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterAdd guifg=#b8c468 ctermfg=149 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterChange guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterDelete guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterChangeDelete guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi javaScriptOpSymbols guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi javaScriptParens guifg=#abd9ec ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi javaScriptFuncArg guifg=#f9b943 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

