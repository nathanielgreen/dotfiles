" Set up VimPlug package installer 
call plug#begin('~/.vim/plugged')
" Syntax Support
Plug 'neovim/nvim-lspconfig' 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Extra Detailed Syntax Highlighting

" Themes
Plug 'hoob3rt/lualine.nvim' " Powerline
Plug 'folke/tokyonight.nvim' " Theme
Plug 'kyazdani42/nvim-web-devicons' " Icons for Trouble and Lualine

" Navigation
Plug 'akinsho/nvim-bufferline.lua' " Tabbed buffer line
Plug 'mcchrish/nnn.vim' " Folder Navigation
Plug 'unblevable/quick-scope' " First Letter Highlighting
Plug 'nvim-lua/popup.nvim' " Telescope Dependency
Plug 'nvim-lua/plenary.nvim' " Telescope + Flutter Tools Dependency
Plug 'nvim-telescope/telescope.nvim'

" Code Completion, formatting, and linting
Plug 'folke/trouble.nvim' " Better Diagnostics
Plug 'mhartington/formatter.nvim' " Formatting

" Git
Plug 'tpope/vim-fugitive' " Git Shortcuts like git blame

" Other
Plug 'tpope/vim-sensible' " Good defaults
Plug 'tpope/vim-commentary' " Comment Shortcuts
Plug 'tpope/vim-abolish' " For search and replace 
Plug 'Yggdroot/indentLine' " For showing the ¦ for indents
Plug 'akinsho/flutter-tools.nvim' " Flutter Tools in Telescope
call plug#end()

"      _                _             _
"  ___| |__   ___  _ __| |_ ___ _   _| |_ ___
" / __| '_ \ / _ \| '__| __/ __| | | | __/ __|
" \__ \ | | | (_) | |  | || (__| |_| | |_\__ \
" |___/_| |_|\___/|_|   \__\___|\__,_|\__|___/
"
" What - Map Leader Key to space
let mapleader = " "

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

" What - Turns off virtual text for LSP Diagnostics
lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
    }
)
EOF
" Why - Otherwise virtual text is enabled, but doesn't wrap so is useless
"
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


" What - Set the tokyonight 
colorscheme tokyonight

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
" --- PLUGIN START: nnn
" What - Shortcuts to open the selected file in splits
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

let g:nnn#command = 'nnn -c'

" What - Open nnn in a floating window instead of the default pane
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" What - Open nnn with key `-` in the current working directory
nnoremap - :NnnPicker %:p:h<CR>
" --- PLUGIN END: nnn



" --- PLUGIN START: telescope
" What - Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>gs :lua require'telescope.builtin'.git_status{}<cr>
" --- PLUGIN END: telescope



" --- PLUGIN START: indentLine
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
" --- PLUGIN END: indentLine



" --- PLUGIN START: Flutter tools
nnoremap <leader>fl <cmd>Telescope flutter commands<cr>
lua << EOF
require("flutter-tools").setup{
  dev_log = {
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
}
EOF
" --- PLUGIN END: Flutter tools



" --- PLUGIN START: Trouble
map <Leader>t :TroubleToggle<cr>
lua << EOF
require("trouble").setup {
  mode = "lsp_document_diagnostics",
}
EOF
" --- PLUGIN END: Trouble



" --- PLUGIN START: Lualine
lua << EOF
require('lualine').setup({
  options = {
    theme = 'tokyonight'
  }
})
require'lspconfig'.tsserver.setup{}
EOF
" --- PLUGIN END: Lualine



" --- PLUGIN START: LspConfig
lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.dartls.setup{}
EOF
" --- PLUGIN END: LspConfig



" --- PLUGIN START: Bufferline
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF
" --- PLUGIN END: Bufferline



" --- PLUGIN START: Format

" What - Shortcut to format
nnoremap <silent> <leader>p :Format<CR>

" Format on save
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.tsx,*.ts,*.jsx,*.js FormatWrite
augroup END

lua << EOF
require('formatter').setup({
  logging = false,
  filetype = {
    typescriptreact = {
     function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    javascript = {
     function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
  },
})
EOF
" --- PLUGIN END: Format

"        _             _                            _
"  _ __ | |_   _  __ _(_)_ __  ___    ___ _ __   __| |
" | '_ \| | | | |/ _` | | '_ \/ __|  / _ \ '_ \ / _` |
" | |_) | | |_| | (_| | | | | \__ \ |  __/ | | | (_| |
" | .__/|_|\__,_|\__, |_|_| |_|___/  \___|_| |_|\__,_|
" |_|            |___/



