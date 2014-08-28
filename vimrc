set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'godlygeek/tabular'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'flazz/vim-colorschemes'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'osyo-manga/vim-over'
Plugin 'tpope/vim-abolish'
Plugin 'mbbill/undotree'

call vundle#end()
filetype plugin indent on

set mouse=a

set shiftwidth=2
set expandtab
set softtabstop=2

set textwidth=80
set colorcolumn=+1

set number

set noswapfile

if isdirectory(expand("$HOME/.vim/bundle/vim-colorschemes"))
  colorscheme obsidian
endif

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Map plugins
let mapleader=","
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>t :TagbarToggle<CR>
map <Leader>l :set nu! nornu<CR>
map <Leader>rl :set nonu rnu!<CR>

" Indent lines
vnoremap > >gv
vnoremap < <gv

" Move lines up/down
vnoremap <S-Up> :m '<-2<CR>gv
vnoremap <S-Down> :m '>+1<CR>gv

if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif
