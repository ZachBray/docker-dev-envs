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
nmap <C-i> <Plug>lnext
nmap <C-u> <Plug>lprev

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
set timeoutlen=1000 ttimeoutlen=0
set grepprg=ag\ --nogroup\ --nocolor

" CONSTANTS FOR PLUGINS
let g:ackprg = 'ag --vimgrep'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:matchmaker_enable_startup = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Nul>', '<C-j>', '<C-l>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-k>', '<C-h>', '<Up>']
let g:BASH_Ctrl_j = 'off'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" PLUGIN COMMANDS
highlight SyntasticError guibg=#2f0000
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

source $HOME/.vim/languageSpecificConfig.vim
source $HOME/.vim/cursorFix.vim
