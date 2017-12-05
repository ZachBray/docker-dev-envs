let g:WMGraphviz_output = 'png'

augroup MarkdownSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

autocmd FileType markdown nnoremap <Leader>li :LivedownPreview<CR>
let g:livedown_browser = 'xdg-open'

set spell
