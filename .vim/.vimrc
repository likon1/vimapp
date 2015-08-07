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
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>
map <F1> :tabprev<CR>
map <F2> :tabnext<CR>
map <F3> :tabs<CR>
imap <F1> <Esc>:tabprev<CR>
imap <F2> <Esc>:tabnext<CR>
imap <F3> <Esc>:tabs<CR>
map <F8> :set number!<CR>
map <F9> :set autoindent!<CR>
map <F10> :q
map <F11> :TlistUpdate<CR>
map <F12> :TlistToggle<CR>
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

let g:CodeReviewer_reviewer="GW"    " moje inicjaĹy :>
"let g:CodeReviewer_reviewFile=$HOME . "/.vim/review_GW.rev"
let g:CodeReviewer_reviewFile="review_GW.rev"
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

set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,resize
if has("win32") || has("win64")
" Windows
    set directory=c:\temp\vim2,.
    set backupdir=c:\temp\vim,.
    colorscheme torte
    set cuc cul
    hi CursorLine gui=NONE guibg=#111111
    hi! link CursorColumn CursorLine
    set indentexpr=
    "set guifont=Dejavu_Sans_Mono:h10:cEASTEUROPE
    set guifont=Liberation_Mono:h10:cEASTEUROPE

    autocmd FileType  python   source W:\.vim\formatting\python.vim
    autocmd FileType  perl     source W:\.vim\formatting\perl.vim
    execute pathogen#infect()
else
" Linux
    "autocmd BufEnter *.py   source ~/.vim/autoload/python.vim
    "autocmd BufEnter *.pl   source ~/.vim/autoload/perl.vim
    "autocmd BufEnter *.pm   source ~/.vim/autoload/perl.vim
    autocmd FileType  python   source ~/.vim/formatting/python.vim
    autocmd FileType  perl     source ~/.vim/formatting/perl.vim
    execute pathogen#infect()

    set background=light
endif

" ustawienia kolorĂłw
"let g:colors_name = "gefek-colors"

"highlight Normal         ctermfg=LightGrey guibg=black guifg=#AFABAF
highlight Search         ctermfg=Yellow ctermbg=Red cterm=bold guifg=Yellow guibg=Red
highlight IncSearch      ctermbg=red ctermfg=black cterm=NONE guifg=red guibg=black
"highlight Visual         cterm=reverse guifg=#303030 guibg=LightGray
"highlight Cursor         ctermfg=Black ctermbg=Green cterm=bold guifg=black guibg=#61FFCF
"highlight Special        ctermfg=Brown guifg=#CF7520
highlight Comment        ctermfg=Blue guifg=#7A90FF guibg=black gui=NONE
highlight Directory      ctermfg=Blue guifg=#7A90FF guibg=black gui=NONE
highlight StatusLine     cterm=bold gui=NONE ctermfg=green ctermbg=blue guifg=green guibg=#0000AF
"highlight StatusLineNC   ctermfg=black ctermbg=white cterm=NONE
"highlight User1          ctermfg=grey ctermbg=blue cterm=bold
"highlight VertSplit      ctermfg=gray ctermbg=blue cterm=bold
"highlight Statement      ctermfg=Yellow cterm=bold gui=none guifg=Yellow
"highlight vimCommand     ctermfg=Yellow ctermbg=black cterm=NONE guifg=#CF7520
"highlight Type           cterm=NONE gui=NONE guifg=#00AB00
"highlight Identifier     cterm=NONE ctermfg=blue
highlight NonText        ctermfg=darkgreen guifg=#7A90FF
highlight SpecialKey     ctermfg=darkgreen guifg=#7A90FF
"highlight Folded         term=standout cterm=bold ctermfg=6 ctermbg=0 guifg=Cyan guibg=black
"highlight PreProc        term=underline cterm=bold ctermfg=Blue guifg=#7A90FF
"highlight Todo           term=standout ctermfg=0 ctermbg=3 guifg=black guibg=#CF7520
highlight LineNr        ctermfg=DarkGreen
highlight Pmenu ctermfg=white ctermbg=darkblue gui=bold
highlight PmenuSel      ctermfg=white ctermbg=green gui=bold

highlight ColorColumn ctermbg=cyan guibg=DarkCyan

filetype plugin on
