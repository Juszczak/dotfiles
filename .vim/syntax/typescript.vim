if !exists('main_syntax')
	if version < 600
		syntax clear
		if exists('typescript_fold')
			unlet typescript_fold
		endif
	elseif exists('b:current_syntax')
		finish
	endif
	let main_syntax = 'typescript'
endif

if version < 600 && exists('typescript_fold')
	unlet typescript_fold
endif

setlocal iskeyword+=$
setlocal iskeyword+=@
setlocal iskeyword-=.

syntax sync fromstart

" syntax coloring for Node.js shebang line
syntax match shebang "^#!.*/bin/env\s\+node\>"
highlight link shebang PreProc

" comments

syntax keyword typescriptCommentTodo TODO FIXME XXX TBD contained
highlight link typescriptCommentTodo Todo

syntax match typescriptLineComment "\/\/.*" contains=@Spell,typescriptCommentTodo,typescriptRef
highlight link typescriptLineComment Comment

syntax match typescriptRefComment /\/\/\/<\(reference\|amd-\(dependency\|module\)\)\s\+.*\/>$/ contains=typescriptRefD,typescriptRefS
highlight link typescriptRefComment PreCondit

syntax region typescriptRefD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+
syntax region typescriptRefS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+
syntax region typescriptRefD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+
syntax region typescriptRefS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+
highlight link typescriptRefS String
highlight link typescriptRefD String

syntax match typescriptCommentSkip "^[ \t]*\*\($\|[ \t]\+\)"
syntax region typescriptComment start="/\*" end="\*/" contains=@Spell,typescriptCommentTodo extend
highlight link typescriptComment Comment

" strings

syntax match typescriptSpecial "\\\d\d\d\|\\."
syntax region typescriptStringD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+  contains=typescriptSpecial,@htmlPreproc extend
syntax region typescriptStringS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+  contains=typescriptSpecial,@htmlPreproc extend
syntax region typescriptStringB start=+`+ skip=+\\\\\|\\`+ end=+`+  contains=typescriptInterpolation,typescriptSpecial,@htmlPreproc extend

highlight link typescriptStringS String
highlight link typescriptStringD String
highlight link typescriptStringB String

syntax region typescriptRegexpString start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
highlight link typescriptRegexpString String

syn region typescriptInterpolation matchgroup=typescriptInterpolationDelimiter
	\ start=/${/ end=/}/ contained
	\ contains=@typescriptExpression

syntax match typescriptNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
highlight link typescriptNumber Number

syntax keyword typescriptSource import export from as
highlight link typescriptSource Include

syntax keyword typescriptStructure module class enum interface extends implements
highlight link typescriptStructure Structure

syntax keyword typescriptFunction function constructor
highlight link typescriptFunction Function

syntax keyword typescriptDeclaration this let var const this
highlight link typescriptDeclaration Typedef

syntax keyword typescriptPrimitive boolean number string symbol void object
highlight link typescriptPrimitive Type

syntax keyword typescriptAnyType any never
highlight link typescriptAnyType Tag

syntax keyword typescriptKeyword delete new instanceof typeof
syntax keyword typescriptBoolean true false
syntax keyword typescriptNull null undefined

syntax keyword typescriptAccessor public private abstract namespace
highlight link typescriptAccessor Label

syntax keyword typescriptStatic static
highlight link typeScriptStatic StorageClass

syntax keyword typescriptReadonly readonly
highlight typescriptReadonly guifg=#f54d27 gui=italic

syntax keyword typescriptReadonly readonly
highlight link typeScriptReadonly Comment

syntax keyword typescriptTypeDef declare type

syntax keyword typescriptAngular Component Directive Input NgModule Output ViewChild ViewChildren
highlight link typescriptAngular Special

syntax match typescriptAngularDecorator "[@]"
highlight link typescriptAngularDecorator Special

syntax match typescriptOperator "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-=\|+\|-"
highlight link typescriptOperator PreProc

syntax match typescriptLogicOperator "\(&&\)\|\(||\)"
highlight link typescriptLogicSymbols Operator

syntax match typescriptTypeOperator "\(&\)\|\(|\)"
highlight link typescriptTypeOperator Operator

syntax match typescriptBraces "[{}\[\]<>]"
highlight link typescriptBraces PreProc

syntax match typescriptParens "[()]"
highlight link typescriptParens PreProc

syntax match typescriptEndColons "[;,]"
highlight link typescriptEndColons PreProc

syn match typescriptConstant /\<\u[A-Z0-9_]\+\>/ display
hi def link typescriptConstant Constant

syn cluster typescriptAll contains=typescriptConstant

let current_syntax = 'typescript'
if main_syntax ==? 'typescript'
	unlet main_syntax
endif
