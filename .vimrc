" set mouse control with extended mouse mode
set mouse+=a
if &term =~ '^screen' " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" be iMproved, required
set nocompatible

" required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Start vundle plugin
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9' " Git plugin not hosted on GitHub

" File opener similar to textmate
" Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" NERDTree We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

" " I need mini buffers
Plugin 'fholgado/minibufexpl.vim'

" taglist for function names
Plugin 'vim-scripts/taglist.vim'

" we need cscope
" Plugin 'vim-scripts/cscope.vim'

" and cscope map
Plugin 'chazy/cscope_maps'

" we need cctree
Plugin 'vim-scripts/CCTree'
let g:CCTreeDisplayMode=1 " use compact mode
let g:CCTreeHiSymbol=1
let g:CCTreeUseUTF8Symbols=0
let g:CCTreeMinWidth=45

" " We need powerline
Plugin 'Lokaltog/vim-powerline'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" auto complete
Plugin 'vim-scripts/AutoComplPop'

" c++ auto complete
Plugin 'vim-scripts/OmniCppComplete'
set nocp

" switch between c/cpp and h files
Plugin 'vim-scripts/a.vim'

" coding plugin for c/c++
Plugin 'vim-scripts/c.vim'



" tComment
Plugin 'tomtom/tcomment_vim'

" better cpp highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight=1
" let g:cpp_experimental_template_highlight=1

" Git change line indicator
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_override_sign_column_highlight=0
highlight SignColumn ctermfg=white

" clang auto completion and validation
" Clang complete
Plugin 'justmao945/vim-clang'
let g:clang_vim_exec = 'vim'
let g:clang_sh_exec = 'bash'
let g:clang_diagsopt = ''

" clang complete
" Plugin 'myint/clang-complete'

" youcompleteme clang complete
" Plugin 'Valloric/YouCompleteMe'

" ultisnips to auto complete code block
" Plugin 'SirVer/ultisnips'

" " syntax checker
" Plugin 'terhechte/syntastic'
" " Show sidebar signs.
" let g:syntastic_enable_signs=1
" let g:syntastic_objc_config_file = '.clang_complete'
" " Status line configuration
" set statusline+=%#warningmsg#  " Add Error ruler.
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" " nnoremap <silent> ` :Errors<CR>

" Vim for iOS
" Plugin 'eraserhd/vim-ios'

" fuzzy finder
" Plugin 'vim-scripts/FuzzyFinder'

" better fuzzy finder
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" for code review pull request from GitHub
Plugin 'codegram/vim-codereview'

" for patch review required by codereview
Plugin 'junkblocker/patchreview-vim'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Highlight Multiple words
Plugin 'vim-scripts/Mark--Karkat'

" ACK for vim
Plugin 'mileszs/ack.vim'

" better colors
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/BusyBee'
Plugin 'tpope/vim-vividchalk'
Plugin 'queyenth/oxeded.vim'
Plugin 'widatama/vim-phoenix'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required

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

syntax on
set wrap
set linebreak
set expandtab
set modelines=0
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
if &diff
    set number
else
    set relativenumber
endif

" Do not setup back or swap file for each file we open
set nowritebackup
set noswapfile
set nobackup


" Automatic formatting
" autocmd BufWritePre *.rb :%s/\s\+$//e
" autocmd BufWritePre *.go :%s/\s\+$//e
" autocmd BufWritePre *.haml :%s/\s\+$//e
" autocmd BufWritePre *.html :%s/\s\+$//e
" autocmd BufWritePre *.scss :%s/\s\+$//e
" autocmd BufWritePre *.slim :%s/\s\+$//e

" au BufNewFile * set noeol
" au BufRead,BufNewFile *.go set filetype=go

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" NERDTree
let NERDTreeHighlightCursorline=1
autocmd VimEnter * NERDTreeFind
autocmd VimEnter * wincmd p

" Check if NERDTree is open or active
function! rc:isNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! rc:syncTree()
    if $modifiable && rc:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call rc:syncTree()

" set tab option for programming guidance compliant
set copyindent
set preserveindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" show hidden character
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
" if needed to show end of line then add ,eol:$

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Remember info about open buffers on close
" set viminfo^=%

" autocmd Syntax cpp call EnhanceCppSyntax()
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" Cursor related config
" set cursorline
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set cursorcolumn
syntax enable
set background=dark
colorscheme jellybeans


" Highlight while typing search word
set incsearch
set hlsearch
hi Search cterm=NONE ctermfg=grey ctermbg=blue
set ignorecase
set smartcase

" highlight vim tab
hi TabLineSel ctermfg=Red ctermbg=Yellow
hi Title ctermfg=LightBlue ctermbg=Magenta

" folding useing syntax
" set foldmethod=syntax
