"Custom

let s:concealends = ''
if has('conceal') && get(g:, 'markdown_syntax_conceal', 1) == 1
  let s:concealends = ' concealends'
endif

exe 'syn region markdownH1 matchgroup=markdownH1Delimiter start="\s*#\s"      end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained' . s:concealends
exe 'syn region markdownH2 matchgroup=markdownH2Delimiter start="\s*##\s"     end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained' . s:concealends
exe 'syn region markdownH3 matchgroup=markdownH3Delimiter start="\s*###\s"    end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained' . s:concealends
exe 'syn region markdownH4 matchgroup=markdownH4Delimiter start="\s*####\s"   end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained' . s:concealends
exe 'syn region markdownH5 matchgroup=markdownH5Delimiter start="\s*#####\s"  end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained' . s:concealends
exe 'syn region markdownH6 matchgroup=markdownH6Delimiter start="\s*######\s" end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained' . s:concealends
exe 'syn region markdownUrl matchgroup=markdownUrlDelimiter start="<" end=">" oneline keepend nextgroup=markdownUrlTitle skipwhite contained' . s:concealends
exe 'syn region markdownAutomaticLink matchgroup=markdownUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline' . s:concealends
exe 'syn region pandocUnderline matchgroup=pandocUnderlineDelimiter start="<span\( \|[A-z]\)\+class=\"underline\"\( \|[A-z]\)*>" end="</span>" contains=@htmlTop,htmlUnderlineBold,htmlUnderlineItalic keepend' . s:concealends
exe 'syn region markdownComment matchgroup=markdownCommentDelimiter start="<!--" end="-->" contains=@htmlTop,htmlUnderlineBold,htmlUnderlineItalic keepend' . s:concealends
syn keyword markdownTodo  contained TODO Todo FixMe FIXME
syn match markdownOrderedListMarker "\(\s*\)\(\d\+\.\)\+\s\+" contained

hi def link pandocUnderline htmlUnderline
hi def link pandocUnderlineDelimiter htmlUnderlineDelimiter
hi def link markdownTodo Todo
hi def link markdownComment Comment
hi def link markdownCommentDelimiter Comment
hi def link markdownOrderedListMarker     markdownListMarker
hi def link markdownListMarker            htmlTagName
