set encoding=utf-8
autocmd! bufwritepost .vimrc source %


" ===========================
"    Packages : Vundle Setup
" ===========================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Other vundles
" -------------
" Readability
Plugin 'godlygeek/tabular'                 " Alginment: improves readability
Plugin 'nathanaelkane/vim-indent-guides'   " Indent guides: helpful for python
Plugin 'altercation/vim-colors-solarized'  " for color scheme
Plugin 'Lokaltog/vim-powerline'            " for Powerline
Plugin 'randymorris/vim-bufstat'           " Persistent Buffer

Plugin 'ervandew/supertab'                 " For autocomplete
Plugin 'scrooloose/syntastic'              " for syntax checking
Plugin 'majutsushi/tagbar'                 " source code browser

Plugin 'SirVer/ultisnips'                  " Snippets 
Plugin 'honza/vim-snippets'                " Snippets collection

Plugin 'kien/ctrlp.vim'                    " Fuzzy Buffer search
Plugin 'scrooloose/nerdtree'               " Tree view
Plugin 'jistr/vim-nerdtree-tabs'           " Persistent across tabs

Plugin 'scrooloose/nerdcommenter'          " for commenting

Plugin 'tpope/vim-fugitive'                " for git

" **Python Specific**
" Python syntax check: pip install flake8
Plugin 'davidhalter/jedi-vim'              " Autocomplete and goto
Plugin 'hynek/vim-python-pep8-indent'      " Python indent

Plugin 'Tex-9'                             " Latex

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ------------------------------------------------------------------------

" General options
" ===============
syntax on

set modeline
set nobackup
set nowritebackup
set noswapfile

set nu
set ruler

set smartcase
set incsearch
set hlsearch

set smartindent
set autoindent

set mouse=a
set clipboard=unnamedplus

" Movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" resize windows
"map + <c-w>+
"map - <c-w>-
"map < <c-w><
"map > <c-w>>

map <f6> <c-w>w

" Selections
map <Leader>a ggVG  " select all

" Formatting specifications
" ===============================
set nowrap " don't automatically wrap on load
set tw=79  " width of document (used by gd)
set fo-=t  " don't automatically wrap text when typing
set expandtab
set shiftwidth=4
set tabstop=4

" show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
map <Leader>x :%s/\s\+$

" Color scheme
set t_Co=256
hi Search ctermbg=10
hi SpellBad ctermbg=red
set colorcolumn=80
highlight ColorColumn cterm=NONE ctermbg=0 ctermfg=5


let mapleader = "," " rebind <leader> key

" Markdown using inbuilt vim markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Other Misc.
set hidden                            " buffer control
set nostartofline                     " Avoid moving cursor to BOL when jumping around
set virtualedit=block                 " Let cursor move past the last char in <C-v> mode
set scrolloff=3                       " Keep 3 context lines above and below the cursor
set omnifunc=syntaxcomplete#Complete  " Using omnifunc to search
autocmd BufEnter * silent! lcd %:p:h  " Vim always in the directory of the buffer
set nofoldenable
set foldmethod=syntax
" --------------------------------------------------------------------------

" ================================================
"          Configurations for Vundle Modules
" ================================================

" Solarizer : color configuration
set background=dark
colorscheme solarized

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_quiet_messages = {'level': 'warnings'}

" Supertab
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" NERDcommenter
let g:NERDSpaceDelims=1

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<s-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-k>"

" Vim Indent guide: <leader>ig
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1



" NerdTreeTabs
map <C-t> :NERDTreeTabsToggle<CR>

" NerdTreeTabs
nmap <leader>tg :TagbarToggle<CR>

" Python
" Jedi vim specific
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization = 1
let g:jedi#show_call_signature = 0
au FileType python setl completeopt-=preview
" Other python commands
map <Leader>b Oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>
au FileType python setl foldmethod=indent   " setting custom fold method for python


" Tex9 Latex Mode
let g:tex_fold_enabled = 1
let g:tex_comment_nospell = 1
let g:tex_flavor = "pdflatex --shell-escape"
au FileType tex setl tw=0

" Powerline 
set laststatus=2

" Fixing my arrow keys
noremap <Up> k
noremap <Down> j 
noremap <Left> h
noremap <Right> l 
" ==============================================================
"         Recipes lifted from pabulter@vt.edu
" ==============================================================
" chaining supertab with ommnifunc
"autocmd FileType *
"\ if &omnifunc != '' |
"\   call SuperTabChain(&omnifunc, "<c-p>") |
"\   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"\ endif
