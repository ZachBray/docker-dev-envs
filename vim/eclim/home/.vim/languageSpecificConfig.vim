let g:EclimCompletionMethod = 'omnifunc'
" let g:EclimLoggingDisabled = 1
" let g:EclimLogLevel = 'error'

set tabstop=4
set shiftwidth=4

autocmd FileType java nmap <buffer> <Leader>i :JavaImportOrganize<cr>
autocmd FileType java nmap <buffer> <Leader>f :%JavaFormat<cr>
autocmd FileType java nmap <buffer> <Leader>u :RefactorUndo<cr>
autocmd FileType java nmap <buffer> <Leader>d :JavaDocSearch -x declarations<cr>
autocmd FileType java nmap <buffer> <C-]> :JavaSearchContext<cr>
autocmd FileType java nmap <buffer> <Leader>I :JavaImpl<cr>
autocmd FileType java nmap <buffer> <Leader>D :JavaDelegate<cr>
autocmd FileType java nmap <buffer> <Leader>C :JavaCorrect<cr>

autocmd FileType java nmap <buffer> <Leader>e :JavaRename<Space>
autocmd FileType java nmap <buffer> <Leader>m :JavaMove<Space>
autocmd FileType java nmap <buffer> <Leader>n :JavaNew<Space>

autocmd FileType java vmap <buffer> <Leader>c :JavaConstructor<cr>
autocmd FileType java vmap <buffer> <Leader>g :JavaGet<cr>
autocmd FileType java vmap <buffer> <Leader>s :JavaSet<cr>

autocmd FileType scala nmap <buffer> <C-]> :ScalaSearch<cr>
autocmd FileType scala nmap <buffer> <Leader>i :ScalaImport<cr>:SortScalaImports<cr>
