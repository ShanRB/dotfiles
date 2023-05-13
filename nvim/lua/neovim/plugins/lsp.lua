return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("neovim.configs.mason")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy=false,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require "neovim.configs.mason-lspconfig"
        end,
      },
    },
    config = require "neovim.configs.lspconfig",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        -- opts = {
        --   ensure_installed = nil,
        --   automatic_installation = true,
        --   automatic_setup = false,
        -- },
      },
    },
    config = function()
      require "neovim.configs.null-ls"
    end
  },
}

