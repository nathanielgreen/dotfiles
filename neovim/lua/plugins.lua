require("lazy").setup({
  -- Syntax
  "neovim/nvim-lspconfig",       
  "nvim-treesitter/nvim-treesitter",  -- Extra Detailed Syntax Highlighting
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",


  -- Themes
  "folke/tokyonight.nvim",            -- Theme

  -- Navigation
  "unblevable/quick-scope",           -- First Letter Highlighting
  {
    "akinsho/bufferline.nvim",        -- Buffer Navigation
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons"
  },
  { 
    "nvim-telescope/telescope.nvim",  -- Floating Window fuzzy finder
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim", 
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",    -- File tree
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  -- Formatting, and linting
  "folke/trouble.nvim",               -- Better Diagnostics
  "mhartington/formatter.nvim",       -- Formatting
  "windwp/nvim-spectre",              -- Project-wide Search and replace
  "echasnovski/mini.nvim",            -- Collection of small plugins

  -- Other
  "github/copilot.vim",               -- AI Autocomplete
  "tpope/vim-abolish",                -- For search and replace 
  { 
    "akinsho/flutter-tools.nvim",     -- Flutter Extras
    lazy = false,
    dependencies = {
      "stevearc/dressing.nvim",
      'nvim-lua/plenary.nvim',
    },
    config = true,
  }
})

-- Set Leader Key
vim.g.mapleader = " "



-- PLUGIN START: telescope
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/**", ".netlify/**" , ".next/**" },
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

-- Format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]], true)
--- PLUGIN END: Format


--- PLUGIN START: Spectre
vim.api.nvim_set_keymap("n", "<leader>S", ":lua require('spectre').open()<CR>", { silent = true });
-- --- PLUGIN END: Spectre



--- PLUGIN START: Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
   enable = true,              -- false will disable the whole extension
  },
}
--- PLUGIN END: Treesitter



--- PLUGIN START: LSP Config
-- require'lspconfig'.dartls.setup{} -- Set up by Flutter tools plugin
require'lspconfig'.eslint.setup{}
require'lspconfig'.tsserver.setup{}
--- PLUGIN END: LSP Config



--- PLUGIN START: Mini  
require('mini.basics').setup()
require('mini.comment').setup()
require('mini.indentscope').setup()
require('mini.jump').setup()
require('mini.statusline').setup()
--- PLUGIN END: Mini 



--- PLUGIN START: Flutter tools
require("flutter-tools").setup {} -- use defaults
--- PLUGIN END: Flutter tools



--- PLUGIN START: NeoTree
require("neo-tree").setup {}
vim.api.nvim_set_keymap("n", "<leader>n", ":Neotree focus filesystem float<CR>", { silent = true });
vim.api.nvim_set_keymap("n", "-", ":Neotree reveal filesystem float <CR>", { silent = true })
-- vim.api.nvim_set_keymap("n", "-", ":Neotree focus filesystem float <CR>", { silent = true })
--- PLUGIN END: NeoTree



-- PLUGIN START: Bufferline
-- require("bufferline").setup{}
-- PLUGIN END: Bufferline



-- PLUGIN START: Cmp
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['dartls'].setup {
  --   capabilities = capabilities
  -- }
-- PLUGIN END: Cmp
