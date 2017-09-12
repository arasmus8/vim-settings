set t_Co=256
set nocompatible
filetype plugin on
"execute pathogen#infect()

set bs=2		" allow backspacing over everything in insert mode
set autoindent		" always set autoindenting on
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
"set number
"searching
set showmatch
set smartcase
set ic

set laststatus=2

"indentation
set ts=8
set softtabstop=2
set shiftwidth=2
set expandtab

set define=^\s*#\s*define
set textwidth=100
set linebreak
set breakat+=#()
set nobackup writebackup
set makeef=errs##

set mouse=a
set nohlsearch
set incsearch
set nowrap
syntax on
"set lines=50 columns=120

let g:jsx_ext_required = 0

let mapleader=" "
nnoremap <Leader>gf ma:1,$!gofmt<cr>'a
nnoremap <leader><TAB> :tabnext<CR>
nnoremap <leader><leader><TAB> :tabprevious<CR>
nnoremap <leader>= mf{=}`f
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Function to rename parameter under cursor
function! Rename_Function_Parameter()
  execute 'normal! mc'
  let varname = expand("<cword>")
  execute 'normal! {ma}mb'
  let replacement = input("Refactor " . varname . " to: ")
  execute '''a,''bs/\<' . varname . '\>/' . replacement . '/g'
  execute 'normal! `c'
endfunction
nnoremap <leader>rp :call Rename_Function_Parameter()<cr>

" Function to refactor a key throughout a file
function! Rename_Variable()
  execute 'normal! mc'
  let varname = expand("<cword>")
  let replacement = input("Refactor " . varname . " to: ")
  execute '1,$s/\<' . varname . '\>/' . replacement . '/g'
  execute 'normal! `c'
endfunction
nnoremap <leader>rv :call Rename_Variable()<cr>

" Function to switch beween camel, kebob, and snake case
function! Switch_Identifier_Case(ident, case)
  let parts = []
  if a:ident =~ "_"
    echo "snake case"
    let parts = split(a:ident, '_')
  elseif a:ident =~ "-"
    echo "kebob case"
    let parts = split(a:ident, '-')
  elseif a:ident =~# '[A-Z]' || a:ident =~# '^[a-z]*$'
    echo "camel case"
    let parts = map(split(a:ident, '\U\+\zs'), {key, val -> tolower(val)})
  else
    echo "Couldn't detect case type!"
    return a:ident
  endif

  let result = a:ident
  if a:case ==? "snake"
    let result = join(parts, "_")
  elseif a:case ==? "kebob"
    let result = join(parts, "-")
  else
    let f = [parts[0]]
    let r = map(parts[1:-1], {key, val -> substitute(val, '\(\<\w\|\>\)', '\u\1', 'g')})
    let result = join(f + r, '')
  endif
  return result
endfunction
function! Change_Case(case)
  execute 'normal! mc'
  let varname = expand("<cword>")
  let replacement = Switch_Identifier_Case(varname, a:case)
  execute 'normal! bcw' . replacement
  execute 'normal! `c'
endfunction
nnoremap <leader>cc :call Change_Case("camel")<cr>
nnoremap <leader>ck :call Change_Case("kebob")<cr>
nnoremap <leader>cs :call Change_Case("snake")<cr>

set pastetoggle=<C-P>
nnoremap <PageUp> k_
nnoremap <PageDown> j_
" Home and End for v-split
nnoremap [1~ <C-W>h<C-W>|
nnoremap [4~ <C-W>l<C-W>|
nnoremap <Up> <C-Y>
nnoremap <Down> <C-E>
inoremap <Up> <C-X><C-Y>
inoremap <Down> <C-X><C-E>
nnoremap <Left> 10zh
nnoremap <Right> 10zl

"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

let NERDTreeDirArrows=0
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
noremap Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

filetype plugin indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  augroup global

  autocmd BufRead,BufNewFile *.j,*.jass set filetype=jass sw=4 expandtab sts=4 ts=50

  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78

  autocmd FileType c,cpp,esqlc  set formatoptions=croql comments=sr:/*,mb:*,el:*/,:// tabstop=8 shiftwidth=2 softtabstop=2 foldenable foldmethod=indent foldcolumn=3 foldlevel=100 number

  let g:user_emmet_install_global = 0
  let g:user_emmet_settings = {
\   'vue' : {
\     'extends' : 'html'
\   }
\ }
  autocmd FileType html,css,vue EmmetInstall

  augroup END
endif " has("autocmd")

call pathogen#infect()

colorscheme tender

let g:ale_linter_aliases={ 'vue': 'html' }
let g:ale_linters={ 'html': ['htmlhint'], 'javascript': ['standard'], 'javascript.jsx': ['standard'] }
let g:ale_sign_column_always=1

let g:airline_theme='murmur'

let g:snipMate={}
let g:snipMate.scope_aliases={}
let g:snipMate.scope_aliases['vue'] = 'html,javascript'
let g:snipMate.snippet_version = 1

set autochdir
