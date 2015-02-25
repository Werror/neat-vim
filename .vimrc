set mouse+=a
if &term =~ '^screen' " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9' " Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'
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
" auto complete
Plugin 'vim-scripts/AutoComplPop'
" c++ auto complete
Plugin 'vim-scripts/OmniCppComplete'
set nocp
" switch between c/cpp and h files -> currently Disabled due to ios.vim
Plugin 'vim-scripts/a.vim'
" coding plugin for c/c++
Plugin 'vim-scripts/c.vim'
" for vimshell
Plugin 'shougo/vimproc'
Plugin 'shougo/vimshell'
" I need mini buffers
Plugin 'fholgado/minibufexpl.vim'
" try vterm for terminal access
Plugin 'sollidsnake/vterm'
" We need powerline
Plugin 'Lokaltog/vim-powerline'
set laststatus=2
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
" tComment
Plugin 'tomtom/tcomment_vim'
" better cpp highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1
" Git change line indicator
Plugin 'airblade/vim-gitgutter'
" clang auto completion and validation
Plugin 'justmao945/vim-clang'
" ultisnips to auto complete code block
Plugin 'SirVer/ultisnips'
" syntax checker
Plugin 'terhechte/syntastic'
" Show sidebar signs.
let g:syntastic_enable_signs=1

" Read the clang complete file
let g:syntastic_objc_config_file = '.clang_complete'

" Status line configuration
set statusline+=%#warningmsg#  " Add Error ruler.
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <silent> ` :Errors<CR>

" Vim for iOS
Plugin 'eraserhd/vim-ios'
" new colors
Plugin 'tpope/vim-vividchalk'

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
set nolist  " list disables linebreak
set cursorline
set expandtab
set modelines=0
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set relativenumber
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase

" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" NERDTree
let NERDTreeHighlightCursorline=1
autocmd VimEnter * NERDTree

" set tab option for programming guidance compliant
set smarttab
set shiftwidth=4
set expandtab
set tabstop=4

" show hidden character
set listchars=tab:>-,trail:~,extends:>,precedes:<
" if needed to show end of line then add ,eol:$

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
    syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
    hi def link cppFuncDef Special
endfunction

autocmd Syntax cpp call EnhanceCppSyntax()
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

