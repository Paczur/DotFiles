syn match makeFun /^[^:=+]\+\ze:/
syn match makeSFun /^\.[^:=+]\+\ze:/
syn match makeVar /^[^=:+]\+\ze=/
syn match makeString /"\([^\\"]\|\\.\)*"/
syn match makeCharacter /'\([^\\']\|\\.\)*'/
syn match	makeSpecial contained "\\\%(x\x\+\|\o\{1,3}\|.\|$\)" containedin=cString,cCharacter

hi def link makeVar Identifier
hi def link makeFun Function
hi def link makeString String
hi def link makeCharacter Character
hi def link makeSpecial Special
hi def link makeSFun Structure
