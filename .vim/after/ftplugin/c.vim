let c_gnu=1
let c_comment_strings=1
let c_space_errors=1
let c_syntax_for_h=1
set cinoptions=:0,b1,(0,c0
set cinkeys=0=break,o,O,e,i,=if,0=switch,=for,=while,0},0{,0),0],;,0#,*<Return>

set noautoindent
set cindent
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
set foldminlines=2
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=0
set foldcolumn=1
set formatoptions=o/qjc

packadd termdebug
let g:termdebug_wide=1
let g:termdebug_popup = 0
let g:termdebug_use_prompt = 1

