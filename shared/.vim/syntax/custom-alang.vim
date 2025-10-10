syn region alangBlock start="{" end="}" transparent fold
syn region alangComment start="//" end="$"

syn match alangString /"\([^\\"]\|\\.\)*"/
syn match alangCharacter /'\([^\\']\|\\.\)*'/
syn match alangTypeDecl /\s*\w\+\(::\w\+\)*:\s*\(struct\|union\)\s*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*[^{]*/
syn match alangVarDecl /\w\+\(::\w\+\)*\s*:\s*\([!?]*\(\[\w*\]\|\*\)*!\?\w*\(::\w\+\)*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*\)\?\ze\s*[=;,)}]/
syn match alangFunDecl /\w\+\(::\w\+\)*\s*:\s*\(inline\)\?\s*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*\s*([^)]*/ contains=alangFunBeforeParams,alangFunParams nextgroup=alangFunReturnType
syn match alangFunBeforeParams /\w\+\(::\w\+\)*\s*:\s*\(inline\)\?\s*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*\s*/ contained contains=alangFunIdentifier,alangFunGenerics nextgroup=alangFunParams
syn match alangFunGenerics /\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)\+/ contained
syn match alangFunIdentifier /\w\+\(::\w\+\)*\ze:/ contained
syn match alangFunParams /([^)]*/ contained contains=alangVarDecl nextgroup=alangFunReturnType
syn match alangFunReturnType /)\s*\zs[!?]*\(\[\w*\]\|\*\)*!\?\w\+\(::\w\+\)*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*\ze\s*/
syn match alangTypeIdentifier /\w\+\(::\w\+\)*\ze:/ contained containedin=alangTypeDecl
syn match alangVarIdentifier /\w\+\(::\w\+\)*\ze\s*:/ contained containedin=alangVarDecl
syn match alangVarType /:\s*\zs[!?]*\(\[\w*\]\|\*\)*!\?\w*\(::\w\+\)*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*\ze\s*/ contained containedin=alangVarDecl
syn match alangOperator /\([+=\-*|&^!?><.\[\]]\|::\|->\)/
syn match alangNumber /[0-9]\+/
syn match alangFloat /[0-9]\+\(\.[0-9]\+\)\?/

syn keyword alangConditional if else elif
syn keyword alangRepeat for while loop
syn keyword alangStatement goto break return continue
syn keyword alangBoolean true false


hi def link alangComment Comment
hi def link alangVarIdentifier Identifier
hi def link alangFunIdentifier Function
hi def link alangVarType Type
hi def link alangFunReturnType Type
hi def link alangOperator Operator
hi def link alangConditional Conditional
hi def link alangRepeat Repeat
hi def link alangStatement Statement
hi def link alangTypeIdentifier Structure
hi def link alangString String
hi def link alangCharacter Character
hi def link alangBoolean Boolean
hi def link alangNumber Number
hi def link alangFloat Float
