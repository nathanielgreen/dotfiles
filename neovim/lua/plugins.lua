require "paq" {
  -- Package Manager
  "savq/paq-nvim";                    -- Let Paq manage itself

  -- Syntax
  "neovim/nvim-lspconfig";       
  "nvim-treesitter/nvim-treesitter";  -- Extra Detailed Syntax Highlighting
  "dart-lang/dart-vim-plugin";         -- Dart Support as TS crashes randomly

  -- Themes
  "hoob3rt/lualine.nvim";             -- Powerline
  "folke/tokyonight.nvim";            -- Theme
  "kyazdani42/nvim-web-devicons";     -- Icons for Trouble and Lualine

  -- Navigation
  "mcchrish/nnn.vim"; 	              -- Folder Navigation
  "unblevable/quick-scope";           -- First Letter Highlighting
  "nvim-lua/popup.nvim";              -- Telescope Dependency
  "nvim-lua/plenary.nvim";            -- Telescope + Flutter Tools Dependency + Spectre
  "nvim-telescope/telescope.nvim";


  -- Formatting, and linting
  "folke/trouble.nvim";               -- Better Diagnostics
  "mhartington/formatter.nvim";       -- Formatting
  "windwp/nvim-spectre";              -- Project-wide Search and replace
  "echasnovski/mini.nvim";            -- Completion

  -- Other
  "tpope/vim-sensible";               -- Good defaults
  "tpope/vim-commentary";             -- Comment Shortcuts
  "tpope/vim-abolish";                -- For search and replace 
  "Yggdroot/indentLine";              -- For showing the ¦ for indents
  "mfussenegger/nvim-dap";            -- Debugger
  "rcarriga/nvim-dap-ui";             -- Debugger UI

}

-- Set Leader Key
vim.g.mapleader = " "


-- PLUGIN START: nnn
vim.api.nvim_set_keymap("n", "-", ":NnnPicker %:p:h<CR>", { silent = true })
vim.api.nvim_exec([[
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit' }
]], true)
-- PLUGIN END: nnn
 


-- PLUGIN START: lualine
require('lualine').setup({
  options = {
    theme = 'tokyonight'
  }
})
-- PLUGIN END: lualine



-- PLUGIN START: telescope
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/**", ".netlify/**" , ".next/**" },
  }
}
-- What - Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { silent = true })
-- PLUGIN END: telescope



-- PLUGIN START: Trouble
require("trouble").setup {
 mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
}
vim.api.nvim_set_keymap("n", "<Leader>t", ":TroubleToggle<CR>", { silent = true });
-- PLUGIN END: Trouble



--- PLUGIN START: Format
-- What: Shortcut to format
 vim.api.nvim_set_keymap("n", "<leader>p", ":Format<CR>", { silent = true })
 
require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    javascript = {
      require("formatter.filetypes.javascriptreact").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    dart = {
      require("formatter.filetypes.dart").dartformat,
    },
  },
})

-- Format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]], true)
--- PLUGIN END: Format


--- PLUGIN START: Spectre
vim.api.nvim_set_keymap("n", "<leader>S", ":lua require('spectre').open()<CR>", { silent = true });
-- --- PLUGIN END: Spectre



--- PLUGIN START: indentLine
-- What - Set the indentLine vim-conceal cursor to empty
vim.g.indentLine_concealcursor=""
-- Why - If not set, in JSON files, the line under the cursor will not show
-- double quote characters, which makes it a pain to edit. This sets it so that
-- the line underneath the cursor will show as normal as if vim-conceal was set
-- to 0. 
-- See https://github.com/elzr/vim-json#common-problems for more info.

-- What - Set the indentLine characters default highlight group to Special key
vim.g.indentLine_defaultGroup = "SpecialKey"
-- Why - The special key highlight group is the same light grey as comments,
-- otherwise the default is a darker grey like body text
--- PLUGIN END: indentLine



--- PLUGIN START: Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
   enable = true,              -- false will disable the whole extension
  },
}
--- PLUGIN END: Treesitter



--- PLUGIN START: LSP Config
require'lspconfig'.dartls.setup{}
require'lspconfig'.eslint.setup{}
--- PLUGIN END: LSP Config



--- PLUGIN START: Mini Completion 
require('mini.completion').setup()
--- PLUGIN END: Mini Completion



--- PLUGIN START: dap + dapui
require("dapui").setup()
--- PLUGIN END: dap + dapui
