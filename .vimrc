set encoding=utf-8
autocmd! bufwritepost .vimrc source %
call pathogen#infect()

filetype plugin on
filetype plugin indent on
syntax on


" general option
" ===============
let mapleader = "," " rebind <leader> key
set wildmode=list:longest " make tab behave like in a shell
set autoread " reload file when changes happen in other editors

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" make yank copy to the global system clipboard
set clipboard=unnamedplus

" enable mouse
set mouse=a


" select all
nnoremap <leader>a : ggvg <cr>

" Improving code completion
set completeopt=longest,menuone


" found here: http://stackoverflow.com/a/2170800/70778
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

set history=700
set undolevels=700


set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" disable formatting when pasting large chunks of code
set pastetoggle=<F2>

set hlsearch
set incsearch
set ignorecase
set smartcase

" shortcut key to disable highlighting
nnoremap <c-n> :nohl <cr>
inoremap <c-n> :nohl <cr>
vnoremap <c-n> :nohl <cr>

set nowrap " don't automatically wrap on load
set tw=79  " width of document (used by gd)
set fo-=t  " don't automatically wrap text when typing
set number " show line numbers


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap



" settings for commenting in python
" ==================================
" using nercommentor

" settings for python-mode
" =========================
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Settings for vim-powerline
" ===========================
set laststatus=2
" let g:Powerline_symbols = 'fancy'

" Settings for vim-markdown
" ==========================
set nofoldenable


" Settings for ctrlp
" ===================
let g:ctrlp_max_height = 30

" Movement
" =========
" bind Ctrl+<movement> keys to move around the windows, instead of using ctrl+w
" + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" resize windows
map + <c-w>+
map - <c-w>-
map < <c-w><
map > <c-w>>

map <f6> <c-w>w

map <leader>n <esc>:tabprevious<cr>
map <leader>m <esc>:tabnext<cr>
vnoremap <leader>s :sort<cr>

" custom mappings
" ================
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
map <Leader>a ggVG  " select all


" show trailing whitespace
" =========================
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
map <Leader>x :%s/\s\+$//

" Color scheme
" =============
set t_Co=256

set colorcolumn=80
highlight ColorColumn cterm=NONE ctermbg=0 ctermfg=5

set cursorcolumn
" keeping cursor column only for the current window
augroup CursorColumn
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorcolumn
augroup END
highlight CursorColumn cterm=None ctermbg=4 ctermfg=5

" General spell Check
" ====================
hi SpellBad cterm=underline ctermbg=6 ctermfg=2 gui=undercurl guisp=Red

" ==========
" TODO
" ==========
" 1. Spell check ( for python only strings and comments"
" 2. Language check
" 3. Latex mode


" ======================
" MISC IDE requirements"
" ======================
" File Structure View
map <C-t> :NERDTreeToggle<CR>
" Programming tags
map <C-v> :TagbarToggle<CR>

" Latex Mode
" ==========
set modeline
let g:tex_fold_enabled = 1
let g:tex_comment_nospell = 1
let g:tex_flavor = "pdflatex"
"compiler tex
