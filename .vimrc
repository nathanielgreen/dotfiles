" Language Set up VimPlug package installer 
call plug#begin('~/.vim/plugged')
" Syntax Support
Plug 'rust-lang/rust.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
" Plug 'posva/vim-vue'
" Plug 'evanleck/vim-svelte'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'elixir-editors/vim-elixir'
" Plug 'mhinz/vim-mix-format'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'elmcast/elm-vim': Disabled as not using elm
" Plug 'tomlion/vim-solidity': Disabled as not using solidity
" Plug 'thosakwe/vim-flutter': Disabled as not using flutter

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'chriskempson/base16-vim'
" Plug 'tpope/vim-vinegar': Disabled as not using netrw anymore for the - shortcut

" Navigation
Plug 'mcchrish/nnn.vim' " Folder Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'christoomey/vim-tmux-navigator'

" Code Completion, formatting, and linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'tpope/vim-fugitive'

" Other
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-abolish'
Plug 'junegunn/goyo.vim'
call plug#end()

"      _                _             _
"  ___| |__   ___  _ __| |_ ___ _   _| |_ ___
" / __| '_ \ / _ \| '__| __/ __| | | | __/ __|
" \__ \ | | | (_) | |  | || (__| |_| | |_\__ \
" |___/_| |_|\___/|_|   \__\___|\__,_|\__|___/
"
let mapleader = " "
" What - Map Leader Key to space

nnoremap gb :ls<CR>:b<Space>
" What - Shortcut to change buffer quickly

set relativenumber
" What - Sets relative number to be on by default
" Why - Ease navigation around file using command e.g. 32j

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
" What - Function for Relative Number Toggle

function! SetNoPaste()
  set nopaste
endfunc
" What - Function declaration for SetNoPaste

map <Leader>pp :set paste<cr>
map <Leader>pn :set nopaste<cr>
" What - Shortcut for better Pasting
" Why - When trying to paste without :set paste, the first line can be
" incorrectly indented

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" What - Quicker window movement
"      _                _             _                        _
"  ___| |__   ___  _ __| |_ ___ _   _| |_ ___    ___ _ __   __| |
" / __| '_ \ / _ \| '__| __/ __| | | | __/ __|  / _ \ '_ \ / _` |
" \__ \ | | | (_) | |  | || (__| |_| | |_\__ \ |  __/ | | | (_| |
" |___/_| |_|\___/|_|   \__\___|\__,_|\__|___/  \___|_| |_|\__,_|



"        _   _ _ _ _
"  _   _| |_(_) (_) |_ _   _
" | | | | __| | | | __| | | |
" | |_| | |_| | | | |_| |_| |
"  \__,_|\__|_|_|_|\__|\__, |
"                      |___/
" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

set wildignore+=*/node_modules/**,*/.git/**,*/bower_components/**
" What - Set vimgrep to ingore file file ignores
" Why - Without it, vimgrep will grep through the below file paths and be very
" slow, also giving unwanted results

set diffopt+=vertical
" What - Always use vertical diffs

:set tabstop=2
:set shiftwidth=0
" What - Set default Tab Width
"
:set expandtab
" What - use spaces over tabs

set number
set numberwidth=4
" What - Enable numbers and set number width

set splitbelow
set splitright
" What - Open new split panes to right and bottom, which feels more natural
" Why - Otherwise they open by default to left and the top which is mental

set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
" What - Tab completion, that will insert tab at beginning of line, or
" will use completion if not at beginning
" Why - Otherwise pressing tab to autocomplete will just instert a tab/space
" characters, and the arrow keys must be used instead.
"        _   _ _ _ _                          _
"  _   _| |_(_) (_) |_ _   _    ___ _ __   __| |
" | | | | __| | | | __| | | |  / _ \ '_ \ / _` |
" | |_| | |_| | | | |_| |_| | |  __/ | | | (_| |
"  \__,_|\__|_|_|_|\__|\__, |  \___|_| |_|\__,_|
"                      |___/



"  _   _
" | |_| |__   ___ _ __ ___   ___
" | __| '_ \ / _ \ '_ ` _ \ / _ \
" | |_| | | |  __/ | | | | |  __/
"  \__|_| |_|\___|_| |_| |_|\___|
"
syntax enable
" What - Enable syntax highlighting

set textwidth=80
" What - Set color column to 80 

augroup ColorcolumnOnlyInInsertMode
  autocmd!
  autocmd InsertEnter * setlocal colorcolumn=80
  autocmd InsertLeave * setlocal colorcolumn=0
augroup END
" What -Only show 80 color column when in insert mode
" Why - Easier to read

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" What - Set the base16 color space to 256 to allow full theme colors to display
" Why - Otherwise the base16 shell theme will not display properly in vim
"  _   _                                          _
" | |_| |__   ___ _ __ ___   ___    ___ _ __   __| |
" | __| '_ \ / _ \ '_ ` _ \ / _ \  / _ \ '_ \ / _` |
" | |_| | | |  __/ | | | | |  __/ |  __/ | | | (_| |
"  \__|_| |_|\___|_| |_| |_|\___|  \___|_| |_|\__,_|



"        _             _
"  _ __ | |_   _  __ _(_)_ __  ___
" | '_ \| | | | |/ _` | | '_ \/ __|
" | |_) | | |_| | (_| | | | | \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/
" |_|            |___/
" *** PLUGIN START CONFIG: nnn
" NNN Navigation
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }
" What - Shortcuts to open the selected file in splits

let g:nnn#command = 'nnn -C'

let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
" What - Open nnn in a floating window instead of the default pane

nnoremap - :NnnPicker %:p:h<CR>
" What - Open nnn with key `-` in the current working directory
" *** PLUGIN END CONFIG: nnn
"
"
"
" *** PLUGIN START CONFIG: vim-airline
let g:airline_theme='base16'
" What - Sets the airline theme to match the shell theme of base16
" Why - Otherwise it does not match the terminal colorscheme
" *** PLUGIN END CONFIG: vim-airline
"
"
"
" *** PLUGIN START: indentLine
let g:indentLine_concealcursor=""
" What - Set the indentLine vim-conceal cursor to empty
" Why - If not set, in JSON files, the line under the cursor will not show
" double quote characters, which makes it a pain to edit. This sets it so that
" the line underneath the cursor will show as normal as if vim-conceal was set
" to 0. 
" See https://github.com/elzr/vim-json#common-problems for more info.
 
let g:indentLine_defaultGroup = 'SpecialKey'
" What - Set the indentLine characters default highlight group to Special key
" Why - The special key highlight group is the same light grey as comments,
" otherwise the default is a darker grey like body text
" *** PLUGIN END: indentLine
"        _             _                            _
"  _ __ | |_   _  __ _(_)_ __  ___    ___ _ __   __| |
" | '_ \| | | | |/ _` | | '_ \/ __|  / _ \ '_ \ / _` |
" | |_) | | |_| | (_| | | | | \__ \ |  __/ | | | (_| |
" | .__/|_|\__,_|\__, |_|_| |_|___/  \___|_| |_|\__,_|
" |_|            |___/


