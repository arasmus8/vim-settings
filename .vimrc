set nocompatible
filetype plugin on

set mouse+=a
set ttymouse=xterm2
set smartcase ignorecase
set incsearch
set cryptmethod=blowfish2 "use stronger encryption method
set pastetoggle=<C-P>
set autochdir 

"indentation
set softtabstop=2
set shiftwidth=2
set expandtab

"abbreviations (like fixing common typos)
iabbrev anem name
iabbrev churchname The Curch of Jesus Christ of Latter-day Saints

"line numbers
set number
set relativenumber

let mapleader = ' '

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

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"  You will load your plugin here
"  Make sure you use single quotes
" Initialize plugin system

" Utils
Plug 'scrooloose/nerdtree'

" General Coding
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/splitjoin.vim'

" Language specific
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'iloginow/vim-stylus'
Plug 'evanleck/vim-svelte'

" Visual Config
Plug 'NLKNguyen/papercolor-theme'
Plug 'nightsense/snow'
Plug 'itchyny/lightline.vim'

" Snippets
Plug 'drmingdrmer/xptemplate'

call plug#end()

" netrw config
" absolute width of netrw window
let g:netrw_winsize = -28
" tree-view
let g:netrw_liststyle = 3
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" open file in a new tab
let g:netrw_browse_split = 3

" Emmett config
let g:user_emmet_install_global = 0

" Ale config
let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_sign_column_always=1

" Lightline config
let g:lightline = {
      \ 'colorscheme': 'snow_light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified'] ],
      \ },
      \ }     "vim-lightline
set laststatus=2                                       "vim-lightline
set noshowmode                                         "vim-lightline

" XPTemplate config
set runtimepath+=~/snippets/
let g:xptemplate_lib_filter = '/snippets/'

"color scheme
set background=light
colorscheme snow
" override matching paren coloring
hi MatchParen term=underline ctermfg=178 ctermbg=bg cterm=underline guifg=#434951 guibg=#b0b8c0

"key mappings
nnoremap <leader><TAB> :tabnext<CR>
nnoremap <leader><leader><TAB> :tabprevious<CR>
nnoremap <leader>= mf{=}`f
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>lt :ALEToggle<cr>
nnoremap <leader>dg ]c:diffget<CR>
nnoremap <leader>dp ]c:diffput<CR>
nnoremap <leader>t: :Tabularize /:\zs<CR>
vnoremap <leader>t: :Tabularize /:\zs<CR>
nnoremap <leader>t<Bar> :Tabularize /<Bar><CR>
vnoremap <leader>t<Bar> :Tabularize /<Bar><CR>
nnoremap <leader>t= :Tabularize /=<CR>
vnoremap <leader>t= :Tabularize /=<CR>

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

