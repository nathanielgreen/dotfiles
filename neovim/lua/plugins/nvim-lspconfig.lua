return {
  "neovim/nvim-lspconfig",       
  config = function()
    require'lspconfig'.eslint.setup{}
    require'lspconfig'.ts_ls.setup{}
  end
}
