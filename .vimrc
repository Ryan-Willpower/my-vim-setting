syntax on
filetype on
filetype plugin indent on

packloadall

colorscheme nord

let g:javascript_plugin_jsdoc = 1

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

command! -nargs=* Wrap set wrap linebreak nolist

set conceallevel=1
set relativenumber
set clipboard=unnamed
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set showcmd

filetype plugin on
set omnifunc=syntaxcomplete#Complete

nnoremap :nt :NERDTree<CR>

vnoremap jk <ESC>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

inoremap jk <ESC>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
syntax clear

syn match yamlDelimiter	"[:,-]"
syn match yamlBlock "[\[\]\{\}\|\>]"
syn match yamlOperator "[?^+-]\|=>"

syn region yamlComment	start="\#" end="$"
syn match yamlIndicator	"#YAML:\S\+"

syn region yamlString	start="'" end="'" skip="\\'"
syn region yamlString	start='"' end='"' skip='\\"' contains=yamlEscape
syn match  yamlEscape	+\\[abfnrtv'"\\]+ contained
syn match  yamlEscape	"\\\o\o\=\o\=" contained
syn match  yamlEscape	"\\x\x\+" contained

syn match  yamlType	"!\S\+"

syn keyword yamlConstant NULL Null null NONE None none NIL Nil nil
syn keyword yamlConstant TRUE True true YES Yes yes ON On on
syn keyword yamlConstant FALSE False false NO No no OFF Off off

syn match  yamlKey	"\w\+\ze\s*:"
syn match  yamlAnchor	"&\S\+"
syn match  yamlAlias	"*\S\+"

" Setupt the hilighting links

hi link yamlConstant Keyword
hi link yamlIndicator PreCondit
hi link yamlAnchor	Function
hi link yamlAlias	Function
hi link yamlKey		Identifier
hi link yamlType	Type

hi link yamlComment	Comment
hi link yamlBlock	Operator
hi link yamlOperator	Operator
hi link yamlDelimiter	Delimiter
hi link yamlString	String
hi link yamlEscape	Special
