require "paq" {
  -- Package Manager
  "savq/paq-nvim";                    -- Let Paq manage itself

  -- Syntax
  "neovim/nvim-lspconfig";       
  "nvim-treesitter/nvim-treesitter";  -- Extra Detailed Syntax Highlighting
  "dart-lang/dart-vim-plugin";        -- Dart Support

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
  -- "akinsho/bufferline.nvim";          -- Bufferline


  -- Formatting, and linting
  "folke/trouble.nvim";               -- Better Diagnostics
  "mhartington/formatter.nvim";       -- Formatting
  "windwp/nvim-spectre";              -- Project-wide Search and replace

  -- Other
  "tpope/vim-sensible";               -- Good defaults
  "tpope/vim-commentary";             -- Comment Shortcuts
  "tpope/vim-abolish";                -- For search and replace 
  "Yggdroot/indentLine";              -- For showing the ¦ for indents
  "akinsho/flutter-tools.nvim";       -- Flutter Tools in Telescope

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
    json = {
      function()
       return {
         exe = "prettier",
         args = {"--stdin-filepath"},
         stdin = true
       }
      end
    },
    dart = {
      function()
       return {
         exe = "dart format",
         args = {"--summary=none", "--show=none", "--output=write"},
         stdin = false
       }
      end
    },
  },
})

-- Format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.dart FormatWrite
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



--- PLUGIN START: Flutter tools
-- require("flutter-tools").setup{
--  dev_log = {
--    open_cmd = "tabedit", -- command to use to open the log buffer
--  },
-- }
-- vim.api.nvim_set_keymap("n", "<leader>fl", "<CMD>Telescope flutter commands<CR>", { silent = true });
--- PLUGIN END: Flutter tools



--- PLUGIN START: Bufferline
-- require("bufferline").setup{}
--- PLUGIN END: Bufferline



--- PLUGIN START: LSP Config
require'lspconfig'.dartls.setup{}
--- PLUGIN END: LSP Config
