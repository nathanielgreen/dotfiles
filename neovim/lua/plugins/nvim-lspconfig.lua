return {
  "neovim/nvim-lspconfig",       
  config = function()
    require'lspconfig'.eslint.setup{}
    require'lspconfig'.ts_ls.setup{}
    require'lspconfig'.jdtls.setup({})
  end
}
