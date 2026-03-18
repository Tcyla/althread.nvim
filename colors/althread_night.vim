" Vim color file
" Name: althread_night
" Converted from Althread Night (Sublime Text)

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "althread_night"

" Core UI
hi Normal       guifg=#000000 guibg=#0F1115 ctermfg=16 ctermbg=234
hi Comment      guifg=#999988 gui=italic ctermfg=245 cterm=italic
hi String       guifg=#A3BE8C ctermfg=151
hi SpecialString guifg=#E5C07B gui=italic ctermfg=180 cterm=italic
hi Number       guifg=#36ACAA ctermfg=73
hi Boolean      guifg=#36ACAA ctermfg=73
hi Constant     guifg=#36ACAA ctermfg=73
hi Type         guifg=#8FBCBB gui=bold ctermfg=109 cterm=bold
hi Function     guifg=#329317 ctermfg=34
hi Identifier   guifg=#EB2832 ctermfg=196
hi StorageClass guifg=#F78C6C gui=bold ctermfg=209 cterm=bold
hi Operator     guifg=#81A1C1 ctermfg=109
hi Delimiter    guifg=#7F8C9F ctermfg=103
hi Keyword      guifg=#B830FF gui=bold ctermfg=135 cterm=bold
hi Conditional  guifg=#00009F ctermfg=19
hi Define       guifg=#00009F gui=bold ctermfg=19 cterm=bold
hi SpecialChar  guifg=#C792EA ctermfg=176

" Optional editor accents (safe defaults)
hi LineNr       guifg=#4C566A ctermfg=60
hi CursorLineNr guifg=#B0BEC5 gui=bold ctermfg=145 cterm=bold
hi Visual       guibg=#27313D ctermbg=236
