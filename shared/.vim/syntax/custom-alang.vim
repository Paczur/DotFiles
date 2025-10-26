syn region alangBlock start="{" end="}" transparent fold
syn region alangComment start="//" end="$"

syn match alangString /"\([^\\"]\|\\.\)*"/
syn match alangCharacter /'\([^\\']\|\\.\)*'/
"syn match alangTypeDecl /\s*\w\+\(::\w\+\)*:\s*\(struct\|union\)\s*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*[^{]*/
"syn match alangVarDecl /\w\+\(::\w\+\)*\s*:\s*\([!?]*\(\[\w*\]\|\*\)*!\?\w*\(::\w\+\)*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*\)\?\ze\s*[=;,)}]/
"syn match alangFunDecl /\w\+\(::\w\+\)*\s*:\s*\(inline\)\?\s*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*\s*([^)]*/ contains=alangFunBeforeParams,alangFunParams nextgroup=alangFunReturnType
"syn match alangFunBeforeParams /\w\+\(::\w\+\)*\s*:\s*\(inline\)\?\s*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*\s*/ contained contains=alangFunIdentifier,alangFunGenerics nextgroup=alangFunParams
"syn match alangFunGenerics /\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)\+/ contained
"syn match alangFunIdentifier /\w\+\(::\w\+\)*\ze:/ contained
"syn match alangFunParams /([^)]*/ contained contains=alangVarDecl nextgroup=alangFunReturnType
"syn match alangFunReturnType /)\s*\zs[!?]*\(\[\w*\]\|\*\)*!\?\w\+\(::\w\+\)*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*\ze\s*/
"syn match alangTypeIdentifier /\w\+\(::\w\+\)*\ze:/ contained containedin=alangTypeDecl
"syn match alangVarIdentifier /\w\+\(::\w\+\)*\ze\s*:/ contained containedin=alangVarDecl
"syn match alangVarType /:\s*\zs[!?]*\(\[\w*\]\|\*\)*!\?\w*\(::\w\+\)*\(<\(\w\+\s*\(:\s*\w*\)\?,\?\)\+>\)*\ze\s*/ contained containedin=alangVarDecl
"syn match alangOperator /\([+=\-*|&^!?><.]\|=>\)/
"syn match alangIdentifier /\w\+\(:\w\+\)*/
syn region alangAttribute start="^\[" end="\]"
"syn match alangVarDeclaration /\(\**!*\(\[[0-9]*\]\)*\(<\w\+>\)*\)*\w\+\(:\w\+\)*\s\+\w\+\(:\w\+\)*/
"syn match alangVarIdentifier /\s\w\+\(:\w\+\)*/ contained containedin=alangVarDeclaration
"syn match alangVarType /\(\**!*\(\[[0-9]*\]\)*\(<\w\+>\)*\)*\w\+\(:\w\+\)*/ contained containedin=alangVarDeclaration
"syn match alangFunDeclaration /\(\(\**!*\(\[[0-9]*\]\)*\(<\w\+>\)*\)*\w\+\(:\w\+\)*\s\+\)\?\w\+\(:\w\+\)*\ze(/
"syn match alangFunIdentifier /\w\+\(:\w\+\)*\ze(/ contained containedin=alangFunDeclaration
"syn match alangFunReturnType /\(\**!*\(\[[0-9]*\]\)*\(<\w\+>\)*\)*\w\+\(:\w\+\)*\ze\s/ contained containedin=alangFunDeclaration
"syn match alangStructureDeclaration /\(struct\|union\|enum\)\s\+\(\**!*\(\[[0-9]*\]\)*\(<\w\+>\)*\)*\w\+\(:\w\+\)*/
"syn match alangStructureKeyword /\(struct\|union\|enum\)/ contained containedin=alangStructureDeclaration
"syn match alangStructureType /\s\zs\(\**!*\(\[[0-9]*\]\)*\(<\w\+>\)*\)*\w\+\(:\w\+\)*/ contained containedin=alangStructureDeclaration
"syn match alangDefineDeclaration /def \w\+\(:\w\+\)*/
"syn match alangDefineKeyword /def/ contained containedin=alangDefineDeclaration
"syn match alangDefineIdentifier /\s\w\+\(:\w\+\)*/ contained containedin=alangDefineDeclaration
"syn match alangCast /=>\s*\zs\(\**!*\(\[[0-9]*\]\)*\(<\w\+>\)*\)*\w\+\(:\w\+\)*/
"syn match alangNumber /[0-9]\+/
"syn match alangFloat /[0-9]\+\(\.[0-9]\+\)\?/

syn keyword alangConditional if else elif
syn keyword alangRepeat for while loop
syn keyword alangStatement goto break return continue
syn keyword alangBoolean true false
"syn keyword alangStructure struct union type
syn keyword alangKeyword sizeof typeof alignof offsetof lengthof
syn keyword alangIntroducer def defn fn var struct enum union


hi def link alangAttribute Define
hi def link alangDefineIdentifier Define
hi def link alangDefineKeyword Define
hi def link alangIntroducer Define
hi def link alangIdentifier Identifier
hi def link alangComment Comment
hi def link alangVarIdentifier Identifier
hi def link alangFunIdentifier Function
hi def link alangVarType Type
hi def link alangCast Type
hi def link alangFunReturnType Type
hi def link alangOperator Operator
hi def link alangConditional Conditional
hi def link alangRepeat Repeat
hi def link alangStatement Statement
hi def link alangTypeIdentifier Structure
hi def link alangStructureKeyword Structure
hi def link alangStructureType Type
hi def link alangKeyword Keyword
hi def link alangString String
hi def link alangCharacter Character
hi def link alangBoolean Boolean
hi def link alangNumber Number
hi def link alangFloat Float
