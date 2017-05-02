" set the runtime path to include Vundle and initialize
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/csapprox'
Plugin 'majutsushi/tagbar'
Plugin 'tobyS/pdv'
call vundle#end()

:set t_Co=256

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" see http://dougblack.io/words/a-good-vimrc.html
" colorscheme lucius
set background=dark
colorscheme desert
hi Nomal ctermbg=black

syntax enable           " enable syntax processing
set autoindent          " adds a newline with the same indentation
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " on pressing tab, insert 4 spaces
set expandtab           " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set nowrap
set ignorecase          "for search

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" CtrlP settings
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_max_files=0 
let g:ctrlp_max_depth=40

" allows cursor change in tmux mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" ctags, see https://github.com/shawncplus/phpcomplete.vim
set autochdir
set tags+=~/tags/mcepd.tags
autocmd BufWritePost *
      \ if filereadable('/home/vagrant/tags/mcepd.tags') |
      \   call system('phpctags --append=yes --recurse=yes '.expand('%')) |
      \ endif
let g:phpcomplete_parse_docblock_comments=1

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '<'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Pull the latest and reload the file
map <S-p> :!git pull <bar> edit!

" TagBar
nmap <F8> :TagbarToggle<CR>

" Auto-reloading a file in VIM as soon as it changes on disk
set autoread

" Autoformat XML
au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
