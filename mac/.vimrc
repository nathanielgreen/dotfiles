call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-vinegar'
Plug 'edkolev/tmuxline.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'chriskempson/base16-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'w0rp/ale'
Plug 'ajh17/VimCompletesMe'
Plug 'tomlion/vim-solidity'
call plug#end()

" Leader
let mapleader = ","

syntax enable
set background=dark

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


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

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

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

" Relative Number Toggle
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Clipboard
set clipboard=unnamed

function! SetNoPaste()
  set nopaste
endfunc

" Better Pasting
map <Leader>p :set paste<cr>
map <Leader>np :set nopaste<cr>

" Folding
set foldmethod=marker

" Colorizer Toggle
map <Leader>co :ColorToggle<cr>

" Airline Theme
let g:airline_theme='base16'

" Number Colors
highlight LineNr ctermfg=darkgrey ctermbg=black
highlight ColorColumn ctermbg=darkgrey
highlight Comment ctermfg=darkgrey
hi MatchParen cterm=none ctermbg=grey ctermfg=black

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Line numbers in netrw
let g:netrw_bufsettings = 'noma nomod rnu nobl nowrap ro'

" vimgrep file ignores
set wildignore+=*/node_modules/**,*/.git/**,*/bower_components/**

" Newline without insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Vim Elixir Format Options
let g:mix_format_on_save = 1

" Flutter Shortcuts
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" Dart Styling
let dart_style_guide = 2
let dart_format_on_save = 1

" Prettier
let g:ale_fixers = {
      \  'javascript': ['prettier'],
      \  'css': ['prettier'],
      \  'html': ['prettier'],
      \}

