"Install vim-plug:
"
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'nanotech/jellybeans.vim'
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'

Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'roryokane/detectindent'
Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'

Plug 'PotatoesMaster/i3-vim-syntax'

Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neco-vim'

call plug#end()


"-------------------- General/Misc Settings--------------------
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
set number
set updatetime=250
set scrolloff=7
set noshowmode
set cursorline

let g:bufferline_echo=0

set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swp//

set foldmethod=syntax
set foldcolumn=2
set foldnestmax=2
autocmd BufEnter * normal zR



"-------------------- Tab Settings --------------------
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set shiftround

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0


"-------------------- Colorscheme --------------------
set termguicolors
syntax on

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1
colorscheme gruvbox
set bg=dark

" Set up terminal colors for neovim
if has('nvim')
  " dark0 + gray
  let g:terminal_color_0 = "#282828"
  let g:terminal_color_8 = "#928374"

  " neurtral_red + bright_red
  let g:terminal_color_1 = "#cc241d"
  let g:terminal_color_9 = "#fb4934"

  " neutral_green + bright_green
  let g:terminal_color_2 = "#98971a"
  let g:terminal_color_10 = "#b8bb26"

  " neutral_yellow + bright_yellow
  let g:terminal_color_3 = "#d79921"
  let g:terminal_color_11 = "#fabd2f"

  " neutral_blue + bright_blue
  let g:terminal_color_4 = "#458588"
  let g:terminal_color_12 = "#83a598"

  " neutral_purple + bright_purple
  let g:terminal_color_5 = "#b16286"
  let g:terminal_color_13 = "#d3869b"

  " neutral_aqua + faded_aqua
  let g:terminal_color_6 = "#689d6a"
  let g:terminal_color_14 = "#8ec07c"

  " light4 + light1
  let g:terminal_color_7 = "#a89984"
  let g:terminal_color_15 = "#ebdbb2"
endif

"-------------------- Mappings --------------------
let mapleader=','
let g:mapleader=','

nnoremap ; :

nnoremap <leader>ei :edit $MYVIMRC<cr>
nnoremap <leader>si :source $MYVIMRC<cr>

nnoremap <leader>w :wall!<cr>

nnoremap <leader>= gg=G

noremap H ^
nnoremap L $

nnoremap <M-h> <C-W>h
nnoremap <M-j> <C-W>j
nnoremap <M-k> <C-W>k
nnoremap <M-l> <C-W>l

" surround visually selected text in quotes
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>

" add semicolon to the end of the line
nnoremap <leader>; A;<esc>

" might as well try this out
inoremap jk <esc>
" inoremap <esc> <nop>

"-------------------- Plugin Settings --------------------
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<M-m>'
autocmd FileType html,css,javascript.jsx,liquid EmmetInstall

" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
            \  'html' : {
            \    'indent_blockelement': 1,
            \  },
            \}

call deoplete#enable()

let g:polyglot_disabled = ['javascript']
