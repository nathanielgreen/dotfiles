vim.wo.number            = true  -- Show numbers
vim.wo.relativenumber    = true  -- Show relative numbers
vim.o.showtabline        = 2 	   -- Always Show Tabline

vim.o.expandtab          = true  -- Convert tabs to spaces.
vim.o.tabstop            = 2
vim.o.softtabstop        = 2
vim.o.shiftwidth         = 2
vim.o.termguicolors      = true  -- Use true colors, required for some plugins
                        

-- What: Open new split panes to right and bottom, which feels more natural
vim.o.splitbelow         = true
vim.o.splitright         = true
-- Why: Otherwise they open by default to left and the top which is mental
