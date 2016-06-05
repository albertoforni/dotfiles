" Plugins with vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" CtrlP =======================================================================
Plug 'ctrlpvim/ctrlp.vim'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" ==============================================================================

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

" syntastic ===================================================================
Plug 'scrooloose/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" ==============================================================================

Plug 'pangloss/vim-javascript'

" VimCompleteLikeAModerEditor ================================================
Plug 'mxw/vim-jsx'

let g:jsx_ext_required = 0
" ==============================================================================

" Neomake ======================================================================
" A plugin for asynchronous :make using Neovim's job-control functionality
Plug 'benekastah/neomake'
autocmd! BufWritePost * Neomake
" ==============================================================================

Plug 'nathanaelkane/vim-indent-guides'        " Indent Guides is a plug in for visually displaying indent
Plug 'ap/vim-css-color', { 'for': ['css', 'sass', 'scss'] } " highlight colors in css files
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'rking/ag.vim'

" Web Dev Icons ============== ================================================
" Encoding must be set to UTF-8 for the glyphs to show
Plug 'ryanoasis/vim-webdevicons'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" =============================================================================

" Session ======================================================================
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" let g:session_autosave_periodic = 0  "Every three minutes + on close seems fine.
" But saving resets window dims!
let g:session_autosave = 'yes'       "Auto-save on close
let g:session_autoload = 'no'

" Make sure to save sessions outside of your dotfiles in case you publish your
" dotfiles to github etc.
" The Session Directory
let g:session_directory='~/vim_sessions'
" ==============================================================================

" VimCompleteLikeAModerEditor ================================================
" Prereqs:
" install python support pip3 install neovim
Plug 'jordwalke/AutoComplPop'
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'jordwalke/VimCompleteLikeAModernEditor'
" Place snippets in ~/.vim/myUltiSnippets/
" Or if want to use stock snippets too...
let g:UltiSnipsSnippetDirectories=['~/.vim/plugged/vim-snippets/UltiSnips']

" Put this in your .vimrc
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
" ==============================================================================

" Theme ========================================================================
Plug 'mhartington/oceanic-next'

syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark
" ==============================================================================

" vim-airline =================================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" vim-airline settings, enable powerline fonts
let g:airline_theme='oceanicnext' " this must come after the theme installation
let g:airline_powerline_fonts = 1
" ==============================================================================

call plug#end()



" Options
setlocal spell spelllang=en_us
set mouse=a                                                  " Enable mouse in all modes
set noswapfile                                               " Don't make backups.
set nowritebackup                                            " Even if you did make a backup, don't keep it around.
set nobackup
set virtualedit=block                                        " C-v activate rectangular selections (visual blocks)
set relativenumber
set expandtab
set shiftwidth=2
set softtabstop=2
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set number                                                   " show line numbers
set ruler                                                    " show where you are
set clipboard=unnamed                                        " clipboard sharing
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set smartcase                                                " case-sensitive search if any caps
set laststatus=2                                             " always show statusline



" Mappings
let mapleader = '\'
map <C-\> :NERDTreeToggle<CR>
noremap <C-F> :Ag<space>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>



" Trim white spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()
