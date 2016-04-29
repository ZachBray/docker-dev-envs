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
Plugin 'rking/ag.vim'
Plugin 'nelstrom/vim-qargs'
Plugin 'qstrahl/vim-matchmaker'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" LANGUAGE SPECIFIC PLUGINS
source $HOME/.vim/languageSpecificPlugins.vim

call vundle#end()