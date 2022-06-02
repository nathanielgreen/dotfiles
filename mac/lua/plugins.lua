require "paq" {
  -- Package Manager
  "savq/paq-nvim";                    -- Let Paq manage itself

  -- Syntax
  "neovim/nvim-lspconfig";       
  "nvim-treesitter/nvim-treesitter";  -- Extra Detailed Syntax Highlighting

  -- Themes
  "hoob3rt/lualine.nvim";             -- Powerline
  "folke/tokyonight.nvim";            -- Theme
  "kyazdani42/nvim-web-devicons";     -- Icons for Trouble and Lualine

  -- Navigation
  "mcchrish/nnn.vim"; 	              -- Folder Navigation
  "unblevable/quick-scope";           -- First Letter Highlighting
  "nvim-lua/popup.nvim";              -- Telescope Dependency
  "nvim-lua/plenary.nvim";            -- Telescope + Flutter Tools Dependency + Spectre
  "nvim-telescope/telescope.nvim";


  -- Formatting, and linting
  "folke/trouble.nvim";               -- Better Diagnostics
  "mhartington/formatter.nvim";       -- Formatting
  "windwp/nvim-spectre";              -- Project-wide Search and replace

  -- Other
  "tpope/vim-sensible";               -- Good defaults
  "tpope/vim-commentary";             -- Comment Shortcuts
  "tpope/vim-abolish";                -- For search and replace 
  "Yggdroot/indentLine";              -- For showing the ¦ for indents

  -- Code Completion
  "hrsh7th/cmp-nvim-lsp";
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-path";
  "hrsh7th/cmp-cmdline";
  "hrsh7th/nvim-cmp";
  "hrsh7th/cmp-vsnip";
  "hrsh7th/vim-vsnip";
}

-- Set Leader Key
vim.g.mapleader = " "



-- PLUGIN START: nnn
vim.api.nvim_set_keymap("n", "-", ":NnnPicker %:p:h<CR>", { silent = true })
-- PLUGIN END: nnn
 


-- PLUGIN START: lualine
require('lualine').setup({
  options = {
    theme = 'tokyonight'
  }
})
-- PLUGIN END: lualine



-- PLUGIN START: telescope
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules/**", ".git/**", ".netlify/**" , ".next/**" },
  }
}
-- What - Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { silent = true })
-- PLUGIN END: telescope



-- PLUGIN START: Trouble
require("trouble").setup {
 mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
}
vim.api.nvim_set_keymap("n", "<Leader>t", ":TroubleToggle<CR>", { silent = true });
-- PLUGIN END: Trouble



--- PLUGIN START: Format
-- What: Shortcut to format
vim.api.nvim_set_keymap("n", "<leader>p", ":Format<CR>", { silent = true })
 
require('formatter').setup({
  logging = false,
  filetype = {
    json = {
      function()
       return {
         exe = "prettier",
         args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
         stdin = true
       }
      end
    },
    dart = {
      function()
       return {
         exe = "dart format",
         args = {"--summary=none", "--show=none", "--output=write", vim.api.nvim_buf_get_name(0)},
         stdin = false
       }
      end
    },
  },
})

-- Format on save
vim.cmd [[augroup FormatAutogroup]]
vim.cmd [[autocmd!]]
vim.cmd [[autocmd BufWritePost *.json,*.dart FormatWrite]]
vim.cmd [[augroup END]]
--- PLUGIN END: Format


--- PLUGIN START: Spectre
vim.api.nvim_set_keymap("n", "<leader>S", ":lua require('spectre').open()<CR>", { silent = true });
--- PLUGIN END: Spectre



--- PLUGIN START: indentLine
-- What - Set the indentLine vim-conceal cursor to empty
vim.g.indentLine_concealcursor=""
-- Why - If not set, in JSON files, the line under the cursor will not show
-- double quote characters, which makes it a pain to edit. This sets it so that
-- the line underneath the cursor will show as normal as if vim-conceal was set
-- to 0. 
-- See https://github.com/elzr/vim-json#common-problems for more info.

-- What - Set the indentLine characters default highlight group to Special key
vim.g.indentLine_defaultGroup = "SpecialKey"
-- Why - The special key highlight group is the same light grey as comments,
-- otherwise the default is a darker grey like body text
--- PLUGIN END: indentLine



--- PLUGIN Start: CMP
vim.cmd [[set completeopt=menu,menuone,noselect]]
   -- Setup nvim-cmp.
   local cmp = require'cmp'
 
   cmp.setup({
     preselect = cmp.PreselectMode.None,
 
     snippet = {
       -- REQUIRED - you must specify a snippet engine
       expand = function(args)
         vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
       end,
     },
     mapping = {
       ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
       ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
       ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
       ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
       ['<C-e>'] = cmp.mapping({
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
       }),
       ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
     },
     sources = cmp.config.sources({
       { name = 'nvim_lsp' },
       { name = 'vsnip' }, -- For vsnip users.
     }, {
       { name = 'buffer' },
     })
   })
 
   -- Set configuration for specific filetype.
   cmp.setup.filetype('gitcommit', {
     sources = cmp.config.sources({
       { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
     }, {
       { name = 'buffer' },
     })
   })
 
   -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
   cmp.setup.cmdline('/', {
     sources = {
       { name = 'buffer' }
     }
   })
 
   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
   cmp.setup.cmdline(':', {
     sources = cmp.config.sources({
       { name = 'path' }
     }, {
       { name = 'cmdline' }
     })
   })
 
   -- Setup lspconfig.
   local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
   -- Mappings.
 -- See `:help vim.diagnostic.*` for documentation on any of the below functions
 local opts = { noremap=true, silent=true }
 vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
 vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
 vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
 vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
 
 -- Use an on_attach function to only map the following keys
 -- after the language server attaches to the current buffer
 local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
 
   -- Mappings.
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
 end
 
 -- Use a loop to conveniently call 'setup' on multiple servers and
 -- map buffer local keybindings when the language server attaches
 local servers = { 'dartls' }
 for _, lsp in pairs(servers) do
   require('lspconfig')[lsp].setup {
     on_attach = on_attach,
     flags = {
       -- This will be the default in neovim 0.7+
       debounce_text_changes = 500,
     }
   }
   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
   --- require('lspconfig')['dartls'].setup { <-- Configured by Flutter Tools
   ---  capabilities = capabilities
   ---}
 end
 --- PLUGIN END: CMP

