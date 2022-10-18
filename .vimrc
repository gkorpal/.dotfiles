set nocompatible                    " get rid of Vi compatibility mode. 
filetype plugin indent on           " filetype detection[ON] plugin[ON] auto-indent[ON] depending on filetype
set t_Co=256                        " enable 256-color mode.
syntax enable                       " enable syntax highlighting (can also use syntax on).
"colorscheme morning                " I am using it with solarized (dark) color pallet in xfce4-terminal.
set hidden                          " allows you to re-use the same window without saving it first and keep an 
                                    " undo history for all the files using the same window.
set number                          " show line numbers to the left
set ruler                           " Always show cursor position.
set laststatus=2                    " always display the status line so that you can see the current mode, file
                                    " name, file status, ruler, etc. 
filetype indent on                  " activates indenting for files
set hlsearch                        " highlight searched phrases.
set ignorecase                      " Make searches case-insensitive.
set smartcase                       " Make search case-sesitive when using capital letters
set autoindent                      " When opening a new line and no filetype-specific indenting is enabled, keep 
                                    " the same indent as the line you're currently on.
set backspace=indent,eol,start      " Allow backspacing over autoindent, line breaks and start of insert action
set tabstop=8                       " sets tab stops to 8 characters wide
set softtabstop=4
set shiftwidth=4                    " width of autointents set to 4 spaces
set expandtab                       " converts tabs to white space
set mouse=a                         " Enable use of the mouse for all modes
set wrap linebreak nolist           " Soft wrapping text. To move the cursor up and down within wrapped line use
                                    " the commands gk and gj.
call plug#begin('~/.vim/plugged')   " Specify the directory ~/.vim/plugged for plugins. Avoid using standard Vim
                                    " directory names like ~/.vim/plugin
Plug 'lervag/vimtex'        
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'petRUShka/vim-sage'
call plug#end()                     " To update &runtimepath and initialize plugin system
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_automatic=0
let g:vimtex_compiler_latexmk= {'options' : ['-pdf', '--shell-escape', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode',],}
"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR> 
"once you press <F9> in normal mode, it first saves your file and then run the file with python.
"autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR> 
"once you press <F9> in insert mode, it first leaves insert mode, then saves the file and then run the file with python.
map <F2> :w<CR>:!magma %<CR>
"once you press <F2> in normal mode, it first saves your file and then run the file with magma.
imap <F2> <Esc>:w<CR>:!magma %<CR>
"once you press <F2> in insert mode, it first leaves insert mode, then saves the file and then run the file with magma.
