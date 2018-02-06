if !exists('main_syntax')
	if version < 600
		syntax clear
		if exists('javascript_fold')
			unlet javascript_fold
		endif
	elseif exists('b:current_syntax')
		finish
	endif
	let main_syntax = 'javascript'
endif

if version < 600 && exists('javascript_fold')
	unlet javascript_fold
endif

setlocal iskeyword+=$
setlocal iskeyword+=@
setlocal iskeyword-=.

syntax sync fromstart

" syntax coloring for Node.js shebang line
syntax match shebang "^#!.*/bin/env\s\+node\>"
highlight link shebang PreProc

" comments

syntax keyword javascriptCommentTodo TODO FIXME XXX TBD contained
highlight link javascriptCommentTodo Todo

syntax match javascriptLineComment "\/\/.*" contains=@Spell,javascriptCommentTodo,javascriptRef
highlight link javascriptLineComment Comment

syntax match javascriptRefComment /\/\/\/<\(reference\|amd-\(dependency\|module\)\)\s\+.*\/>$/ contains=javascriptRefD,javascriptRefS
highlight link javascriptRefComment PreCondit

syntax region javascriptRefD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+
syntax region javascriptRefS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+
syntax region javascriptRefD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+
syntax region javascriptRefS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+
highlight link javascriptRefS String
highlight link javascriptRefD String

syntax match javascriptCommentSkip "^[ \t]*\*\($\|[ \t]\+\)"
syntax region javascriptComment start="/\*" end="\*/" contains=@Spell,javascriptCommentTodo extend
highlight link javascriptComment Comment

" strings

syntax match javascriptSpecial "\\\d\d\d\|\\."
syntax region javascriptStringD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+  contains=javascriptSpecial,@htmlPreproc extend
syntax region javascriptStringS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+  contains=javascriptSpecial,@htmlPreproc extend
syntax region javascriptStringB start=+`+ skip=+\\\\\|\\`+ end=+`+  contains=javascriptInterpolation,javascriptSpecial,@htmlPreproc extend

highlight link javascriptStringS String
highlight link javascriptStringD String
highlight link javascriptStringB String

syntax region javascriptRegexpString start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
highlight link javascriptRegexpString String

syn region javascriptInterpolation matchgroup=javascriptInterpolationDelimiter
	\ start=/${/ end=/}/ contained
	\ contains=@javascriptExpression

syntax match javascriptNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
highlight link javascriptNumber Number

syntax keyword javascriptSource import export from as
highlight link javascriptSource Include

syntax keyword javascriptStructure module class enum interface extends implements
highlight link javascriptStructure Structure

syntax keyword javascriptFunction function constructor
highlight link javascriptFunction Function

syntax keyword javascriptDeclaration this let var const this
highlight link javascriptDeclaration Typedef

syntax keyword javascriptPrimitive boolean number string symbol void object
highlight link javascriptPrimitive Type

syntax keyword javascriptAnyType any never
highlight link javascriptAnyType Tag

syntax keyword javascriptKeyword delete new instanceof typeof
syntax keyword javascriptBoolean true false
syntax keyword javascriptNull null undefined

syntax keyword javascriptAccessor public private abstract namespace
highlight link javascriptAccessor Label

syntax keyword javascriptStatic static
highlight link javascriptStatic StorageClass

syntax keyword javascriptReadonly readonly
highlight javascriptReadonly guifg=#f54d27 gui=italic

syntax keyword javascriptReadonly readonly
highlight link javascriptReadonly Comment

syntax keyword javascriptTypeDef declare type

syntax keyword javascriptAngular Component Directive Input NgModule Output ViewChild ViewChildren
highlight link javascriptAngular Special

syntax match javascriptAngularDecorator "[@]"
highlight link javascriptAngularDecorator Special

syntax match javascriptOperator "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-=\|+\|-"
highlight link javascriptOperator PreProc

syntax match javascriptLogicOperator "\(&&\)\|\(||\)"
highlight link javascriptLogicSymbols Operator

syntax match javascriptTypeOperator "\(&\)\|\(|\)"
highlight link javascriptTypeOperator Operator

syntax match javascriptBraces "[{}\[\]<>]"
highlight link javascriptBraces PreProc

syntax match javascriptParens "[()]"
highlight link javascriptParens PreProc

syntax match javascriptEndColons "[;,]"
highlight link javascriptEndColons PreProc

syn match javascriptConstant /\<\u[A-Z0-9_]\+\>/ display
hi def link javascriptConstant Constant

syn cluster javascriptAll contains=javascriptConstant

let b:current_syntax = 'javascript'
if g:main_syntax ==? 'javascript'
	unlet g:main_syntax
endif
