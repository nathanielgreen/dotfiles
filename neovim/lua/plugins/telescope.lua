return { 
  "nvim-telescope/telescope.nvim",  -- Floating Window fuzzy finder
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim", 
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/**", ".netlify/**" , ".next/**" },
      }
    })

    -- What - Find files using Telescope command-line sugar.
    vim.api.nvim_set_keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { silent = true })
  end
}
