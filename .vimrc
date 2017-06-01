" ----- Automatically source .vimrc when changed -----
autocmd BufWritePost $MYVIMRC source $MYVIMRC


" ----- plug-vim start -----
call plug#begin('~/.vim/plugged')

Plug 'leafgarland/typescript-vim'     " typescript syntax highlight
Plug 'kien/ctrlp.vim'                 " Fuzzy file, buffer, mru, tag, etc finder
Plug 'rking/ag.vim'                   " Vim plugin for the_silver_searcher
Plug 'mhinz/vim-signify'              " Signify uses the sign column to indicate C/U/D lines in a version-controlled file
Plug 'vim-airline/vim-airline'        " Lean status bar
Plug 'vim-airline/vim-airline-themes' " Lean status bar themes
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()
" ----- plug-vim end -----


" https://dougblack.io/words/a-good-vimrc.html
" ----- UI Config -----
set number              " show line numbers
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set colorcolumn=100     " set a marker for 100th column
filetype indent on      " load filetype-specific indent files
" set ruler               " show line & column of the cursor at status bar


" ----- Searching -----
set hlsearch            " highlight matches


" ----- Color Scheme -----
colorscheme hybrid      " awesome colorscheme
syntax enable           " enable syntax processing


" ----- Tab & Space -----
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces


" ----- CtrlP -----
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'    " excluded paths
let g:ctrlp_by_filename = 1                                  " file search by default


" ----- NERDTree -----
nnoremap <C-e> :NERDTreeToggle<CR>


" ----- Airline -----
let g:airline#extensions#tabline#enabled = 0    " disable smart tabline
let g:airline_theme='molokai'                   " airline theme
set laststatus=2                                " enable airline


" ----- Self-defined functions -----
fun! TrimSpace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
