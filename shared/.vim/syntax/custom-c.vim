syn region cBlock start="{" end="}" transparent fold
syn region cComment start="//" end="$"
syn match cString /"\([^\\"]\|\\.\)*"/
syn match cCharacter /'\([^\\']\|\\.\)*'/
syn match	cSpecial contained "\\\%(x\x\+\|\o\{1,3}\|.\|$\)" containedin=cString,cCharacter

syn region include start="^#include" end="^\%(#include\)\@!" fold
syn keyword cStatement return goto continue break
syn keyword cLabel case
syn keyword cConditional if else
syn keyword cRepeat for while do
syn region define start="^#define" end="[^\\]$" fold keepend extend contains=cBlock
syn region PreCondit start="^#if" end="^#endif" transparent fold keepend extend contains=ALL
syn region cFunCall start="\h\w*\_s*(" end=")" contained containedin=cBlock
syn match cVarDecl /\(\(struct\|union\|static\|const\|enum\)\_s\+\)*\h\w*\_s\+\**\_s*\zs\h\w*\ze\(\[\w*\]\_s*\)*\_s*[=;,)]\s*/
syn match cFunDecl /\(\(struct\|union\|static\|const\|enum\)\_s\+\)*\h\w*\_s\+\**\_s*\zs\h\w*\ze\(\[\w*\]\_s*\)*\_s*(/
syn region cStruct matchgroup=cStructIdentifier start="\(struct\|union\|enum\)\_s*\zs\(\h\w*\)\?\ze\_s*{" matchgroup=cStructVar end="}\_s*\zs\(\h\w*\)\?\ze\_s*[=;]" containedin=cBlock fold contains=cStruct
syn region cStructTypedef matchgroup=cStructTypedefName start="typedef\_s\+\(struct\|union\|enum\)\_s*\zs\(\h\w*\)\?\ze\_s*{" matchgroup=cStructTypedefIdentifier end="}\_s*\zs\(\h\w*\)\?\ze\_s*[=;]" containedin=cBlock fold contains=cStruct
syn match cTypedef /typedef\_s\+\(\(struct\|union\|static\|const\|enum\)\_s\+\)*\h\w*\_s\+\**\_s*\zs\h\w*\ze\(\[\w*\]\_s*\)*\_s*[=;,)(]\s*/

hi def link cStatement Statement
hi def link cVarDecl Identifier
hi def link cFunDecl Function
hi def link cRepeat Repeat
hi def link cStructIdentifier Structure
hi def link cTypedef Structure
hi def link cStructTypedefName Structure
hi def link cStructTypedefIdentifier Structure
hi def link cStructVar Identifier
hi def link cString String
hi def link cCharacter Character
hi def link cSpecial Special
