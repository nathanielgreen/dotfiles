-- Better Diagnostics
return {
  "folke/trouble.nvim", 
  config = function()
    require("trouble").setup({
      mode = "document_diagnostics" -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    });
    vim.api.nvim_set_keymap("n", "<Leader>t", ":Trouble diagnostics toggle filter.buf=0<CR>", { silent = true });
  end
}
