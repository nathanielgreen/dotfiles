call plug#begin('~/.vim/plugged')
" Language Support
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
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

" Code Completion, formatting, and linting
Plug 'w0rp/ale'
Plug 'ycm-core/YouCompleteMe'
" Plug 'ajh17/VimCompletesMe # Disabled to try out just YCM

" Other
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'junegunn/goyo.vim'
call plug#end()

" Leader
let mapleader = " "



set nocompatible
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup      " No autocreation of backup files
set nowritebackup " No autocreation of backup files
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Softtabs, 4 spaces for Rust
autocmd FileType rs setlocal shiftwidth=4 tabstop=4

" Display extra whitespace
set nolist


" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
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

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif


" Clipboard
set clipboard=unnamed


" Folding
set foldmethod=marker

" Stop adding newline at end of files
set nofixendofline

" TSX Config
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
" dark red
hi tsxTagName guifg=#E06C75
" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" By default, CursorHold is triggered after the cursor remains still for 4 seconds, and is configurable via updatetime.
" Triggers Autoread of changed files
au CursorHold,CursorHoldI * checktime
" Add the following to your vimrc to trigger autoread when changing buffers while inside vim:
au FocusGained,BufEnter * :checktime

"        _   _ _ _ _
"  _   _| |_(_) (_) |_ _   _
" | | | | __| | | | __| | | |
" | |_| | |_| | | | |_| |_| |
"  \__,_|\__|_|_|_|\__|\__, |
"                      |___/
" ### UTILITY START
" What: Set vimgrep to ingore file file ignores
" Why: Without it, vimgrep will grep through the below file paths and be very
" slow, also giving unwanted results
set wildignore+=*/node_modules/**,*/.git/**,*/bower_components/**

" ### UTILITY END
"
"  _   _
" | |_| |__   ___ _ __ ___   ___
" | __| '_ \ / _ \ '_ ` _ \ / _ \
" | |_| | | |  __/ | | | | |  __/
"  \__|_| |_|\___|_| |_| |_|\___|
"
" ### THEME START
" What: Enable syntax highlighting
syntax enable

" What: Set color column to 80 when in insert mode
set textwidth=80
augroup ColorcolumnOnlyInInsertMode
  autocmd!
  autocmd InsertEnter * setlocal colorcolumn=80
  autocmd InsertLeave * setlocal colorcolumn=0
augroup END

" What: Set the base16 color space to 256 to allow full theme colors to display
" Why: Otherwise the base16 shell theme will not display properly in vim
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" ### THEME END
"
"      _                _             _
"  ___| |__   ___  _ __| |_ ___ _   _| |_ ___
" / __| '_ \ / _ \| '__| __/ __| | | | __/ __|
" \__ \ | | | (_) | |  | || (__| |_| | |_\__ \
" |___/_| |_|\___/|_|   \__\___|\__,_|\__|___/
"
" ### SHORTCUTS START
" What: Change Buffer quickly shortcut
nnoremap gb :ls<CR>:b<Space>

" What: Sets relative number to be on by default
" Why: Ease navigation around file using command e.g. 32j
set relativenumber

" What: Function for Relative Number Toggle
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" What: Function declaration for SetNoPaste
function! SetNoPaste()
  set nopaste
endfunc

" What: Shortcut for better Pasting
" Why: When trying to paste without :set paste, the first line can be
" incorrectly indented
map <Leader>p :set paste<cr>
map <Leader>np :set nopaste<cr>
" ### SHORTCUTS END
"
"
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

" What: When ale detects an error, underline the code instead of block
" highlighting
" Why: Otherwise it'll be a block of red that's difficult to read
highlight ALEError ctermbg=none cterm=underline

" What: Shortcut to run ALEFix with local prettier settings
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

" Open NNN with - and in current dir
nnoremap - :NnnPicker %:p:h<CR>
" *** PLUGIN END CONFIG: nnn
"
"
"
" *** PLUGIN START CONFIG: vim-airline
" What: Sets the airline theme to match the shell theme of base16
" Why: Otherwise it does not match the terminal colorscheme
let g:airline_theme='base16'
" *** PLUGIN END CONFIG: vim-airline
"
"
"
" *** PLUGIN START: indentLine
" What: Set the indentLine vim-conceal behaviour to setting 1
" Why: If at setting 0, the lines are not intended, if any higher, some
" characters are invisible until viewing in visual mode
let g:indentLine_setConceal = 1
" *** PLUGIN END: indentLine

" ### PLUGINS END
