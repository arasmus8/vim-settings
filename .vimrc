filetype plugin on

set backspace=start
set autoindent
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set showmatch
set smartcase
set ignorecase

set cryptmethod=blowfish2 "use stronger encryption method

"indentation
set softtabstop=2
set shiftwidth=2
set expandtab

"abbreviations (like fixing common typos)
iabbrev anem name

set define=^\s*#\s*define
set textwidth=100
set linebreak
set breakat+=#()
set nobackup writebackup
set makeef=errs##

set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
set ttymouse=xterm2
set nohlsearch
set incsearch
set nowrap
if !exists('g:syntax_on')
  syntax enable
endif
"set lines=50 columns=120

let mapleader=" "
nnoremap <leader><TAB> :tabnext<CR>
nnoremap <leader><leader><TAB> :tabprevious<CR>
nnoremap <leader>= mf{=}`f
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>lt :ALEToggle<cr>
"inoremap <C-@> <C-X><C-F>
nnoremap <leader>at vat<ESC>
nnoremap <leader>dg ]c:diffget<CR>
nnoremap <leader>dp ]c:diffput<CR>

" Function to rename parameter under cursor
function! Rename_Function_Parameter() abort
  execute 'normal! mc'
  let varname = expand("<cword>")
  execute 'normal! {ma}mb'
  let replacement = input("Refactor " . varname . " to: ")
  execute '''a,''bs/\<' . varname . '\>/' . replacement . '/g'
  execute 'normal! `c'
endfunction
nnoremap <leader>rp :call Rename_Function_Parameter()<cr>

" Function to refactor a key throughout a file
function! Rename_Variable() abort
  execute 'normal! mc'
  let varname = expand("<cword>")
  let replacement = input("Refactor " . varname . " to: ")
  execute '1,$s/\<' . varname . '\>/' . replacement . '/g'
  execute 'normal! `c'
endfunction
nnoremap <leader>rv :call Rename_Variable()<cr>

" Function to switch beween camel, kebob, and snake case
function! Switch_Identifier_Case(ident, case) abort
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
function! Change_Case(case) abort
  execute 'normal! mc'
  let varname = expand("<cword>")
  let replacement = Switch_Identifier_Case(varname, a:case)
  execute 'normal! ciw' . replacement
  execute 'normal! `c'
endfunction
nnoremap <leader>cc :call Change_Case("camel")<cr>
nnoremap <leader>ck :call Change_Case("kebob")<cr>
nnoremap <leader>cs :call Change_Case("snake")<cr>

function! Moustache_Tag_Contents() abort
  execute 'normal! mc'
  execute 'normal! "ddit'
  execute 'normal! i{{d}}'
  execute 'normal! `c'
endfunction
nnoremap <leader>mm :call Moustache_Tag_Contents()<cr>

function! MarkdownToHtml(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@
  let it_motion = 0

  if a:0  " Invoked from Visual mode, use gv command.
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
    " the 'it' motion includes the > from the starting tag, strip it off if present
    if strpart(@@, 0, 1) == '>'
      let it_motion = 1
      let @@ = strpart(@@, 1)
    endif
  endif

  let lines = map(split(@@, '\n', 1), {k, v -> trim(v)})

  let tmp = tempname()

  call writefile(lines, "/tmp/md_test.md")
  call writefile(lines, tmp)

  silent let html = system("pandoc -f markdown_github -t html5 " . tmp)

  "call writefile(html, "/tmp/md_converted.html")

  call delete(tmp)

  let reg_save2 = @m
  let @m = html
  if a:0  " Invoked from Visual mode, use gv command.
    silent exe 'normal! gvsm'
    silent exe 'normal! gv='
  elseif a:type == 'line'
    silent exe "normal! '[V']sm"
    silent exe "normal! '[V']="
  else
    if it_motion
      silent exe 'normal! `[ v`]sm'
      silent exe 'normal! `[ v`]='
    else
      silent exe 'normal! `[v`]sm'
      silent exe 'normal! `[v`]='
    endif
  endif

  let &selection = sel_save
  let @@ = reg_save
  let @m = reg_save2
endfunction
nnoremap <silent> <leader>md :set opfunc=MarkdownToHtml<CR>g@
vnoremap <silent> <leader>md :<C-U>call MarkdownToHtml(visualmode(), 1)<CR>

set pastetoggle=<C-P>
nnoremap <PageUp> <C-W>k<C-W>_
nnoremap <PageDown> <C-W>j<C-W>_
" Home and End for v-split
nnoremap <Home> <C-W>h<C-W>|
nnoremap <End> <C-W>l<C-W>|
nnoremap <Up> <C-Y>
nnoremap <Down> <C-E>
inoremap <Up> <C-X><C-Y>
inoremap <Down> <C-X><C-E>
nnoremap <Left> 10zh
nnoremap <Right> 10zl

let NERDTreeDirArrows=0
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1

nnoremap Q gq

" Make p in Visual mode replace the selected text with the "" register.
" This is messing with snippets
" vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" filetype plugin indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  augroup global

  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78

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

colorscheme PaperColor

let g:ale_linter_aliases={ 'vue': 'html' }
let g:ale_linters={ 'html': ['htmlhint'], 'javascript': ['standard'], 'javascript.jsx': ['standard'] }
let g:ale_sign_column_always=1
let g:ale_fixers = {
\   'javascript': [
\       'standard',
\       'remove_trailing_lines'
\   ],
\}


let g:airline_theme='papercolor'

let g:snipMate={}
let g:snipMate.scope_aliases={}
let g:snipMate.scope_aliases['vue'] = 'html,javascript'
let g:snipMate.snippet_version = 1

set autochdir
