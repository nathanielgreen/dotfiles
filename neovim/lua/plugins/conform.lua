return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        json = { 'jq' },
        dart = { 'dart_format' },
        python = { 'ruff' },
      },
      format_on_save = function(bufnr)
        -- -- Disable autoformat on certain filetypes
        -- local ignore_filetypes = { "python" }
        -- if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        --   return
        -- end
        -- ...additional logic...
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
    })
  end,
}
