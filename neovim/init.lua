-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.wo.relativenumber    = true  -- Show relative numbers
vim.o.showtabline        = 2     -- Always Show Tabline
vim.o.expandtab          = true  -- Convert tabs to spaces.
vim.o.tabstop            = 2
vim.o.softtabstop        = 2
vim.o.shiftwidth         = 2
vim.o.termguicolors      = true  -- Use true colors, required for some plugins
vim.o.colorcolumn        = "80"
vim.o.swapfile           = false -- http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287

--- Yank to System Clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>:bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>:bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>:bd<CR>", { noremap = true, silent = true })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    "unblevable/quick-scope", -- First Letter Highlighting
    "tpope/vim-abolish",      -- For search and replace 
    "godlygeek/tabular",      -- For aligning text
    "terrastruct/d2-vim",     -- For D2 syntax
    {
      "karb94/neoscroll.nvim",
      opts = {}, 
    },
    {
      "sphamba/smear-cursor.nvim",
      opts = {},
    },
    { 
      "nvim-telescope/telescope.nvim",  -- Floating Window fuzzy finder
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim", 
      },
      config = function()
        require('telescope').setup({
          defaults = {
            file_ignore_patterns = { "node_modules", ".git/**", ".netlify/**" , ".next/**" },
          }
        }) -- Added missing closing parenthesis here

        -- What - Find files using Telescope command-line sugar.
        vim.api.nvim_set_keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { silent = true })
      end
    },
    {
      "echasnovski/mini.nvim",            -- Collection of small plugins
      version = '*',
      config = function()
        require('mini.basics').setup()
        require('mini.comment').setup()
        require('mini.indentscope').setup()
        require('mini.jump').setup()
        require('mini.statusline').setup()
      end
    },
    {
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
    },
    {
      "catppuccin/nvim",
      name = "catppuccin", 
      priority = 1000,
      config = function()
        require("catppuccin").setup({
          flavour = "frappe", -- latte, frappe, macchiato, mocha
        })
        vim.cmd.colorscheme "catppuccin"
        vim.o.background = "dark"
      end
    },
    {
      "mikavilpas/yazi.nvim",
      version = "*", -- use the latest stable version
      event = "VeryLazy",
      dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
      },
      keys = {
        -- 👇 in this section, choose your own keymappings!
        {
          "-",
          mode = { "n", "v" },
          "<cmd>Yazi<cr>",
          desc = "Open yazi at the current file",
        },
      },
      opts = {
        open_for_directories = false,
        keymaps = {
          show_help = "<c-h>",
        },
      },
      init = function()
        vim.g.loaded_netrwPlugin = 1
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require'nvim-treesitter.configs'.setup {
          highlight = {
            enable = true,          -- false will disable the whole extension
          },
        }
      end
    },
    {
      'saghen/blink.cmp',
      dependencies = { 'rafamadriz/friendly-snippets' },

      version = '1.*',
      opts = {
        keymap = { 
          preset = 'default',
        },
        appearance = {
          nerd_font_variant = 'mono'
        },
        completion = { documentation = { auto_show = false } },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    },
    {
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
    },
    {
      "github/copilot.vim",
      config = function()
        vim.g.copilot_node_command = "/Users/nathanielgreen/.asdf/shims/node"
      end
    },
    { 
      "akinsho/flutter-tools.nvim",    
      lazy = false,
      dependencies = {
        "stevearc/dressing.nvim",
        'nvim-lua/plenary.nvim',
      },
      config = true,
    },
    { 
      "lewis6991/gitsigns.nvim",
      config = function()
        require('gitsigns').setup{
        }
        vim.api.nvim_set_keymap("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { silent = true })
      end
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
      "mfussenegger/nvim-lint",
      config = function()
        local lint = require("lint")

        -- lint.linters_by_ft = {
        --   python = { "ruff" },
        -- }
        --
        -- vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        --   pattern = "*",
        --   callback = function()
        --     lint.try_lint()
        --   end,
        -- })
      end,
    },
    {
      "neovim/nvim-lspconfig",       
      config = function()
        vim.lsp.enable('eslint')
        vim.lsp.enable('ts_ls')
        vim.lsp.enable('jdtls')
        vim.lsp.enable('pyright')
      end
    },
    {
      "folke/sidekick.nvim",
      opts = {
        cli = {
          mux = {
            backend = "tmux",
            enabled = true,
          },
        },
      },
      nes = {
        enabled = false,
      },
      keys = {
        {
          "<c-.>",
          function() require("sidekick.cli").toggle() end,
          desc = "Sidekick Toggle",
          mode = { "n", "t", "i", "x" },
        },
        {
          "<leader>aa",
          function() require("sidekick.cli").toggle() end,
          desc = "Sidekick Toggle CLI",
        },
        {
          "<leader>as",
          function() require("sidekick.cli").select() end,
          desc = "Select CLI",
        },
        {
          "<leader>ad",
          function() require("sidekick.cli").close() end,
          desc = "Detach a CLI Session",
        },
        {
          "<leader>at",
          function() require("sidekick.cli").send({ msg = "{this}" }) end,
          mode = { "x", "n" },
          desc = "Send This",
        },
        {
          "<leader>af",
          function() require("sidekick.cli").send({ msg = "{file}" }) end,
          desc = "Send File",
        },
        {
          "<leader>av",
          function() require("sidekick.cli").send({ msg = "{selection}" }) end,
          mode = { "x" },
          desc = "Send Visual Selection",
        },
        {
          "<leader>ap",
          function() require("sidekick.cli").prompt() end,
          mode = { "n", "x" },
          desc = "Sidekick Select Prompt",
        },
        -- Example of a keybinding to open Claude directly
        {
          "<leader>ac",
          function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
          desc = "Sidekick Toggle Claude",
        },
      },
    },
    {
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
    },
    {
      "folke/trouble.nvim", 
      config = function()
        require("trouble").setup({
          mode = "document_diagnostics" -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
        });
        vim.api.nvim_set_keymap("n", "<Leader>t", ":Trouble diagnostics toggle filter.buf=0<CR>", { silent = true });
      end
    },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},
    },
    {
      "benomahony/uv.nvim",
      opts = {
        picker_integration = true,
      },
    },
    {
      "christoomey/vim-tmux-navigator",
      lazy = false,
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
      },
      keys = {
        { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
    }
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
