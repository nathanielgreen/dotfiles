-- Extra Detailed Syntax Highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,          -- false will disable the whole extension
      },
    }
  end
}
