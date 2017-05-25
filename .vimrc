" -----------VMUX_OCTANE-----------{{{
"
" For those of you who are new to using Vim as a text
" editor, you must understand the  road ahead will be
" filled with many mistakes, but you must have patience
" and motivation to learn this powerful tool. Vim has
" the most open source plugins out of all of the text
" editors. So once you feel like you have gotten your
" sealegs and can move around in vim I 
" I recommend moving onto learning what plugins are
" and how to install them. It is at that point you will
" discover the power that is Vim.
"
" ****Please use with cation this setup can lead to
"       insanity.
"
" Author: Jared 'DredNaut' Knutson
" }}}

" -----------PLUGINS------------------{{{
"
"-------------PATHOGEN----------------
execute pathogen#infect()
syntax on
filetype plugin indent on

set encoding=utf-8

"-------------AIRLINE-----------------
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_theme='wombat'

"------------RAINBOW PAREN------------
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 1

" -------------MULTI CURSORS--------------
let g:multi_cursor_use_default_mapping=0
" Default Mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"}}}

"-----------REMAPS-----------------{{{
let mapleader = '-'
inoremap jk <Esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

"Inside heading 
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
"Around heading
onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
"}}}

"-----------AUTO COMMANDS---------------{{{
"Write txt files on open
autocmd BufNewFile *.txt :write

"Comment out lines using <localleader>c
autocmd FileType javascript nnoremap <uffer> <localleader>c I//<esc>
autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>

"Autocommands and abbreviations
autocmd FileType python :iabbrev <buffer> iff if:<left>
autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
autocmd FileType cpp :iabbrev <buffer> iff if ()<left>

augroup testgroup
    autocmd! 
    autocmd FileType cpp nnoremap <buffer> <localleader>f Vatzf
augroup END

"autocmd BufWrite * :echom "Writing Buffer!"
"autocmd BufWrite * :sleep 200m
"}}}

"-----------VIMSCRIPT FILE SETTINGS --------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"-----------C++ FILE SETTINGS----------------{{{
"These snips are set for usage in cpp only.
augroup filetype_cpp
    autocmd!
    autocmd FileType cpp iabbrev <buffer> incio #include <iostream>
    autocmd FileType cpp iabbrev <buffer> incos #include <ostream>
    autocmd FileType cpp iabbrev <buffer> incve #include <vector>
    autocmd FileType cpp iabbrev <buffer> incfs #include <fstream>
    autocmd FileType cpp iabbrev <buffer> incal #include <algorithm>
    autocmd FileType cpp iabbrev <buffer> inc #include
    autocmd FileType cpp iabbrev <buffer> tempT template <class Type>
    autocmd FileType cpp iabbrev <buffer> mysig //Jared Knutson<cr>//jaredknutson@nevada.unr.edu
    autocmd FileType cpp iabbrev <buffer> usname using namespace std;
    autocmd FileType cpp iabbrev <buffer> intmain int main ()<Esc>o{<Esc>o}<Esc>O<tab>
    autocmd FileType cpp iabbrev <buffer> fori for (int i = 0; i <h; i++)<Esc>o{<Esc>o}<Esc>O<tab>*<Esc>(0f*s
    autocmd FileType cpp iabbrev <buffer> forj for (int j = 0; j <h; j++)<Esc>o{<Esc>o}<Esc>O<tab>*<Esc>(0f*s
    autocmd FileType cpp iabbrev <buffer> forrow for (int row = 0; row <h; row++)<Esc>o{<Esc>o}<Esc>O<tab>*<Esc>(0f*s
    autocmd FileType cpp iabbrev <buffer> forcol for (int col = 0; col <h; col++)<Esc>o{<Esc>o}<Esc>O<tab>*<Esc>(0f*s
    autocmd FileType cpp iabbrev <buffer> whileloop while (h)<Esc>o{<Esc>o}<Esc>O<tab>*<Esc>(0f*s
    autocmd FileType cpp iabbrev <buffer> intf int  (h)<Esc>o{<Esc>o}<Esc>O<tab>*<Esc>(0ea
    autocmd FileType cpp iabbrev <buffer> voidf void (h)<Esc>o{<Esc>o}<Esc>O<tab>*<Esc>(0ea
    autocmd FileType cpp iabbrev <buffer> doubf double (h)<Esc>o{<Esc>o}<Esc>O<tab>*<Esc>(0ea
    autocmd FileType cpp iabbrev <buffer> cout cout <<* << endl;<Esc>F*s
    autocmd FileType cpp iabbrev <buffer> squash cout <<  "Bug Tracker 1" << endl;<Esc>F*s
    autocmd FileType cpp iabbrev <buffer> cin cin >>*;<Esc>F*s
augroup END
"}}}

"-----------PYTHON FILE SETTINGS---------------{{{
"This is not enough build more
augroup filetype_python
    autocmd!
    autocmd FileType python iabbrev <buffer> isys import sys
    autocmd FileType python iabbrev <buffer> fori for i in range(j):
    autocmd FileType python iabbrev <buffer> predfor if any(pred(x.item) for x in sequence):
augroup END
"}}}

"-----------BASHSCRIPT FILE SETTINGS---------------{{{
"These are buggy as HELL... plz fixx!
augroup filetype_sh
    autocmd!
    autocmd FileType sh iabbrev <buffer> binbash #!/bin/bash
    autocmd FileType sh iabbrev <buffer> fori for i in $( ls ); do<cr>j<cr>done<esc>(fis
    autocmd FileType sh iabbrev <buffer> while while [ $COUNTER -lt 10 ]; do<cr>j<cr>let COUNTER=COUNTER+1<cr>done<esc>kkfjs
augroup END
"}}}

"-----------DISABLED KEYS----------------{{{ 
inoremap <BS> <Nop>
inoremap <Del> <Nop>
nnoremap <BS> <Nop>
nnoremap <Del> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Down> <Nop>
inoremap <Up> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Down> <Nop>
nnoremap <Up> <Nop>
"}}}

"-----------THEME PREFERENCES----------------{{{
"Maybe use this is the future
"set statusline=%f\ -\ FileType:\ %y
"set statusline=%l/%L
"set statusline=[%04l]
"set statusline=%.20F
"set statusline=%{fugitive#statusline()}
"More at :help statusline
"}}}

" -----------CUSTOM PREFS-----------------{{{
" When using vim-vinegar press '-' to search for a new file in tree.

" When using vim-surround press 'cs' followed by the current surrounder and
" then new surrounder.
"
" When using vim commentary use gc to comment and gcgc to uncomment
"
" My favorite theme finally
colo Tomorrow-Night 
" :<Tab> will be useful now
set wildmenu
" Give me sane tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" Numbered lines enabled
set relativenumber
set number

"Use z-f and z-o for all basic folding needs
set foldmethod=manual
"Keep that damn cursor in the center of the screen
set scrolloff=90
"}}}


"-----------VIMSCRIPT TRIALS--------------{{{
"let foo = "bar"
"echo foo
"Using let instead of set allows for the use of the whole power of vimscript
"let &textwidth = &textwidth + 10
"set textwidth?
"Next example shows the use of local variables
"let &l:number = 1
"let &l:number = 0
"Next example shows the use of setting registers
"let @a = "hello!"
"Next example shows the use of local variable scoping
"let b:hello = "world"
"echo b:hello
"Next example will demonstrate the use of if statement
"if 0
"   echo "if"
"elseif "nope!"
"   echom "elseif"
"else
"   echom "finally!"
"endif
"
"More if statements
"if 10 ==11
"   echom "bar"
"elseif 10 == 10
"   echom "second"
"endif
"==# case-sensitive ==? case-insensitive
"
"Functions!!!! must always start with a capital letter
"function Meow()
"   echom "Meow!"
"endfunction
"call Meow()
"Pratical function to return true if textwidth is > 80
"function TextwidthIsTooWide()
"   if &1:textwidth ># 80
"       return 1
"   endif
"endfunction
"Number Formats: decimal, hex, octal, float, scientific
"echo 100
"echo 0xff
"echo 010
"echo 100.45
"echo 5.45e+3
"String concatenation dot operator for concating 
"echo "Hello, " . "world"
"}}}
