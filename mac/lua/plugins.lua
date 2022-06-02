require "paq" {
  -- Package Manager
  "savq/paq-nvim";                    -- Let Paq manage itself

  -- Syntax
  "neovim/nvim-lspconfig";       
  "nvim-treesitter/nvim-treesitter";  -- Extra Detailed Syntax Highlighting

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
}

-- Set Leader Key
vim.g.mapleader = " "



-- PLUGIN START: nnn
vim.api.nvim_set_keymap("n", "-", ":NnnPicker %:p:h<CR>", { silent = true })
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
    file_ignore_patterns = { "node_modules/**", ".git/**", ".netlify/**" , ".next/**" },
  }
}
-- What - Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { silent = true })
-- PLUGIN END: telescope
