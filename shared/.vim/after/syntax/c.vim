syn keyword Danger free malloc calloc realloc reallocarray
syn clear cStorageClass cStatement cOperator cType cNumber
syn region include start="^#include" end="^\%(#include\)\@!" fold
syn region define start="^#define" end="[^\\]$" fold keepend extend contains=.*Block
syn region PreCondit start="^#if" end="^#endif" fold keepend extend contains=ALL
