return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp", "prettier", "prettierd",
        "rustywind", "typescript-language-server", "tailwindcss-language-server",
        "intelephense", "eslint_d", "eslint-lsp", "css-lsp"
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag" },
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript",
        "typescript", "tsx", "php"
      },
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        autotag = {
          enable = true,
        },
        indent = {
          enable = true,
        }
      }
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
    opts = {

    },
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        autotag = {
          enable = true,
        }
      }
    end
  },
}
