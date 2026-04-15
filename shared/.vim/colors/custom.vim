set background=light
set t_Co=16
let g:colors_name="custom"

" PALETTE {{{

let g:base = ["#ffffff", "White", "#000000", "Black"]
let g:gray = ["#cfcfcf", "Gray"]
let g:bg_gray = ["NONE", "NONE", "#333333", "DarkGray"]
let g:transparent = ["NONE", "NONE", "NONE", "NONE"]
let g:red = ["#ffbaba", "Red"]
let g:bg_red = ["NONE", "NONE", "#ffbaba", "Red"]
let g:under_red = ["#ffbaba", "Red", "NONE", "NONE", "UNDERLINE", "UNDERLINE"]
let g:green = ["#6efa6e", "Green"]
let g:blue = ["#8cd6ff", "Blue"]
let g:cyan = ["#57ffc3", "Cyan"]
let g:magenta = ["#ffb3f6", "Magenta"]
let g:yellow = ["#FCF289", "Yellow"]
let g:bg_yellow = ["#000000", "Black", "#FCF289", "Yellow"]
let g:under_yellow = ["#FCF289", "Yellow", "NONE", "NONE", "UNDERLINE", "UNDERLINE"]

let g:normal = g:base
let g:grayed_out = g:gray
let g:hiregion = g:bg_gray
let g:error = g:under_red
let g:error_sign = g:red
let g:warning = g:under_yellow
let g:warning_sign = g:yellow
let g:highlight = g:magenta
let g:folded = g:gray

let g:url = g:blue
let g:list_marker = g:gray

let g:string = g:green
let g:char = g:green
let g:num = g:transparent
let g:bool = g:transparent
let g:identifier = g:transparent
let g:function = g:transparent
let g:statement = g:transparent
let g:conditional = g:transparent
let g:loop = g:transparent
let g:label = g:transparent
let g:operator = g:transparent
let g:keyword = g:transparent
let g:exception = g:transparent
let g:comment = g:gray
let g:macro = g:gray
let g:debug = g:gray
let g:type = g:transparent
let g:structure = g:transparent
"}}}
" FUNCTION {{{
function! s:HL(group, ...)
  if a:0 >= 1
    if len(a:1) >= 2
      let gfg = a:1[0]
      let cfg = a:1[1]
    else
      let gfg = "NONE"
      let cfg = "NONE"
    endif

    if len(a:1) >= 4
      let gbg = a:1[2]
      let cbg = a:1[3]
    else
      let gbg = "NONE"
      let cbg = "NONE"
    endif

    if len(a:1) >= 6
      let g = a:1[4]
      let c = a:1[5]
    else
      let g = "NONE"
      let c = "NONE"
    endif

  let histring = [ 'hi', a:group, 'guifg=' . gfg, 'ctermfg=' . cfg,
                 \ 'guibg=' . gbg, 'ctermbg=' . cbg, 'gui=' . g, 'cterm=' . c]
  execute join(histring, ' ')
  endif
endfunction
"}}}

"BASIC {{{
call s:HL("Normal", g:normal)
call s:HL("Cursor", g:normal)
call s:HL("CursorLine", g:transparent)
call s:HL("CursorLineNR", g:transparent)
call s:HL("CursorColumn")
call s:HL("LineNr", g:grayed_out)
call s:HL("VertSplit", g:grayed_out)
call s:HL("ColorColumn", g:error_sign)
call s:HL("TabLine", g:grayed_out)
call s:HL("TabLineFill", g:grayed_out)
call s:HL("TabLineSel", g:grayed_out)
call s:HL("Directory", g:normal)
call s:HL("Search", g:highlight)
call s:HL("IncSearch", g:highlight)
call s:HL("FoldColumn")
call s:HL("Folded", g:folded)
call s:HL("WildMenu", g:grayed_out)
call s:HL("Question", g:warning)
call s:HL("Title")
call s:HL("RedundantSpaces", g:hiregion)
"}}}
"SIGNS {{{
call s:HL("SignColumn", g:grayed_out)
call s:HL("SignError", g:error_sign)
call s:HL("SignWarning", g:warning_sign)
call s:HL("SignInfo", g:grayed_out)
call s:HL("SignNote", g:grayed_out)
call s:HL("SignOther", g:error_sign)
"}}}
"STATUSLINE {{{
call s:HL("StatusLine", g:base)
call s:HL("StatusLineModified", g:error_sign)
call s:HL("StatusLineReadOnly", g:warning_sign)
call s:HL("StatusLineMaster", g:warning_sign)
call s:HL("StatusLineNC", g:grayed_out)
call s:HL("StatusLineModifiedNC", g:grayed_out)
call s:HL("StatusLineReadOnlyNC", g:grayed_out)
call s:HL("StatusLineMasterNC", g:grayed_out)
call s:HL("StatusLineTerm", g:grayed_out)
call s:HL("StatusLineTermNC", g:grayed_out)
"}}}
"CODE {{{
call s:HL("WhiteSpaceChar", g:grayed_out)
call s:HL("WhiteSpace", g:grayed_out)
call s:HL("Constant")
call s:HL("String", g:string)
call s:HL("StringDelimiter", g:string)
call s:HL("Character", g:char)
call s:HL("Number", g:num)
call s:HL("Boolean", g:bool)
call s:HL("Float", g:num)
call s:HL("Identifier", g:identifier)
call s:HL("Function", g:function)
call s:HL("Statement", g:statement)
call s:HL("Conditional", g:conditional)
call s:HL("Repeat", g:loop)
call s:HL("Label", g:label)
call s:HL("Operator", g:operator)
call s:HL("Keyword", g:keyword)
call s:HL("Exception", g:exception)
call s:HL("Comment", g:comment)
call s:HL("Special", g:normal)
call s:HL("SpecialChar", g:normal)
call s:HL("Tag")
call s:HL("Delimiter")
call s:HL("SpecialComment", g:normal)
call s:HL("Debug", g:debug)
call s:HL("PreProc", g:macro)
call s:HL("Include", g:macro)
call s:HL("Define", g:macro)
call s:HL("Macro", g:macro)
call s:HL("PreCondit", g:macro)
call s:HL("Type", g:type)
call s:HL("StorageClass", g:type)
call s:HL("Structure", g:structure)
call s:HL("Typedef", g:type)
"}}}
"DIFF {{{
call s:HL("DiffAdd", g:green)
call s:HL("DiffChange", g:warning_sign)
call s:HL("DiffDelete", g:error_sign)
call s:HL("DiffText")
call s:HL("diffAdded", g:green)
call s:HL("diffRemoved", g:error_sign)
call s:HL("diffLine", g:grayed_out)
call s:HL("diffSubName", g:grayed_out)
call s:HL("GitGutterAdd", g:green)
call s:HL("GitGutterChange", g:warning_sign)
call s:HL("GitGutterDelete", g:error_sign)
"}}}
"MARKDOWN {{{
call s:HL("markdownListMarker", g:list_marker)
call s:HL("markdownFootnoteDefinition", g:grayed_out)
call s:HL("markdownCodeDelimiter", g:grayed_out)
call s:HL("markdownH1", g:grayed_out)
call s:HL("markdownH2", g:grayed_out)
call s:HL("markdownH3", g:grayed_out)
call s:HL("markdownH4", g:grayed_out)
call s:HL("markdownH5", g:grayed_out)
call s:HL("markdownH6", g:grayed_out)
call s:HL("markdownH1Delimiter", g:grayed_out)
call s:HL("markdownH2Delimiter", g:grayed_out)
call s:HL("markdownH3Delimiter", g:grayed_out)
call s:HL("markdownH4Delimiter", g:grayed_out)
call s:HL("markdownH5Delimiter", g:grayed_out)
call s:HL("markdownH6Delimiter", g:grayed_out)
call s:HL("markdownUrl", g:url)
"}}}
"SPELL {{{
call s:HL("SpellBad", g:error)
call s:HL("SpellCap", g:warning)
call s:HL("SpellLocal", g:grayed_out)
call s:HL("SpellRare", g:grayed_out)
"}}}

call s:HL("ModeMsg", g:grayed_out)
call s:HL("MoreMsg", g:grayed_out)
call s:HL("MatchParen", g:bg_gray)
call s:HL("Visual", g:bg_gray)
call s:HL("VisualNOS", g:bg_gray)
call s:HL("NonText", g:grayed_out)
call s:HL("Todo", g:highlight)
hi Underlined                 ctermfg=NONE   ctermbg=NONE cterm=UNDERLINE
call s:HL("Error", g:error)
call s:HL("ErrorMsg", g:error_sign)
call s:HL("WarningMsg", g:warning_sign)
call s:HL("Ignore", g:grayed_out)
call s:HL("SpecialKey", g:grayed_out)

call s:HL("PmenuSel", g:grayed_out)
call s:HL("Pmenu", g:grayed_out)
call s:HL("PmenuSbar", g:grayed_out)
call s:HL("PmenuThumb", g:grayed_out)
call s:HL("Important", g:highlight)
hi Danger                     ctermfg=NONE   ctermbg=NONE cterm=BOLD
call s:HL("WildMenu", g:bg_gray)

match RedundantSpaces /\s\+$/
