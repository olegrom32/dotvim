execute pathogen#infect()

let mapleader=","           "Changes Leader key into a comma instead of a backslash
set nocompatible            "Prefents VIM from being nerfed into acting like VI
set viminfo='100,\"1000,:20,%,n~/.viminfo
set history=500

set cursorline

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

" Filetype specific config
au FileType php match ErrorMsg '\%>120v.\+'
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType ruby match ErrorMsg '\%>80v.\+'
au BufNewFile,BufReadPost *.tpl set filetype=html
au FileType ruby,yaml,coffee set tabstop=2 shiftwidth=2 softtabstop=2

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

nnoremap Q <nop>
set nostartofline

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
nmap <Leader>q :Bclose<CR>

" Airline
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
set laststatus=2

" Bufferline
let g:bufferline_echo=0
let g:bufferline_show_bufnr=1

" Command-T
map <Leader>n :CommandT<CR>
map <Leader>z :CommandTFlush<CR>

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
autocmd BufReadPost fugitive://* set bufhidden=delete

" NERD Tree
map <Leader>l :NERDTreeTabsToggle<CR>
map <Leader>f :NERDTreeTabsFind<CR>

" JSHint
let JSHintUpdateWriteOnly=1

" PDV
let g:pdv_template_dir = $HOME ."/.vim/UltiSnips"
map <Leader>a :call pdv#DocumentWithSnip()<CR>

" Syntastic
let g:syntastic_php_phpcs_args = "--standard=PSR2"
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" Taglist
map <Leader>t :TlistToggle<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Vdebug
let g:vdebug_options={}
let g:vdebug_options['port']=9001
let g:vdebug_options['break_on_open']=0

" Getter/setter
map <Leader>s <Plug>PhpgetsetInsertGetterSetter

let g:phpgetset_getterTemplate =
    \ "\n" .
    \ "    /**\n" .
    \ "     * Get %varname%.\n" .
    \ "     *\n" .
    \ "     * @return mixed\n" .
    \ "     */\n" .
    \ "    public function %funcname%()\n" .
    \ "    {\n" .
    \ "        return $this->%varname%;\n" .
    \ "    }"
let g:phpgetset_setterTemplate =
    \ "\n" .
    \ "    /**\n" .
    \ "     * Set %varname%.\n" .
    \ "     *\n" .
    \ "     * @param mixed $%varname%\n" .
    \ "     */\n" .
    \ "    public function %funcname%($%varname%)\n" .
    \ "    {\n" .
    \ "        $this->%varname% = $%varname%;\n" .
    \ "    }"

" YCM
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Colors
set t_Co=256
set background=dark
let g:solarized_contrast="high"
"let g:solarized_visibility="high"
colorscheme solarized

" Set title
autocmd BufEnter * let &titlestring = expand("%:t")
let &titleold = hostname() . ':' . getcwd()
if &term == "screen"
    set t_ts=^[k
    set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
    set title
endif

if filereadable(expand('~/.vim/.vim_module'))
    source ~/.vim/.vim_module
endif
