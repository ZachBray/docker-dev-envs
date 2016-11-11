" VUNDLE SETUP
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" VUNDLE
Plugin 'VundleVim/Vundle.vim'

" LANGUAGE INDEPENDENT PLUGINS
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'nelstrom/vim-qargs'
Plugin 'qstrahl/vim-matchmaker'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'raimondi/delimitmate'

" LANGUAGE SPECIFIC PLUGINS
source $HOME/.vim/languageSpecificPlugins.vim

call vundle#end()
