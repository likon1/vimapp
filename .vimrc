

set nocompatible
syntax on
set autoindent
set nocindent
set ruler
set ts=4
set sts=4
set sw=4
set expandtab
set encoding=utf-8
"set termencoding=iso-8859-2
set ffs=unix,dos
set fileencodings=ucs-bom,utf-8,latin2,cp1250
set mouse=a
set backspace=2
set synmaxcol=316

set history=1000

set incsearch
set ignorecase
set smartcase
set backup

set list
"set listchars=eol:$,tab:>-
set listchars=trail:_,tab:>-

set wildmenu

function VarIsSet(var, val, elseval)
    if (a:var) | return a:val | else | return a:elseval | endif
endfunction
set rulerformat=%40(%y/%{&fenc}%(\ %{VarIsSet(&bomb,'BOM','')}%)/%{&ff}%=%l,%c%V%5(%P%)%)

set sua=.py,.pm,.pl,.txt,.html,.xml,.conf

nmap <Leader>cn :cn<CR>
nmap <Leader>cp :cp<CR>
nmap <Leader>cc :cclose<CR>
map <Leader>tt :tabnew<CR>
map <Leader>tp :tabprev<CR>
map <Leader>tn :tabnext<CR>
map <F4> :NERDTreeToggle<CR>
map <F5> :NERDTreeFind<CR>
map <F1> :tabprev<CR>
map <F2> :tabnext<CR>
map <F3> :tabs<CR>
map <F8> :set number!<CR>
map <F9> :set autoindent!<CR>
map <F11> :cn<CR>
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") |
	\ exe "normal `\"" | endif
autocmd BufEnter *.*  setlocal indentexpr= | setlocal autoindent

let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_WinWidth = 40
let Tlist_Sort_Type = "name"
let Tlist_Auto_Update = 1

let NERDTreeQuitOnOpen=1
let NERDTreeDirArrows=0

" nerd comments
let NERDSpaceDelims=1

let g:CodeReviewer_reviewer="MM"   
let g:CodeReviewer_reviewFile=$HOME . "/.vim/review_MM.rev"
let g:CodeReviewer_reviewFile="review_MM.rev"
let g:flake8_max_line_length=119


try
    let g:auto_fold_value=3

    fun! AutoFoldColumn()
        let currval=&foldcolumn
        if currval>0
            let g:auto_fold_value=currval
            set foldcolumn=0
        else
            let &foldcolumn=g:auto_fold_value
        endif
    endfun
endtry

vmap <Leader>w <Esc>:call VisualTagWrap()<CR>
function! VisualTagWrap()
    "
    let input_tag = input("Tag to wrap block: ")
    let input_tag_params = substitute(input_tag, "^[^ ]* *", "", "")
    let input_tag = substitute(input_tag, " .*", " ", "")

    if len(input_tag) > 0
        normal `>
        if &selection == 'exclusive'
            if &filetype == 'tex'
                exe "normal i}"
            else
                exe "normal i</".input_tag.">"
            endif
        else
            if &filetype == 'tex'
                exe "normal a}"
            else
                exe "normal a</".input_tag.">"
            endif
        endif
        normal `<
        if &filetype == 'tex'
            exe "normal i\\".input_tag.input_tag_params."{"
        else
            exe "normal i<".input_tag.input_tag_params.">"
        endif
        normal `<
    endif
endfunction
colorscheme molokai

execute pathogen#infect()
syntax on
filetype plugin indent on

set nobackup
set noswapfile
set number

autocmd BufNewFile,BufRead *.jqtpl set syntax=smarty
autocmd BufNewFile,BufRead *.tpl set syntax=smarty
autocmd BufNewFile,BufRead *.less set syntax=css

filetype plugin on
