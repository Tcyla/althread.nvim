" Vim syntax file
" Language: Althread
" Maintainer: Tcyla

if exists("b:current_syntax")
  finish
endif

syntax case match

" Comments
syntax region althreadCommentLine start=+//+ end=+$+ keepend contains=NONE
syntax region althreadCommentBlock start=+/\*+ end=+\*/+ keepend contains=NONE

" Strings and escapes
syntax region althreadStringD start=+"+ skip=+\\.+ end=+"+ contains=althreadEscape
syntax region althreadStringS start=+'+ skip=+\\.+ end=+'+ contains=althreadEscape
syntax match  althreadEscape /\\./ contained

" Numbers
syntax match althreadNumberHex /\<0x[0-9A-Fa-f_]+n\?\>/
syntax match althreadNumberBin /\<0b[01_]+n\?\>/
syntax match althreadNumberOct /\<0o[0-7_]+n\?\>/
syntax match althreadNumberBig /\<\d[\d_]*n\>/
syntax match althreadNumberDec /\v\<(\d[\d_]*(\.[\d_]+)?([eE][+-]?[\d_]+)?|(\.\d[\d_]*)([eE][+-]?[\d_]+)?)\>/

" Keywords
syntax keyword althreadKeywordModule program main shared fn import check
syntax keyword althreadKeywordControl atomic while await if else receive send run for loop in return break continue seq first always eventually never exists label reaches until
syntax keyword althreadKeywordDecl let const channel
syntax keyword althreadKeywordOp as

" Types and literals
syntax keyword althreadType bool int float string void proc list tuple
syntax keyword althreadBoolean true false
syntax keyword althreadNull null

" Modifier
syntax match althreadPrivate /@private\>/

" Identifiers and members
syntax match althreadIdentifier /\<[$A-Za-z][A-Za-z0-9_]*\>/
syntax match althreadDollar /\$/

" Function and program declarations
syntax match althreadFnDecl /\<fn\>\s\+\zs[$A-Za-z][A-Za-z0-9_]*/
syntax match althreadProgramDecl /\<program\>\s\+\zs[$A-Za-z][A-Za-z0-9_]*/

" Calls and members
syntax match althreadFunctionCall /\<[$A-Za-z][A-Za-z0-9_]*\ze\s*(/
syntax match althreadMethodCall /\.\zs[A-Za-z][A-Za-z0-9_]*\ze\s*(/
syntax match althreadProperty /\.\zs[A-Za-z][A-Za-z0-9_]*/

" Operators and punctuation
syntax match althreadOpAssign /[+\-*/%]\?=/
syntax match althreadOpAssign /|=/
syntax match althreadOpCompare /==\|!=\|<=\|<\|>=\|>/
syntax match althreadOpLogical /!/
syntax match althreadOpLogical /&&/
syntax match althreadOpLogical /||/
syntax match althreadOpBitwise /&/
syntax match althreadOpBitwise /|/
syntax match althreadOpShift /<<\|>>/
syntax match althreadOpArithmetic /[+\-*/%]/
syntax match althreadOpRange /\.\./
syntax match althreadArrow /->\|=>/
syntax match althreadPunctuation /[,;:]/
syntax match althreadAccessor /\./

" Links to standard highlight groups
highlight default link althreadCommentLine Comment
highlight default link althreadCommentBlock Comment
highlight default link althreadStringD String
highlight default link althreadStringS String
highlight default link althreadEscape SpecialChar

highlight default link althreadNumberHex Number
highlight default link althreadNumberBin Number
highlight default link althreadNumberOct Number
highlight default link althreadNumberBig Number
highlight default link althreadNumberDec Number

highlight default link althreadKeywordModule Keyword
highlight default link althreadKeywordControl Conditional
highlight default link althreadKeywordDecl Define
highlight default link althreadKeywordOp Operator

highlight default link althreadType Type
highlight default link althreadBoolean Boolean
highlight default link althreadNull Constant
highlight default link althreadPrivate StorageClass

highlight default link althreadFnDecl Function
highlight default link althreadProgramDecl Type
highlight default link althreadFunctionCall Function
highlight default link althreadMethodCall Function
highlight default link althreadProperty Identifier
highlight default link althreadIdentifier Identifier
highlight default link althreadDollar Identifier

highlight default link althreadOpAssign Operator
highlight default link althreadOpCompare Operator
highlight default link althreadOpLogical Operator
highlight default link althreadOpBitwise Operator
highlight default link althreadOpShift Operator
highlight default link althreadOpArithmetic Operator
highlight default link althreadOpRange Operator
highlight default link althreadArrow Delimiter
highlight default link althreadPunctuation Delimiter
highlight default link althreadAccessor Delimiter

let b:current_syntax = "althread"
