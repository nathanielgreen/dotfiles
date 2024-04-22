return {
  "echasnovski/mini.nvim",            -- Collection of small plugins
  version = '*',
  config = function()
    require('mini.basics').setup()
    require('mini.comment').setup()
    require('mini.indentscope').setup()
    require('mini.jump').setup()
    require('mini.statusline').setup()
  end
}
