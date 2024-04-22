-- Formatting
return {
  "mhartington/formatter.nvim",
  config = function()
    require('formatter').setup({
      logging = false,
      filetype = {
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        javascript = {
          require("formatter.filetypes.javascriptreact").prettier,
        },
        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettier,
        },
        json = {
          require("formatter.filetypes.json").prettier,
        },
        dart = {
          require("formatter.filetypes.dart").dartformat,
        },
      },
    })
    vim.api.nvim_set_keymap("n", "<leader>p", ":Format<CR>", { silent = true })
    vim.api.nvim_exec([[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost * FormatWrite
    augroup END
    ]], true)
  end
}
