" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Favourite color scheme
Plug 'tpope/vim-vividchalk'

" Must have working with git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" parentheses, brackets, quotes, XML tags, and more
Plug 'tpope/vim-surround'

" fuzzy finder
Plug 'kien/ctrlp.vim'

" better power line
Plug 'bling/vim-airline'

" show code tags
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle'}

" C, C++ related
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
Plug 'vim-scripts/cscope.vim', {'for': 'cpp'}
Plug 'chazy/cscope_maps', {'for': 'cpp'}
" we need cctree
" Plug 'vim-scripts/CCTree'
" let g:CCTreeDisplayMode=1 " use compact mode
" let g:CCTreeHiSymbol=1
" let g:CCTreeUseUTF8Symbols=0
" let g:CCTreeMinWidth=45

" search with ag
Plug 'rking/ag.vim'

" easily comment out line/blocks
Plug 'tomtom/tcomment_vim'

" multiple cursor edit
Plug 'terryma/vim-multiple-cursors'

" Highlight Multiple words
Plug 'vim-scripts/Mark--Karkat'

" recognize gradle as a groovy
Plug 'tfnico/vim-gradle', {'for': 'gradle'}

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

colorscheme vividchalk
set number
set relativenumber