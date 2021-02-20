" Set up VimPlug package installer 
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
" What - Map Leader Key to space
let mapleader = " "

" What - Shortcut to change buffer quickly
nnoremap gb :ls<CR>:b<Space>

" What - Sets relative number to be on by default
set relativenumber
" Why - Ease navigation around file using command e.g. 32j

" What - Function for Relative Number Toggle
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" What - Function declaration for SetNoPaste
function! SetNoPaste()
  set nopaste
endfunc

" What - Shortcut for better Pasting
map <Leader>pp :set paste<cr>
map <Leader>np :set nopaste<cr>
" Why - When trying to paste without :set paste, the first line can be
" incorrectly indented

" What - Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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

" What - no autocreation of backup files
set nobackup      " No autocreation of backup files
set nowritebackup " No autocreation of backup files
" Why - BUG: Without these lines, storybook and angular will halt when tring to
" save files
"
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set autowrite     " Automatically :write before running commands

set diffopt+=vertical
" What - Always use vertical diffs

" What - Set default Tab Width
set tabstop=2
set shiftwidth=0

" What - use spaces over tabs
set expandtab

" What - Enable numbers and set number width
set number
set numberwidth=4

" What - Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Why - Otherwise they open by default to left and the top which is mental

" What - Tab completion, that will insert tab at beginning of line, or
" will use completion if not at beginning
inoremap <silent><expr> <TAB>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
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
" What - Enable syntax highlighting
syntax enable

" What - Set color column to 80 
set textwidth=80

" What -Only show 80 color column when in insert mode
augroup ColorcolumnOnlyInInsertMode
  autocmd!
  autocmd InsertEnter * setlocal colorcolumn=80
  autocmd InsertLeave * setlocal colorcolumn=0
augroup END
" Why - Easier to read

" What - Set the base16 color space to 256 to allow full theme colors to display
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
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
" *** PLUGIN START: nnn
" What - Shortcuts to open the selected file in splits
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

let g:nnn#command = 'nnn -C'

" What - Open nnn in a floating window instead of the default pane
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" What - Open nnn with key `-` in the current working directory
nnoremap - :NnnPicker %:p:h<CR>
" *** PLUGIN END: nnn



" *** PLUGIN START: fzf
nnoremap <C-p> :FZF<CR>

" What - Shortcut to open window switcher
map <Leader>w :W<cr>
" *** PLUGIN END: fzf



" *** PLUGIN START: vim-airline
" What - Sets the airline theme to match the shell theme of base16
let g:airline_theme='base16'
" Why - Otherwise it does not match the terminal colorscheme
" *** PLUGIN END: vim-airline



" *** PLUGIN START: indentLine
" What - Set the indentLine vim-conceal cursor to empty
let g:indentLine_concealcursor=""
" Why - If not set, in JSON files, the line under the cursor will not show
" double quote characters, which makes it a pain to edit. This sets it so that
" the line underneath the cursor will show as normal as if vim-conceal was set
" to 0. 
" See https://github.com/elzr/vim-json#common-problems for more info.
 
" What - Set the indentLine characters default highlight group to Special key
let g:indentLine_defaultGroup = 'SpecialKey'
" Why - The special key highlight group is the same light grey as comments,
" otherwise the default is a darker grey like body text
" *** PLUGIN END: indentLine
"        _             _                            _
"  _ __ | |_   _  __ _(_)_ __  ___    ___ _ __   __| |
" | '_ \| | | | |/ _` | | '_ \/ __|  / _ \ '_ \ / _` |
" | |_) | | |_| | (_| | | | | \__ \ |  __/ | | | (_| |
" | .__/|_|\__,_|\__, |_|_| |_|___/  \___|_| |_|\__,_|
" |_|            |___/


