set nocompatible " be iMproved, required

filetype off

" Setup
call plug#begin('~/.vim/plugged')


" Plugs to install
" General
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'benekastah/neomake'
Plug 'terryma/vim-multiple-cursors'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

" Formating
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'


" Themes
Plug 'vim-scripts/wombat256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'


" Scala
Plug 'derekwyatt/vim-scala'


" Javascript
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'ahayman/vim-nodejs-complete', {'for': 'javascript'}
Plug 'ternjs/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}


" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'mattreduce/vim-mix'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'slashmili/alchemist.vim'

" completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Shougo/deoplete.nvim'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Bash
Plug 'vim-scripts/bash-support.vim'


call plug#end()


filetype plugin indent on


" neovim terminal esc
:tnoremap <leader><Esc> <C-\><C-n>

" dont load ymc
let g:loaded_youcompleteme = 1


" General
set history=100              " store 100 lines of history

"NeoVim handles ESC keys as alt+key, set this to solve the problem
  set timeout
  set timeoutlen=750
  set ttimeoutlen=250
  if has('nvim')
     set ttimeout
     set ttimeoutlen=0
  endif


" User Interface

" set esc to jj
inoremap jj <Esc>

set showmode                 " display the current mode
set ruler                    " always show current position
set scrolloff=7              " set scroll offset to 7 lines above/below cursor
set autoread                 " auto read when file is changed from outside
set nu                       " display line numbers
set clipboard=unnamed        " yank to the system register (*) by default
set hid                      " hide abandon buffers in order to not lose undo history
set showmatch                " cursor shows matching ) and }
set incsearch                " incremental search
set ignorecase               " ignore case when searching
set smartcase                " ignore case if search pattern is all lowercase, case-sensitive otherwise
set wildchar=<TAB>           " start wild expansion in the command line using <TAB>
set wildmenu                 " wild char completion menu
set relativenumber           " set relative numbers
set mouse=a                  " set mouse scroll


" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc


" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,b,s,h,l,[,]


filetype on                  " enable filetype detection
filetype indent on           " enable filetype-specific indenting
filetype plugin on           " enable filetype-specific plugins


" disable annoying sound on errors
set noerrorbells
set novisualbell
set tm=500


" Formatting
set autoindent               " auto indentation
set copyindent               " copy the previous indentation on autoindenting
set smarttab                 " insert tabs on line start according to context
set expandtab                " replace <TAB> with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd FileType Makefile set noexpandtab
autocmd FileType jade set tabstop=2|set softtabstop=2|set shiftwidth=2
autocmd FileType yaml set tabstop=2|set softtabstop=2|set shiftwidth=2
set clipboard=unnamed


" Colors and Fonts
syntax on
set hlsearch
set background=dark          " set background dark
colorscheme wombat256mod


" Formatting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>         " toggle paste mode
set ffs=unix,dos,mac         " use unix as standard file format


" vimtip#80 restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" vim-airline
" let g:airline_powerline_fonts = 1


" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['flake8']


" FZF
set rtp+=~/.fzf
nnoremap <leader>l :call fzf#run({'sink': 'e', 'window': 'enew'})<CR>


" Shortcuts
" disable arrow keys and force hjkl
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" move around splits
map <C-J> <C-W>j<C-W>_       " move to and maximize the below split
map <C-K> <C-W>k<C-W>_       " move to and maximize the above split
nmap <c-h> <c-w>h<c-w><bar>  " move to and maximize the left split
nmap <c-l> <c-w>l<c-w><bar>  " move to and maximize the right split
set wmw=0                    " set the min width of a window to 0 so we can maximize others
set wmh=0                    " set the min height of a window to 0 so we can maximize others

map <S-H> gT                 " go to prev tab
map <S-L> gt                 " go to next tab
map <C-t><C-t> :tabnew<CR>      " new tab
map <C-t><C-w> :tabclose<CR>    " close tab
" nmap <leader>/ :nohl<CR>        " ,/ turns off search highlighting

" bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" enable function folding
set foldmethod=syntax
set foldlevelstart=10
set directory=~/.vim_swap


autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd StdinReadPre * let s:std_in=1


set completeopt-=preview
let g:go_disable_autoinstall = 0
let g:neocomplete#enable_at_startup = 1
set nopaste


" Snippets are separated from the engine. Add this if you want them:
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)


" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"


" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

" ymc
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'


" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" deoplete.nvim
let g:deoplete#enable_at_startup = 0
let g:deoplete#enable_ignore_case = 1
inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" :
\ deoplete#mappings#manual_complete()


" alchemist
let g:alchemist_tag_disable = 1
let g:alchemist_tag_map = '<C-]>'
let g:alchemist_tag_stack_map = '<C-T>'

" ctags tags
" set tags=~/.nvim_ctags

" indentLine
let g:indentLine_enabled = 0

" vim-indent-guides
" vim ensime



" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
nmap <leader>? :GGrep <CR>
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"   * Preview script requires Ruby
"   * Install Highlight or CodeRay to enable syntax highlighting
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
nmap <leader>/ :Ag <CR>
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

