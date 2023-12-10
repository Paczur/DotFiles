" Name: custom
" Author: Aditya Azad<adityaazad121@gmail.com>
" Maintainer: Aditya Azad<adityaazad121@gmail.com>
" Notes: A dark monochrome colorscheme with a hint of color

set background=dark
"set t_Co=256

syn match Paren "[(\[{]"
syn match Paren "[)\]}]"
syn region Important oneline start="[!\(TODO\)]:"hs=s+2 end="[\(:!\)\n]"he=e-2 containedin=.*Comment.* contained

highlight clear
if exists("syntax_on")
    syntax reset
    let t=1
else
  let t=0
endif
let g:colors_name="custom"

" --------------------------------
" Editor settings
" --------------------------------
hi Normal       ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=#111111 gui=NONE
hi Cursor       ctermfg=White    ctermbg=NONE cterm=NONE guifg=NONE     guibg=NONE    gui=reverse
hi CursorLine   ctermfg=White    ctermbg=NONE cterm=NONE guifg=NONE     guibg=NONE    gui=reverse
hi LineNr       ctermfg=DarkGray ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE    gui=NONE
hi CursorLineNR ctermfg=DarkGray ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE    gui=NONE

" -----------------
" - Number column -
" -----------------
hi CursorColumn ctermfg=NONE     ctermbg=NONE cterm=NONE guifg=Black    guibg=NONE gui=NONE
hi FoldColumn   ctermfg=DarkGray ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE
hi SignColumn   ctermfg=DarkGray ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE
hi Folded       ctermfg=DarkGray ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE

" -------------------------
" - Window/Tab delimiters -
" -------------------------
hi VertSplit   ctermfg=DarkGrey ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE
hi ColorColumn ctermfg=DarkGrey ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE
hi TabLine     ctermfg=DarkGrey ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE
hi TabLineFill ctermfg=DarkGrey ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE
hi TabLineSel  ctermfg=DarkGrey ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory ctermfg=White  ctermbg=NONE cterm=NONE guifg=White  guibg=NONE gui=NONE
hi Search    ctermfg=Yellow ctermbg=NONE cterm=NONE guifg=Yellow guibg=NONE gui=NONE
hi IncSearch ctermfg=Yellow ctermbg=NONE cterm=NONE guifg=Yellow guibg=NONE gui=NONE

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine   ctermfg=Gray     ctermbg=NONE cterm=NONE guifg=Gray     guibg=NONE gui=NONE
hi StatusLineNC ctermfg=DarkGray ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE
hi WildMenu     ctermfg=Gray     ctermbg=NONE cterm=NONE guifg=Gray     guibg=NONE gui=NONE
hi Question     ctermfg=DarkGray ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE
hi Title        ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi ModeMsg      ctermfg=DarkGray ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE
hi MoreMsg      ctermfg=Cyan     ctermbg=NONE cterm=NONE guifg=Cyan     guibg=NONE gui=NONE

" --------------
" - Visual aid -
" --------------
hi MatchParen     ctermfg=White  ctermbg=DarkGray cterm=NONE      guifg=White  guibg=DarkGray gui=NONE
hi Visual         ctermfg=White  ctermbg=DarkGray cterm=NONE      guifg=White  guibg=DarkGray gui=NONE
hi VisualNOS      ctermfg=White  ctermbg=DarkGray cterm=NONE      guifg=White  guibg=DarkGray gui=NONE
hi NonText        ctermfg=Gray   ctermbg=NONE     cterm=NONE      guifg=Gray   guibg=NONE     gui=NONE
hi Todo           ctermfg=Yellow ctermbg=NONE     cterm=NONE      guifg=Yellow guibg=NONE     gui=NONE
hi Underlined     ctermfg=White  ctermbg=NONE     cterm=underline guifg=White  guibg=NONE     gui=underline
hi Error          ctermfg=Red    ctermbg=NONE     cterm=NONE      guifg=Red    guibg=NONE     gui=NONE
hi ErrorMsg       ctermfg=Red    ctermbg=NONE     cterm=NONE      guifg=Red    guibg=NONE     gui=NONE
hi WarningMsg     ctermfg=Yellow ctermbg=NONE     cterm=NONE      guifg=Yellow guibg=NONE     gui=NONE
hi Ignore         ctermfg=Gray   ctermbg=NONE     cterm=NONE      guifg=Gray   guibg=NONE     gui=NONE
hi SpecialKey     ctermfg=Gray   ctermbg=NONE     cterm=NONE      guifg=Gray   guibg=NONE     gui=NONE
hi WhiteSpaceChar ctermfg=Gray   ctermbg=NONE     cterm=NONE      guifg=Gray   guibg=NONE     gui=NONE
hi WhiteSpace     ctermfg=Gray   ctermbg=NONE     cterm=NONE      guifg=Gray   guibg=NONE     gui=NONE


" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=White ctermbg=NONE cterm=ITALIC guifg=White guibg=NONE gui=ITALIC
hi String          ctermfg=White ctermbg=NONE cterm=ITALIC guifg=White guibg=NONE gui=ITALIC
hi StringDelimiter ctermfg=White ctermbg=NONE cterm=ITALIC guifg=White guibg=NONE gui=ITALIC
hi Character       ctermfg=White ctermbg=NONE cterm=ITALIC guifg=White guibg=NONE gui=ITALIC
hi Number          ctermfg=White ctermbg=NONE cterm=ITALIC guifg=White guibg=NONE gui=ITALIC
hi Boolean         ctermfg=White ctermbg=NONE cterm=ITALIC guifg=White guibg=NONE gui=ITALIC
hi Float           ctermfg=White ctermbg=NONE cterm=ITALIC guifg=White guibg=NONE gui=ITALIC
hi Identifier      ctermfg=White ctermbg=NONE cterm=NONE   guifg=White guibg=NONE gui=NONE
hi Function        ctermfg=White ctermbg=NONE cterm=NONE   guifg=White guibg=NONE gui=NONE

" --------------------------------
" Language constructs
" --------------------------------
hi Statement      ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi Conditional    ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi Repeat         ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi Label          ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi Operator       ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi Keyword        ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi Exception      ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi Comment        ctermfg=DarkGray ctermbg=NONE cterm=NONE guifg=DarkGray guibg=NONE gui=NONE
hi Special        ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi SpecialChar    ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi Tag            ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi Delimiter      ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi SpecialComment ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE
hi Debug          ctermfg=White    ctermbg=NONE cterm=NONE guifg=White    guibg=NONE gui=NONE

" ----------
" - C like -
" ----------
hi PreProc      ctermfg=White ctermbg=NONE cterm=NONE guifg=White guibg=NONE gui=NONE
hi Include      ctermfg=White ctermbg=NONE cterm=NONE guifg=White guibg=NONE gui=NONE
hi Define       ctermfg=White ctermbg=NONE cterm=NONE guifg=White guibg=NONE gui=NONE
hi Macro        ctermfg=White ctermbg=NONE cterm=NONE guifg=White guibg=NONE gui=NONE
hi PreCondit    ctermfg=White ctermbg=NONE cterm=NONE guifg=White guibg=NONE gui=NONE
hi Type         ctermfg=White ctermbg=NONE cterm=NONE guifg=White guibg=NONE gui=NONE
hi StorageClass ctermfg=White ctermbg=NONE cterm=NONE guifg=White guibg=NONE gui=NONE
hi Structure    ctermfg=White ctermbg=NONE cterm=NONE guifg=White guibg=NONE gui=NONE
hi Typedef      ctermfg=White ctermbg=NONE cterm=NONE guifg=White guibg=NONE gui=NONE

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd    ctermfg=Green  ctermbg=NONE cterm=NONE guifg=Green  guibg=NONE gui=NONE
hi DiffChange ctermfg=Yellow ctermbg=NONE cterm=NONE guifg=Yellow guibg=NONE gui=NONE
hi DiffDelete ctermfg=Red    ctermbg=NONE cterm=NONE guifg=Red    guibg=NONE gui=NONE
hi DiffText   ctermfg=White  ctermbg=NONE cterm=NONE guifg=White  guibg=NONE gui=NONE

" --------------------------------
" Completion menu
" --------------------------------
hi  Pmenu       ctermfg=Gray ctermbg=NONE cterm=NONE guifg=Gray guibg=NONE gui=NONE
hi  PmenuSel    ctermfg=Gray ctermbg=NONE cterm=NONE guifg=Gray guibg=NONE gui=NONE
hi  PmenuSbar   ctermfg=Gray ctermbg=NONE cterm=NONE guifg=Gray guibg=NONE gui=NONE
hi  PmenuThumb  ctermfg=Gray ctermbg=NONE cterm=NONE guifg=Gray guibg=NONE gui=NONE

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad   ctermfg=Red    ctermbg=NONE cterm=NONE guifg=Red    guibg=NONE gui=NONE
hi SpellCap   ctermfg=Yellow ctermbg=NONE cterm=NONE guifg=Yellow guibg=NONE gui=NONE
hi SpellLocal ctermfg=Cyan   ctermbg=NONE cterm=NONE guifg=Cyan   guibg=NONE gui=NONE
hi SpellRare  ctermfg=Cyan   ctermbg=NONE cterm=NONE guifg=Cyan   guibg=NONE gui=NONE

" --------------------------------
" Custom
" --------------------------------
hi  markdownListMarker         ctermfg=DarkGray ctermbg=NONE cterm=NONE        guifg=DarkGray guibg=NONE gui=NONE
hi  markdownFootnoteDefinition ctermfg=DarkGray ctermbg=NONE cterm=NONE        guifg=DarkGray guibg=NONE gui=NONE
hi  markdownCodeDelimiter      ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH1                 ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH2                 ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH3                 ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH4                 ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH5                 ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH6                 ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH1Delimiter        ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH2Delimiter        ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH3Delimiter        ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH4Delimiter        ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH5Delimiter        ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownH6Delimiter        ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  markdownUrl                ctermfg=Yellow   ctermbg=NONE cterm=NONE        guifg=Yellow   guibg=NONE gui=NONE
hi  debugPC                    ctermfg=Black    ctermbg=Gray cterm=NONE        guifg=Black    guibg=Gray gui=NONE
hi  StatusLineTerm             ctermfg=Gray     ctermbg=NONE cterm=NONE        guifg=Gray     guibg=NONE gui=NONE
hi  StatusLineTermNC           ctermfg=DarkGray ctermbg=NONE cterm=NONE        guifg=DarkGray guibg=NONE gui=NONE
"hi ColorColumn                ctermfg=Yellow   ctermbg=NONE cterm=NONE        guifg=Yellow   guibg=NONE gui=NONE
"hi schemeParentheses          ctermfg=DarkGray ctermbg=NONE cterm=NONE        guifg=DarkGray guibg=NONE gui=NONE
hi  schemeQuote                ctermfg=White    ctermbg=NONE cterm=ITALIC      guifg=White    guibg=NONE gui=ITALIC
hi  schemeData                 ctermfg=White    ctermbg=NONE cterm=ITALIC      guifg=White    guibg=NONE gui=ITALIC
hi  schemeQuasiQuote           ctermfg=White    ctermbg=NONE cterm=ITALIC      guifg=White    guibg=NONE gui=ITALIC
hi  Paren                      ctermfg=DarkGray ctermbg=NONE cterm=NONE        guifg=DarkGray guibg=NONE gui=NONE
hi  Important                  ctermfg=Yellow   ctermbg=NONE cterm=NONE        guifg=Yellow   guibg=NONE gui=NONE
"hi chezFunction               ctermfg=White    ctermbg=NONE cterm=BOLD        guifg=White    guibg=NONE gui=BOLD
hi  Danger                     ctermfg=White    ctermbg=NONE cterm=ITALIC,BOLD guifg=White    guibg=NONE gui=ITALIC,BOLD
hi  WildMenu                   ctermfg=Black    ctermbg=Gray cterm=NONE        guifg=Black    guibg=Gray gui=NONE
hi  RedundantSpaces            ctermfg=Black    ctermbg=Gray cterm=NONE        guifg=Black    guibg=Gray gui=NONE

if (t==1)
  syntax on
endif

match RedundantSpaces /\s\+$/
