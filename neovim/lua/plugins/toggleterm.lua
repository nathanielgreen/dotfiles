-- Terminal in a floating window
return {
  'akinsho/toggleterm.nvim', 
  version = "*", 
  config = function()
    vim.api.nvim_set_keymap("n", "<Leader>ct", ":ToggleTerm<CR>", { silent = true });
  end
}
