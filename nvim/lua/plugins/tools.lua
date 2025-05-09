return {
  -- Platformio
  {
    "anurag3301/nvim-platformio.lua",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },

  -- Markdown preview
  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- For blink.cmp's completionsource
    dependencies = {
      "saghen/blink.cmp",
    },
  },

  --Autopair
  {
    "echasnovski/mini.pairs",
    version = "*",
  },
}
