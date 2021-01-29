call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'mcchrish/nnn.vim'
Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'posva/vim-vue'
Plug 'tpope/vim-abolish'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'chriskempson/base16-vim'
Plug 'w0rp/ale'
Plug 'ajh17/VimCompletesMe'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/goyo.vim'
" Plug 'tpope/vim-vinegar': Disabled as not using netrw anymore for the - shortcut
" Plug 'evanleck/vim-svelte'
" Plug 'elmcast/elm-vim': Disabled as not using elm
" Plug 'tomlion/vim-solidity': Disabled as not using solidity
" Plug 'thosakwe/vim-flutter': Disabled as not using flutter
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'elixir-editors/vim-elixir'
" Plug 'mhinz/vim-mix-format'
"Plug 'peitalin/vim-jsx-typescript'
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

" Set color column to 80 when in insert mode
set textwidth=80
augroup ColorcolumnOnlyInInsertMode
  autocmd!
  autocmd InsertEnter * setlocal colorcolumn=80
  autocmd InsertLeave * setlocal colorcolumn=0
augroup END

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

" Airline Theme
let g:airline_theme='base16'

" Number Colors
highlight LineNr ctermfg=darkgrey ctermbg=black
highlight ColorColumn ctermbg=darkgrey
highlight Comment ctermfg=darkgrey
hi MatchParen cterm=none ctermbg=darkgrey ctermfg=white

" vimgrep file ignores
set wildignore+=*/node_modules/**,*/.git/**,*/bower_components/**

" Prettier and ALE CONFIG START
let g:ale_fixers = {
      \  'javascript': ['prettier'],
      \  'css': ['prettier'],
      \  'html': ['prettier'],
      \  'vue': ['prettier'],
      \  'typescript': ['prettier'],
      \  'tsx': ['prettier'],
      \}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_fix_on_save = 1
" Prettier and ALE CONFIG END

highlight ALEError ctermbg=none cterm=underline

map <Leader>f :ALEFix prettier<cr>

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

" Stop indentLine fucking jsons
let g:indentLine_setConceal = 1

" PLUGIN START CONFIG: nnn
" NNN Navigation
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

let g:nnn#command = 'nnn -C'

" Open NNN with - and in current dir
nnoremap - :NnnPicker %:p:h<CR>
" PLUGIN END CONFIG: nnn

" Change Buffer quickly shortcut
nnoremap gb :ls<CR>:b<Space>

" What: Reset the Search when searching via an empty slash
" Why: Otherwise the last highlight will still be highlight, and either a
" gibberish search needs to be made, or the command :noh
