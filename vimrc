execute pathogen#infect()

let mapleader=","           "Changes Leader key into a comma instead of a backslash
set nocompatible            "Prefents VIM from being nerfed into acting like VI
set viminfo='100,\"1000,:20,%,n~/.viminfo
set history=500

au FileType php match ErrorMsg '\%>120v.\+'
au BufNewFile,BufReadPost *.tpl set filetype=html

"------  Visual Options  ------
syntax on                   "Enables syntax highlighting
set nu                      "Enable Line Numbers

"------  Behavior  ------
set tabstop=4               "tab = 4 spaces
set shiftwidth=4            "Indent to four spaces
set softtabstop=4
set hidden                  "Switch between unsaved buffers w/o needing to save, preserves history
filetype indent on          "Syntax Highlight
filetype plugin on          "Needed for snipMate
set autoindent              "Autoindent
set expandtab               "Use spaces instead of tabs
set noswapfile
set nobackup

" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>
" ,U = Deletes Unwanted empty lines
map <Leader>U :g/^$/d<CR>
" ,R = Converts tabs to spaces in document
map <Leader>R :retab<CR>
" ,p = Runs PHP lint checker on current file
map <Leader>p :! php -l %<CR>
" ,P = Runs PHP and executes the current file
map <Leader>P :! php -q %<CR>
" ,L = Toggle line numbers
map <Leader>L :set invnumber<CR>

map <Leader>n :CommandT<CR>

nmap ; :

" Tabularize
if exists(":Tabularize")
endif

"------  Searching  ------
set incsearch               "Search while typing
set ignorecase              "Case Insensitive Searching
set smartcase               "Lowercase = case insensitive, any uppercase = case sensitive
set hlsearch                "Highlight all search results

"------  Buffers  ------
" Ctrl Left & Right move between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>
" Closes the current buffer
nmap <Leader>q :bw<CR>

" Airline
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
set laststatus=2

" Bufferline
let g:bufferline_echo=0
let g:bufferline_show_bufnr=1

"------  Fugitive  ------
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove 
nnoremap <Leader>gp :Ggrep 
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git 
nnoremap <Leader>gd :Gdiff<CR>

" PDV
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
"nnoremap <buffer> <C-b> :call pdv#DocumentWithSnip()<CR>
map <Leader>a :call pdv#DocumentWithSnip()<CR>

" Taglist
map <Leader>t :TlistToggle<CR>

" Vdebug
let g:vdebug_options={}
let g:vdebug_options['port']=9001
let g:vdebug_options['break_on_open']=0

" Colors
set t_Co=256
set background=dark
let g:solarized_contrast="high"
"let g:solarized_visibility="high"
colorscheme solarized

