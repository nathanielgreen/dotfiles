-- File tree
return {
  "nvim-neo-tree/neo-tree.nvim",    
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>n", ":Neotree focus filesystem float<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "-", ":Neotree reveal filesystem float <CR>", { silent = true })
  end
}
