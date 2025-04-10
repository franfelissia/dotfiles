return {
  -- Esquema de colores
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- Esto es para que no se cargue de forma asincrona, sino que vaya con el inicio de nvim.
    priority = 1000, -- Dentro de los plugins que se cargan al iniciar nvim, se le asigna un priorirdad.
    config = function()
      -- Con esto le indicamos que cargue el esquema de colores
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  -- Barra de tabs
  {
    "crispgm/nvim-tabline",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
  },
  -- Barra de información
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup()
    end,
  },
  -- Telescope (multitool)
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    },
    config = function(opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
}

