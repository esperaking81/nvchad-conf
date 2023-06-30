local overrides = require "custom.configs.overrides"
local lspconfig = require "plugins.configs.lspconfig"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      -- require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  { "christoomey/vim-tmux-navigator" },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  {
    "m4xshen/hardtime.nvim",
    opts = {},
  },
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      local on_attach = lspconfig.on_attach
      local capabilities = lspconfig.capabilities

      require("flutter-tools").setup {
        ui = {
          notification_style = "plugin",
          border = "rounded",
        },
        dev_log = {
          open_cmd = "tabedit",
        },
        decorations = {
          statusline = {
            app_version = false,
            device = false,
          },
        },
        lsp = {
          on_attach = on_attach,
          capabilities = capabilities,
          color = {
            enabled = false,
            background = false,
            background_color = nil,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "always",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
      }

      require("telescope").load_extension "flutter"
    end,
  },
  { "mbbill/undotree" },
  {
    "nvim-neotest/neotest",
    lazy = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
      { "antoinemadec/FixCursorHold.nvim" },
      { "sidlatau/neotest-dart" },
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-dart",
        },
      }
    end,
    keys = {
      {
        "<leader>tf",
        function()
          -- code
          require("neotest").run.run(vim.fn.expand "%")
        end,
        "Run the current file",
      },
    },
  },
  { "tpope/vim-fugitive", lazy = false },
  { "tpope/vim-surround", lazy = false },
  {
    "Pocco81/true-zen.nvim",
    lazy = false,
    keys = {
      { "<leader>za", ":TZAtaraxis<CR>", "Toggle Ataraxis mode" },
      { "<leader>zm", ":TZMinimalist<CR>", "Toggle minimalist mode" },
      { "<leader>zf", ":TZFocus<CR>", "Toggle minimalist mode" },
      { "<leader>zn", ":TZNarrow<CR>", "Toggle minimalist mode" },
    },
    config = function()
      require("true-zen.minimalist").toggle()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
