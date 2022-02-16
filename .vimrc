" Set up VimPlug package installer 
call plug#begin('~/.vim/plugged')
" Syntax Support
Plug 'neovim/nvim-lspconfig' 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Extra Detailed Syntax Highlighting
Plug 'google/vim-jsonnet'

" Themes
Plug 'hoob3rt/lualine.nvim' " Powerline
Plug 'folke/tokyonight.nvim' " Theme
Plug 'kyazdani42/nvim-web-devicons' " Icons for Trouble and Lualine

" Navigation
Plug 'mcchrish/nnn.vim' " Folder Navigation
Plug 'unblevable/quick-scope' " First Letter Highlighting
Plug 'nvim-lua/popup.nvim' " Telescope Dependency
Plug 'nvim-lua/plenary.nvim' " Telescope + Flutter Tools Dependency + Spectre
Plug 'nvim-telescope/telescope.nvim'

" Formatting, and linting
Plug 'folke/trouble.nvim' " Better Diagnostics
Plug 'mhartington/formatter.nvim' " Formatting
" Plug 'hrsh7th/nvim-cmp' " Autocompletion
Plug 'windwp/nvim-spectre' " Search and replace

" Code Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Git
Plug 'tpope/vim-fugitive' " Git Shortcuts like git blame

" Other
Plug 'mfussenegger/nvim-dap' " Debugging
Plug 'rcarriga/nvim-dap-ui' " Debugging UI
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
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
map <Leader>yp :set paste<cr>
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

" What - Set filetype for .arb files to be JSON
au BufRead,BufNewFile *.arb set filetype=json
" Why - Otherwise vim does not recognise the syntax and doesn't highlight

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
lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules/**", ".git/**", ".netlify/**" , ".next/**" },
  }
}
EOF
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
  mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
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



" --- PLUGIN START: Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
" --- PLUGIN END: Treesitter



" --- PLUGIN START: Format

" What - Shortcut to format
nnoremap <silent> <leader>p :Format<CR>

" Format on save
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.json,*.tsx,*.ts,*.jsx,*.js,*.dart FormatWrite
augroup END

lua << EOF
require('formatter').setup({
  logging = false,
  filetype = {
    html = {
     function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    json = {
     function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    typescriptreact = {
     function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    typescript = {
     function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    jsonnet = {
     function()
        return {
          exe = "jsonnetfmt -i",
          args = {vim.api.nvim_buf_get_name(0)},
          stdin = false
        }
      end
    },
    dart = {
     function()
        return {
          exe = "dart format",
          args = {"--summary=none", "--show=none", "--output=write", vim.api.nvim_buf_get_name(0)},
          stdin = false
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
    svelte = {
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



" --- PLUGIN Start: Compe
set completeopt=menu,menuone,noselect
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['dartls'].setup {
    capabilities = capabilities
  }
EOF
" --- PLUGIN END: Compe



" --- PLUGIN START: Spectre
nnoremap <leader>S :lua require('spectre').open()<CR>
" --- PLUGIN END: Spectre
"
" --- PLUGIN START: Dap
nnoremap <leader>dt :lua require('dap').toggle_breakpoint()<CR>
nnoremap <leader>dc :lua require('dap').continue()<CR>
nnoremap <leader>dso :lua require('dap').step_over()<CR>
nnoremap <leader>dsi :lua require('dap').step_into()<CR>
nnoremap <leader>dr :lua require('dap').repl.open()<CR>
lua << EOF
local dap = require('dap')
dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = {"/home/ngreen/Work/dartdebug/out/dist/debug.js", "flutter"}
}
dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = "/usr/local/bin/flutter/bin/cache/dart-sdk/",
    flutterSdkPath = "/usr/local/bin/flutter/",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
  }
}
EOF
" --- PLUGIN END: Dap


"        _             _                            _
"  _ __ | |_   _  __ _(_)_ __  ___    ___ _ __   __| |
" | '_ \| | | | |/ _` | | '_ \/ __|  / _ \ '_ \ / _` |
" | |_) | | |_| | (_| | | | | \__ \ |  __/ | | | (_| |
" | .__/|_|\__,_|\__, |_|_| |_|___/  \___|_| |_|\__,_|
" |_|            |___/



