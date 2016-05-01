" Plugins with vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'othree/yajs.vim', { 'for': ['javascript'] }
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'benekastah/neomake'

" theme
Plug 'mhartington/oceanic-next'

call plug#end()

" Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark

" vim-airline settings, enable powerline fonts
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Ctrl-p
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" vim-jsx
let g:jsx_ext_required = 0

" neomake
" A plugin for asynchronous :make using Neovim's job-control functionality
autocmd! BufWritePost * Neomake

" Options
let mapleader = '\'
set relativenumber
set expandtab
set shiftwidth=2
set softtabstop=2
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set number                                                   " show line numbers
set ruler                                                    " show where you are
set clipboard=unnamed                                        " clipboard sharing

" Mappings
map <C-\> :NERDTreeToggle<CR>

" Trim white spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()

