return { 
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup{
    }
    vim.api.nvim_set_keymap("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { silent = true })
  end
}
