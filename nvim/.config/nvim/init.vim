" Automatically install vim-plug {{{
if has('nvim') && empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
"}}}

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'nanotech/jellybeans.vim'
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'
Plug 'NLKNguyen/papercolor-theme'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/base16-vim'

" Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-surround'
" Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'roryokane/detectindent'
Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/Colorizer'

" Syntax/language plugins
" Plug 'sheerun/vim-polyglot'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'othree/yajs.vim'
Plug 'lervag/vimtex'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'ervandew/supertab'
Plug 'Shougo/neco-vim'

call plug#end()
"}}}

" General/Misc Settings {{{

" Change cursor shape in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Display line numbers
set number
set updatetime=250
set scrolloff=7
set noshowmode
set cursorline
set lazyredraw
set clipboard=unnamedplus
set modelines=1

let g:bufferline_echo=0

set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swp//

set foldmethod=syntax
set foldcolumn=2
set foldnestmax=2
autocmd BufEnter * normal zR

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup end


"}}}


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
set bg=dark

let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_italic=1
" let g:gruvbox_italicize_comments=1
" let g:gruvbox_italicize_strings=1
colorscheme gruvbox

let g:hybrid_custom_term_colors = 1

" TODO: fix this in tender
" let g:colors_name = "tender"

" let g:airline_theme = 'base16_ocean'

" Gruvbox-specific options and terminal colors {{{
if g:colors_name == "gruvbox"

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
"}}}
"-------------------- Mappings --------------------
let mapleader=','
let g:mapleader=','
let maplocalleader=','

nnoremap ; :

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ei :edit ~/.config/i3/config

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

nnoremap <silent> <esc><esc> :noh<return><esc>

" Switch between the last two files
nnoremap <M-Tab> <C-^>

"-------------------- Plugin Settings --------------------
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>
" Open NERDTree automatically when vim starts up with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif

" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

let g:lightline = {
    \ 'colorscheme': 'gruvbox'
    \ }

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

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
            \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
            \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
            \ . '|hyperref\s*\[[^]]*'
            \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
            \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
            \ .')'

" let g:polyglot_disabled = ['javascript', 'latex']
let python_highlight_all = 1
let g:tex_flavor = 'latex'

let g:alchemist#elixi_erlang_src = "~/src"

" vim: foldmethod=marker
