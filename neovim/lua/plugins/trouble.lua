-- Better Diagnostics
return {
  "folke/trouble.nvim", 
  config = function()
    mode = "document_diagnostics" -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    vim.api.nvim_set_keymap("n", "<Leader>t", ":TroubleToggle<CR>", { silent = true });
  end
}
