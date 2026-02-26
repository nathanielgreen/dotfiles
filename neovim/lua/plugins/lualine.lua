return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
          sections = {
            lualine_a = {
              'mode',
              separator = { left = '', right = '' },
            },
          },
          tabline = {
            lualine_a = {
              {
                'buffers',
                mode = 4,
              },
            },
          }
        }
    end
}
