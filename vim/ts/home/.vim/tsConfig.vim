let g:tsuquyomi_single_quote_import = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:ycm_semantic_triggers =  {
  \   'ts,tsx,typescript' : ['.'],
  \ }

autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
autocmd FileType typescript nmap <buffer> <Leader>i <Plug>(TsuquyomiImport)
autocmd FileType typescript nmap <buffer> <Leader>i <Plug>(TsuquyomiImport)
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
