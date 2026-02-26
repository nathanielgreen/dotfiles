return {
  "neovim/nvim-lspconfig",       
  config = function()
    vim.lsp.enable('eslint')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('jdtls')
    vim.lsp.enable('pyright')
  end
}
