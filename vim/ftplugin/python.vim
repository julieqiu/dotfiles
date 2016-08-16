set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<g-d>"
let g:pymode_rope_lookup_project = 0

" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-h>"
let g:SimpylFold_fold_import = 0

call Flake8()
