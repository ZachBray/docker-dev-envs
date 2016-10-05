let g:EclimCompletionMethod = 'omnifunc'
let g:EclimLoggingDisabled = 1

autocmd FileType java nmap <buffer> <Leader>i :JavaImport<cr>
autocmd FileType java nmap <buffer> <Leader>f :%JavaFormat<cr>
autocmd FileType java nmap <buffer> <Leader>u :RefactorUndo<cr>
autocmd FileType java nmap <buffer> <Leader>I :JavaImportOrganize<cr>
autocmd FileType java nmap <buffer> <Leader>d :JavaDocSearch -x declarations<cr>
autocmd FileType java nmap <buffer> <C-]> :JavaSearchContext<cr>

autocmd FileType java nmap <buffer> <Leader>e :JavaRename<Space>
autocmd FileType java nmap <buffer> <Leader>m :JavaMove<Space>
autocmd FileType java nmap <buffer> <Leader>n :JavaNew<Space>
