return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        json = { 'jq' },
        dart = { 'dart_format' },
      },
      format_on_save = {
        lsp_fallback = true,
      },
    })
  end,
}
