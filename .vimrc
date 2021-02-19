" Set up VimPlug package installer 
call plug#begin('~/.vim/plugged')
" Language Support
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
Plug 'w0rp/ale'
Plug 'ycm-core/YouCompleteMe'

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
" Map Leader Key Leader
let mapleader = " "

" What - Change Buffer quickly shortcut
nnoremap gb :ls<CR>:b<Space>

" What - Sets relative number to be on by default
" Why - Ease navigation around file using command e.g. 32j
set relativenumber

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
" Why - When trying to paste without :set paste, the first line can be
" incorrectly indented
map <Leader>pp :set paste<cr>
map <Leader>pn :set nopaste<cr>
" ### SHORTCUTS END


" Quicker window movement
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

" What - Set vimgrep to ingore file file ignores
" Why - Without it, vimgrep will grep through the below file paths and be very
" slow, also giving unwanted results
set wildignore+=*/node_modules/**,*/.git/**,*/bower_components/**

" Always use vertical diffs
set diffopt+=vertical

" Default Tab Width
:set tabstop=2
:set shiftwidth=0
" use spaces over tabs
:set expandtab

" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
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

" What - Set color column to 80 when in insert mode
set textwidth=80
augroup ColorcolumnOnlyInInsertMode
  autocmd!
  autocmd InsertEnter * setlocal colorcolumn=80
  autocmd InsertLeave * setlocal colorcolumn=0
augroup END

" What - Set the base16 color space to 256 to allow full theme colors to display
" Why - Otherwise the base16 shell theme will not display properly in vim
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
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
"
" ### PLUGINS START
" *** PLUGIN START CONFIG: ale
let g:ale_fixers = {
      \  'javascript': ['prettier'],
      \  'css': ['prettier'],
      \  'html': ['prettier'],
      \  'vue': ['prettier'],
      \  'typescript': ['prettier'],
      \  'tsx': ['prettier'],
      \}
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_fix_on_save = 1

" What - When ale detects an error, underline the code instead of block
" highlighting
" Why - Otherwise it'll be a block of red that's difficult to read
highlight ALEError ctermbg=none cterm=underline

" What - Shortcut to run ALEFix with local prettier settings
map <Leader>f :ALEFix prettier<cr>
" *** PLUGIN END CONFIG: ale
"
"
"
" *** PLUGIN START CONFIG: nnn
" NNN Navigation
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

let g:nnn#command = 'nnn -C'
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" Open NNN with - and in current dir
nnoremap - :NnnPicker %:p:h<CR>
" *** PLUGIN END CONFIG: nnn
"
"
"
" *** PLUGIN START CONFIG: vim-airline
" What - Sets the airline theme to match the shell theme of base16
" Why - Otherwise it does not match the terminal colorscheme
let g:airline_theme='base16'
" *** PLUGIN END CONFIG: vim-airline
"
"
"
" *** PLUGIN START: indentLine
" What - Set the indentLine vim-conceal behaviour to setting 1
" Why - If at setting 0, the lines are not intended, if any higher, some
" characters are invisible until viewing in visual mode
let g:indentLine_setConceal = 1
 
" What - Set the indentLine characters default highlight group to Special key
" Why - The special key highlight group is the same light grey as comments,
" otherwise the default is a darker grey like body text
let g:indentLine_defaultGroup = 'SpecialKey'
" *** PLUGIN END: indentLine
"
"
"
" *** PLUGIN START: YouCompletesMe
" What - Close the YouCompletesMe preview window after finish typing
" Why - Otherwise a buffer with the preview of the completion stays open,
" unnecissarily taking up screen real estate
let g:ycm_autoclose_preview_window_after_completion=1
" *** PLUGIN END: YouCompletesMe
"        _             _                            _
"  _ __ | |_   _  __ _(_)_ __  ___    ___ _ __   __| |
" | '_ \| | | | |/ _` | | '_ \/ __|  / _ \ '_ \ / _` |
" | |_) | | |_| | (_| | | | | \__ \ |  __/ | | | (_| |
" | .__/|_|\__,_|\__, |_|_| |_|___/  \___|_| |_|\__,_|
" |_|            |___/


