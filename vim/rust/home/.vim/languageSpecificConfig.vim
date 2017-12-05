let g:syntastic_rust_rustc_exe = 'cargo check --all-targets'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']
let g:rustfmt_autosave=1
let delimitMate_quotes = "\""
let g:ycm_cache_omnifunc = 0
let g:ycm_semantic_triggers = {
\   'rust': ['.', '::']
\ }

autocmd FileType rust nnoremap <C-]> :YcmCompleter GoTo<CR>
