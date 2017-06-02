" ----- Automatically source .vimrc when changed -----
autocmd BufWritePost $MYVIMRC source $MYVIMRC


" ----- plug-vim start -----
call plug#begin('~/.vim/plugged')

Plug 'leafgarland/typescript-vim'     " typescript syntax highlight
Plug 'kien/ctrlp.vim'                 " fuzzy file, buffer, mru, tag, etc finder
Plug 'rking/ag.vim'                   " vim plugin for the_silver_searcher
Plug 'mhinz/vim-signify'              " signify uses the sign column to indicate C/U/D lines in a version-controlled file
Plug 'vim-airline/vim-airline'        " lean status bar
Plug 'vim-airline/vim-airline-themes' " lean status bar themes
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


" ----- Tab & Space & Shift-----
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set shiftwidth=4        " number of spaces for block shifting


" ----- CtrlP -----
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'    " excluded paths
let g:ctrlp_by_filename = 1                                  " file search by default
let g:ctrlp_show_hidden = 1                                  " show hidden files by default


" ----- NERDTree -----
nnoremap <C-e> :NERDTreeToggle<CR>              " Ctrl + E to toggle NerdTree
let NERDTreeShowHidden=1                        " show hidden files by default
let g:NERDTreeWinSize=50                        " set the width for the navigation panel


" ----- Airline -----
let g:airline#extensions#tabline#enabled = 0    " disable smart tabline
let g:airline_theme='molokai'                   " airline theme
set laststatus=2                                " enable airline
set ttimeoutlen=10                              " set timeout when leaving the insert mode


" ----- Self-defined Key Re-maping -----
noremap <c-j> o<esc>                            " Ctrl + J to insert blank line below
noremap <c-k> O<esc>                            " Ctrl + K to insert blank line above


" ----- Self-defined functions -----
" :TrimSpace
fun! TrimSpace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
command! -nargs=* TrimSpace call TrimSpace()

" Ntws <size>
fun! NerdTreeWinSize( arg )
    let g:NERDTreeWinSize=a:arg
endfun
command! -nargs=* Ntws call NerdTreeWinSize( '<args>' ) | NERDTree
