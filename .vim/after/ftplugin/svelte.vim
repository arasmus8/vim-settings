setlocal sw=2
setlocal sts=2
setlocal ts=8
setlocal expandtab
setlocal iskeyword+=-
let g:user_emmet_settings = {
      \  'svelte' : {
      \    'extends' : 'html'
      \  }
      \}
EmmetInstall
"let g:ale_linters = { 'vue': ['jls'] }
