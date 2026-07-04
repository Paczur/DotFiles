set background=light
set termguicolors
"set t_Co=16
let g:colors_name="custom"

" Colors done by:
" - Setting pure RGB color
" Light:
" - Saturation 12.5 or 25
" - Lightness 100
" Dark:
"  - Saturation: 87.5
"  - Lightness: 75 or 62.5
" Gray:
"  - Lightness: 50 and 95

" PALETTE {{{

let g:underline     = ["UNDERLINE", "UNDERLINE"]
let g:bold          = ["BOLD", "BOLD"]
let g:none          = ["NONE", "NONE"]
let g:white         = ["#ffffff", "White"]
let g:black         = ["#000000", "Black"]
let g:light_gray    = ["#f2f2f2", "Gray"]
let g:dark_gray     = ["#808080", "DarkGray"]
let g:light_red     = ["#ffdfdf", "Red"]
let g:dark_red      = ["#bf1818", "DarkRed"]
let g:light_green   = ["#dfffdf", "Green"]
let g:dark_green    = ["#18bf18", "DarkGreen"]
let g:light_blue    = ["#dfdfff", "Blue"]
let g:dark_blue     = ["#1818bf", "DarkBlue"]
let g:light_cyan    = ["#dfffff", "Cyan"]
let g:dark_cyan     = ["#149f9f", "DarkCyan"]
let g:light_magenta = ["#ffdfff", "Magenta"]
let g:dark_magenta  = ["#bf18bf", "DarkMagenta"]
let g:light_yellow  = ["#ffffbf", "Yellow"]
let g:dark_yellow   = ["#9f9f14", "DarkYellow"]

let g:base    = g:black + g:white
let g:gray    = g:dark_gray + g:light_gray
let g:red     = g:dark_red + g:light_red
let g:green   = g:dark_green + g:light_green
let g:blue    = g:dark_blue + g:light_blue
let g:cyan    = g:dark_cyan + g:light_cyan
let g:magenta = g:dark_magenta + g:light_magenta
let g:yellow  = g:dark_yellow + g:light_yellow
"}}}
" FUNCTION {{{
function! s:HL(group, ...)
  if a:0 >= 1
    if len(a:1) >= 2
      let gfg = a:1[0]
      let cfg = a:1[1]
    else
      let gfg = g:base[0]
      let cfg = g:base[1]
    endif

    if len(a:1) >= 4
      let gbg = a:1[2]
      let cbg = a:1[3]
    else
      let gbg = g:base[2]
      let cbg = g:base[3]
    endif

    if len(a:1) >= 6
      let g = a:1[4]
      let c = a:1[5]
    else
      let g = "NONE"
      let c = "NONE"
    endif
  else
    let gfg = g:base[0]
    let cfg = g:base[1]
    let gbg = g:base[2]
    let cbg = g:base[3]
    let g = "NONE"
    let c = "NONE"
  endif

  let histring = [ 'hi', a:group, 'guifg=' . gfg, 'ctermfg=' . cfg,
                 \ 'guibg=' . gbg, 'ctermbg=' . cbg, 'gui=' . g, 'cterm=' . c]
  execute join(histring, ' ')

endfunction
"}}}

"BASIC {{{
call s:HL("Normal", g:base)
call s:HL("Cursor", g:base)
call s:HL("CursorLine")
call s:HL("CursorLineNR")
call s:HL("CursorColumn")
call s:HL("LineNr", g:gray)
call s:HL("VertSplit", g:gray)
call s:HL("ColorColumn", g:dark_red + g:none)
call s:HL("TabLine", g:gray)
call s:HL("TabLineFill", g:gray)
call s:HL("TabLineSel", g:black + g:light_gray)
call s:HL("Title", g:gray)
call s:HL("Directory", g:base)
call s:HL("Search", g:magenta)
call s:HL("IncSearch", g:magenta)
call s:HL("FoldColumn")
call s:HL("Folded", g:gray)
call s:HL("WildMenu", g:magenta)
call s:HL("Question", g:yellow)
call s:HL("Title")
call s:HL("RedundantSpaces", g:red)
"}}}
"SIGNS {{{
call s:HL("SignColumn", g:dark_gray + g:none)
call s:HL("SignError", g:red)
call s:HL("SignWarning", g:yellow)
call s:HL("SignInfo", g:dark_gray + g:none)
call s:HL("SignNote", g:dark_gray + g:none)
call s:HL("SignOther", g:red)
"}}}
"STATUSLINE {{{
call s:HL("StatusLine", g:gray)
call s:HL("StatusLineModified", g:red)
call s:HL("StatusLineReadOnly", g:yellow)
call s:HL("StatusLineMaster", g:yellow)
call s:HL("StatusLineNC", g:gray)
call s:HL("StatusLineModifiedNC", g:gray)
call s:HL("StatusLineReadOnlyNC", g:gray)
call s:HL("StatusLineMasterNC", g:gray)
call s:HL("StatusLineTerm", g:gray)
call s:HL("StatusLineTermNC", g:gray)
"}}}
"CODE {{{
call s:HL("WhiteSpaceChar")
call s:HL("WhiteSpace")
call s:HL("Constant")
call s:HL("String", g:green)
call s:HL("StringDelimiter", g:green)
call s:HL("Character", g:green)
call s:HL("Number")
call s:HL("Boolean")
call s:HL("Float")
call s:HL("Identifier")
call s:HL("Function")
call s:HL("Statement")
call s:HL("Conditional")
call s:HL("Repeat")
call s:HL("Label")
call s:HL("Operator")
call s:HL("Keyword")
call s:HL("Exception")
call s:HL("Comment", g:gray)
call s:HL("Special")
call s:HL("SpecialChar")
call s:HL("Tag")
call s:HL("Delimiter")
call s:HL("SpecialComment")
call s:HL("Debug")
call s:HL("PreProc", g:gray)
call s:HL("Include", g:gray)
call s:HL("Define", g:gray)
call s:HL("Macro", g:gray)
call s:HL("PreCondit", g:gray)
call s:HL("Type")
call s:HL("StorageClass")
call s:HL("Structure")
call s:HL("Typedef")
"}}}
"DIFF {{{
call s:HL("DiffAdd", g:green)
call s:HL("DiffChange", g:yellow)
call s:HL("DiffDelete", g:red)
call s:HL("DiffText", g:blue)
call s:HL("diffAdded", g:green)
call s:HL("diffRemoved", g:red)
call s:HL("diffLine", g:gray)
call s:HL("diffSubName", g:gray)
call s:HL("GitGutterAdd", g:green)
call s:HL("GitGutterChange", g:yellow)
call s:HL("GitGutterDelete", g:red)
"}}}
"MARKDOWN {{{
call s:HL("markdownListMarker", g:gray)
call s:HL("markdownFootnoteDefinition", g:gray)
call s:HL("markdownCodeDelimiter", g:gray)
call s:HL("markdownH1", g:gray)
call s:HL("markdownH2", g:gray)
call s:HL("markdownH3", g:gray)
call s:HL("markdownH4", g:gray)
call s:HL("markdownH6", g:gray)
call s:HL("markdownH5", g:gray)
call s:HL("markdownH1Delimiter", g:gray)
call s:HL("markdownH2Delimiter", g:gray)
call s:HL("markdownH3Delimiter", g:gray)
call s:HL("markdownH4Delimiter", g:gray)
call s:HL("markdownH5Delimiter", g:gray)
call s:HL("markdownH6Delimiter", g:gray)
call s:HL("markdownUrl", g:blue)
"}}}
"SPELL {{{
call s:HL("SpellBad", g:red)
call s:HL("SpellCap", g:yellow)
call s:HL("SpellLocal", g:base)
call s:HL("SpellRare", g:base)
"}}}

call s:HL("ModeMsg", g:gray)
call s:HL("MoreMsg", g:gray)
call s:HL("MatchParen", g:base)
call s:HL("Visual", g:gray)
call s:HL("VisualNOS", g:gray)
call s:HL("NonText", g:base)
call s:HL("Todo", g:cyan)
call s:HL("Underlined", g:none + g:none + g:underline)
call s:HL("Error", g:red)
call s:HL("ErrorMsg", g:red)
call s:HL("WarningMsg", g:yellow)
call s:HL("Ignore", g:gray)
call s:HL("SpecialKey", g:gray)

call s:HL("PmenuSel", g:gray)
call s:HL("Pmenu", g:gray)
call s:HL("PmenuSbar", g:gray)
call s:HL("PmenuThumb", g:gray)
call s:HL("Important", g:cyan)

match RedundantSpaces /\s\+$/
