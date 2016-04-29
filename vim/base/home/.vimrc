source $HOME/.vim/plugins.vim

" ENABLE FILETYPE DETECTION
syntax on
filetype on
filetype plugin on

" THEME CONFIGURATION
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" KEY MAPS
imap ii <Esc>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

" VARIOUS CONFIGURATION
set number
set statusline+=%#warningmsg#
set statusline+=%{Status.SyntasticStatuslineFlag()}
set statusline+=%*
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set encoding=utf-8
set bs=2
set omnifunc=syntaxcomplete#Complete

" CONSTANTS FOR PLUGINS
let g:agprg="ag --column"
let g:syntastic_enable_signs=0
let g:syntastic_echo_current_error=0
let g:syntastic_always_populate_loc_list=0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:matchmaker_enable_startup = 1

source $HOME/.vim/languageSpecificConfig.vim
