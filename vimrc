set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/gitv'

Plugin 'tpope/vim-sensible'

" Explorer
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'

" Rails
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'

" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'
Plugin 'PotatoesMaster/i3-vim-syntax'

" Snippets
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'

" Refactoring
Plugin 'tpope/vim-abolish'
Plugin 'terryma/vim-multiple-cursors'

" Others
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'mbbill/undotree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'suan/vim-instant-markdown'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/scons.vim'

" Colors
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'flazz/vim-colorschemes'
Plugin 'osyo-manga/vim-over'

" Utility
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

call vundle#end()
filetype plugin indent on

set mouse=a
set shiftwidth=2
set expandtab
set softtabstop=2
set tabstop=2
set textwidth=80
set colorcolumn=+1
set hls
set number
set noswapfile
set lcs=tab:\ \ 
set list

if isdirectory(expand("$HOME/.vim/bundle/vim-colorschemes"))
  set background=dark
  colorscheme solarized
endif

let mapleader=","
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>t :TagbarToggle<CR>
map <Leader>l :set nu! nornu<CR>
map <Leader>rl :set nonu rnu!<CR>
nnoremap <F5> :UndotreeToggle<CR>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

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

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au BufNewFile,BufRead SCons*,SCsub set filetype=scons
