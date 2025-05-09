return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "OXY2DEV/helpview.nvim",
    lazy = false
  },
  { "echasnovski/mini.icons", version = "*" },
  { "echasnovski/mini.statusline", version = "*" },
  { "echasnovski/mini.starter", version = "*" },
  { "echasnovski/mini.indentscope", version = "*" },
  { "echasnovski/mini.animate", version = "*" },
  { "echasnovski/mini.notify", version = "*" },
  { "echasnovski/mini.hipatterns", version = "*" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "mrbjarksen/neo-tree-diagnostics.nvim",
    },
    lazy = false,
  },
  { "folke/which-key.nvim", event = "VeryLazy" },
}
