syn region pythonComment start="#" end="$"

" Taken from vims syntax
syn region  pythonString matchgroup=pythonQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=pythonEscape,@Spell
syn region  pythonString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell
syn region  pythonRawString matchgroup=pythonQuotes
      \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=@Spell
syn region  pythonRawString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=[rR]\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonSpaceError,pythonDoctest,@Spell
syn match   pythonEscape	+\\[abfnrtv'"\\]+ contained
syn match   pythonEscape	"\\\o\{1,3}" contained
syn match   pythonEscape	"\\x\x\{2}" contained
syn match   pythonEscape	"\%(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match   pythonEscape	"\\N{\a\+\%(\s\a\+\)*}" contained
syn match   pythonEscape	"\\$"

syn match pythonCharacter /'\([^\\']\|\\.\)*'/
syn match	pythonSpecial contained "\\\%(x\x\+\|\o\{1,3}\|.\|$\)" containedin=pythonString,pythonCharacter
syn region pythonFCall start="(" end=")" contains=pythonString,pythonCharacter,pythonRawString
syn match pythonFun /^\s*def\s\+\zs\h\w*\s*(/
syn match pythonVar /^\s*\h\w*\ze\s*=/

hi def link pythonRawString String
hi def link pythonString String
hi def link pythonCharacter Character
hi def link pythonSpecial Special
hi def link pythonEscape Special
hi def link pythonComment Comment
hi def link pythonFun Function
hi def link pythonVar Identifier
