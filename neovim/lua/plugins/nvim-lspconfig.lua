return {
  "neovim/nvim-lspconfig",       
  config = function()
    require'lspconfig'.eslint.setup{}
    require'lspconfig'.tsserver.setup{}
  end
}
