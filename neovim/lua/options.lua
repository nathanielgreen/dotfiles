vim.wo.relativenumber    = true  -- Show relative numbers
vim.o.showtabline        = 2 	   -- Always Show Tabline
vim.o.expandtab          = true  -- Convert tabs to spaces.
vim.o.tabstop            = 2
vim.o.softtabstop        = 2
vim.o.shiftwidth         = 2
vim.o.termguicolors      = true  -- Use true colors, required for some plugins
vim.o.colorcolumn        = "80"
vim.o.swapfile           = false -- http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287

-- Set leader
vim.g.mapleader = " "

--- Yank to System Clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
