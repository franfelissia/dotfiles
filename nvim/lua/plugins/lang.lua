return {
  -- Syntax
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Format
  { "stevearc/conform.nvim" },

  -- Snippets
  {
    "echasnovski/mini.snippets",
    version = false,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- Completion
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "MahanRahmati/blink-nerdfont.nvim",
    },
  },

  -- LSP
  {
    "NeoVim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "folke/lazydev.nvim",
    },
  },

  -- Packages
  { "williamboman/mason.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
}
