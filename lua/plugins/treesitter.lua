return{
  "nvim-treesitter/nvim-treesitter",
  dependencies = {"nvim-treesitter/nvim-treesitter-textobjects",},
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    -- Listado de lenguajes instalados automaticamente
    ensure_installed = {
      "lua",
      "luadoc",
      "arduino",
      "bash",
      "c",
      "cpp",
      "java",
      "json",
      --"latex",
      "python",
      "sql",
      "vim",
      "vimdoc",
    },
    highlight = {enable = true},
    indent = {enable = true},
    textobjects={
      select = {
        enable = true,
        lookahead = true,
        -- Textobjects para el modo visual y normal
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        },
      },
    },
  },
}
