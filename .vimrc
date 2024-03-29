set encoding=utf-8
autocmd! bufwritepost .vimrc source %


" ===========================
"    Packages : Vundle Setup
" ===========================
set nocompatible
filetype off
         
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/custom/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Other vundles
" -------------
" Readability
Plugin 'godlygeek/tabular'                 " Alginment: improves readability
Plugin 'Yggdroot/indentLine.git'           " indentation

" for color scheme
Plugin 'altercation/vim-colors-solarized'  
Plugin 'joshdick/onedark.vim'
Plugin 'jnurmine/Zenburn'                  

" Plugin 'Lokaltog/vim-powerline'            " for Powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'randymorris/vim-bufstat'           " Persistent Buffer
Plugin 'salsifis/vim-transpose'            " Transpose

Plugin 'ervandew/supertab'                 " For autocomplete
Plugin 'scrooloose/syntastic'              " for syntax checking
Plugin 'majutsushi/tagbar'                 " source code browser

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Plugin 'SirVer/ultisnips'                  " Snippets 
Plugin 'honza/vim-snippets'                " Snippets collection

Plugin 'kien/ctrlp.vim'                    " Fuzzy Buffer search
Plugin 'scrooloose/nerdtree'               " Tree view
Plugin 'jistr/vim-nerdtree-tabs'           " Persistent across tabs

Plugin 'scrooloose/nerdcommenter'          " for commenting

Plugin 'tpope/vim-fugitive'                " for git

" **Python Specific**
" Python syntax check: pip install flake8
Plugin 'davidhalter/jedi-vim'              " Autocomplete and goto
Plugin 'tmhedberg/SimpylFold'                " Folding. Python. Tex.
Plugin 'indentpython'                        " Python Indent
" Plugin 'hynek/vim-python-pep8-indent'      " Python indent
Plugin 'goerz/jupytext.vim'                  " allow opening jupyter notebook in vim

" Plugin 'tukss/TeX-9'                       " Latex with python 3 support
" Plugin 'vim-scripts/Tex-9'                             " Latex
" Slimux
Plugin 'epeli/slimux'

" markdown
Plugin 'tpope/vim-markdown'               " syntax highlighting, including code blocks
Plugin 'nelstrom/vim-markdown-folding'    " for markdown folding

" vim autoreload
" Plugin 'djoshea/vim-autoread'
Plugin 'rhysd/vim-grammarous'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ------------------------------------------------------------------------

" General options
" ===============
syntax on

" Splitting below and to the right
set splitbelow
set splitright

set modeline
set nobackup
set nowritebackup
set noswapfile

set nu
set ruler

set ignorecase
set smartcase
set incsearch
set hlsearch

" set smartindent
set autoindent

set mouse=a
set clipboard=unnamed

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

let mapleader = "," " rebind <leader> key
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
" Solarizer : color configuration
if has('gui_running')
    colorscheme zenburn
else
    set background=dark
    " colorscheme solarized
    " colorscheme onedark
    colorscheme zenburn
endif
colorscheme zenburn
"
" colorscheme nord
set t_Co=256
hi Search ctermbg=white
hi visual term=reverse cterm=reverse guibg=grey40
hi CursorColumn term=reverse cterm=reverse guibg=grey10
hi SpellBad ctermbg=red ctermfg=015
set colorcolumn=80
highlight ColorColumn cterm=NONE ctermbg=0 ctermfg=5


" sql
au FileType sql setl tw=0 tabstop=2 shiftwidth=2

" Markdown using inbuilt vim markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au FileType markdown setl tw=0 tabstop=2 shiftwidth=2 
au FileType markdown setl wrap linebreak showbreak=++ 
au FileType markdown setl foldmethod=expr
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
" let g:markdown_fold_style = 'nested'  " comment to view all levels


" Other Misc.
set backspace=indent,eol,start        " make backspace more powerful
set hidden                            " buffer control
set nostartofline                     " Avoid moving cursor to BOL when jumping around
set virtualedit=block                 " Let cursor move past the last char in <C-v> mode
set scrolloff=3                       " Keep 3 context lines above and below the cursor
set omnifunc=syntaxcomplete#Complete  " Using omnifunc to search
" autocmd BufEnter * silent! lcd %:p:h  " Vim always in the directory of the buffer
set nofoldenable
set foldmethod=syntax
" --------------------------------------------------------------------------

" ================================================
"          Configurations for Vundle Modules
" ================================================


" indentation
" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
let g:indentLine_fileType = ['c', 'cpp', 'python']"

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
let g:UltiSnipsJumpForwardTrigger="<s-c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-k>"

" NerdTreeTabs
map <C-t> :NERDTreeTabsToggle<CR>

" NerdTreeTabs
nmap <leader>tg :TagbarToggle<CR>

" Python
" Syntastic specific
let python_highlight_all=1
" let g:syntastic_python_flake8_args='--ignore=E501,E111'  " ignoring 79 character error
let g:syntastic_python_flake8_args='--ignore=E501,E111,F401,E741,E265,E225,E251,E231,E261,E262,E241,E402,E252'  " + unused imports, ambiguous variable names, spaces after hash, spaces around ops
" Jedi vim specific
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization = 1
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 1
au FileType python setl completeopt-=preview
" Folding
let g:SimpylFold_docstring_preview = 1
" autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
" autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" Other python commands
map <Leader>b Oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>
" au FileType python setl foldmethod=indent   " setting custom fold method for python
autocmd BufNewFile,BufReadPost *.pyx set filetype=python
let g:ultisnips_python_style="numpy"

" jupyter
let g:jupytext_fmt = 'markdown'
autocmd BufNewFile,BufReadPost *.ipynb setfiletype python.markdown

" slimux
map <C-c><C-c> :SlimuxREPLSendLine<CR>
" vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
vnoremap <C-c><C-c> :<C-w>SlimuxShellRun %cpaste<CR>:'<,'>SlimuxREPLSendSelection<CR>:SlimuxShellRun --<CR>
" Tex9 Latex Mode
let maplocalleader = ";"
let g:tex_flavor="latex"
let g:tex_fold_enabled = 1
let g:tex_comment_nospell = 1
let g:tex_nine_config = {
        \'compiler': 'pdflatex',
        \'shell_escape': 1,
        \'viewer': {'app': 'evince', 'target': 'pdf'},
        \'synctex': 1
    \}
au FileType tex setl tw=0 shiftwidth=2 spell wrap linebreak nolist showbreak=++
" noremap <buffer><silent> <LocalLeader>s :call tex_nine#InsertSkeleton(b:tex_nine_skeleton.'.pdflatex')<CR>

" Powerline 
set laststatus=2
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tabs = 1
" Fixing my arrow keys
" noremap <Up> k
" noremap <Down> j 
" noremap <Left> h
" noremap <Right> l 
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

vnoremap j gj
vnoremap k gk
vnoremap 4 g$
vnoremap 6 g^
nnoremap j gj
nnoremap k gk
nnoremap 4 g$
nnoremap 6 g^
" ==============================================================
"         Recipes lifted from pabulter@vt.edu
" ==============================================================
" chaining supertab with ommnifunc
"autocmd FileType *
"\ if &omnifunc != '' |
"\   call SuperTabChain(&omnifunc, "<c-p>") |
"\   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"\ endif
py3 import os; sys.executable=os.path.join(sys.prefix, 'bin/python3')
