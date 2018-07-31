" Vundle Start
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jparise/vim-graphql'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/vimproc'
Plugin 'chrisbra/Colorizer'
Plugin 'gisphm/vim-gitignore'
Plugin 'tpope/vim-vinegar'
Plugin 'junegunn/fzf'
Plugin 'chriskempson/base16-vim'
Plugin 'posva/vim-vue'
Plugin 'leafgarland/typescript-vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'tomlion/vim-solidity'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on
" Vundle End

" Leader
let mapleader = ","

syntax enable
set background=dark

colorscheme base16-flat


" Explorer Tree Style
let g:netrw_liststyle=0

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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  "autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

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

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

" vim-markdown remap
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" vimgrep file ignores
set wildignore+=*/node_modules/**,*/.git/**,*/bower_components/**

" Newline without insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Setting no esckeys to stop CTRL+O delay
:set noesckeys

" Line numbers in netrw
let g:netrw_bufsettings = 'noma nomod rnu nobl nowrap ro'
