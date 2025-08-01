" Set to be iMproved, required
set nocompatible
syntax on
filetype on

" Set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add your plugins below
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup'

" fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" better vim
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'machakann/vim-highlightedyank'
Plugin 'preservim/nerdtree'
Plugin 'PhilRunninger/nerdtree-visual-selection'
" tmux bindings within vim
Plugin 'christoomey/vim-tmux-navigator'

" Rust setup
Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif

" End plugin configuration
call vundle#end()

" Enable filetype detection and indenting
filetype plugin indent on

let mapleader = " "
" Make space no-op since it is leader 
nnoremap <Space> <Nop>

" custom bindings
map s <Plug>(easymotion-bd-f)

" Key mappings
nnoremap J 5j
vnoremap J 5j
nnoremap K 5k
vnoremap K 5k

"" yank to EOL
map Y y$

" search for yank
vnoremap // y/<C-R>"<CR>N

"" Navigate completion menu with Ctrl-j and Ctrl-k
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" fzf vim
set rtp+=~/.fzf
autocmd VimEnter * if exists(':FZF') | silent! call fzf#install() | endif
let g:fzf_vim = {}
nnoremap <leader>F :Rg<CR>

" nerd tree
nmap <silent> <leader>e :NERDTreeToggle<CR>
nmap <silent> <leader>E :NERDTreeFocus<CR>
let g:NERDTreeMapQuit = 'q'
let g:NERDTreeMapDelete = 'd'
let g:NERDTreeMapNewFile = 'n'
let g:NERDTreeMapNewDir = 'N'
let g:NERDTreeMapCloseDir = 'h'
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeMapPreview = 'gl'
let g:NERDTreeMapNewFile = 'a'

" move up and down
set scrolloff=15

" search is case insenitive
set ignorecase

" share clipborad with vim
set clipboard=unnamedplus,unnamed,autoselect

" set java formatting for formatting commands
autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
Plugin 'wakatime/vim-wakatime'

