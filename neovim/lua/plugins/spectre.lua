-- Project-wide Search and replace
return {
  "windwp/nvim-spectre",
  config = function() 
    vim.api.nvim_set_keymap("n", "<leader>S", ":lua require('spectre').open()<CR>", { silent = true });
    require("spectre").setup({
      replace_engine = {
        ["sed"] = {
          cmd = "sed",
          args = {
            "-i",
            "",
            "-E",
          },
        },
      },
    })
  end
}
