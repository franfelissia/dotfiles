-- require("nvim-treesitter").setup()
require("nvim-treesitter.configs").setup({
  -- Listado de lenguajes instalados automaticamente
  ensure_installed = {
    -- C/C++
    "arduino",
    "c",
    "cpp",
    "cmake",
    -- web
    "html",
    "jinja",
    "jinja_inline",
    "javascript",
    -- configs
    "lua",
    "luadoc",
    "vim",
    "vimdoc",
    "rasi",
    "toml",
    "ssh_config",
    "xml",
    "yaml",
    "dockerfile",
    -- git
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    -- docs
    "latex",
    "markdown_inline",
    "markdown",
    -- extras
    "bash",
    "rust",
    "java",
    "python",
    "haskell",
    "json",
    "sql",
  },
  highlight = { enable = true },
  indent = { enable = true },
  textobjects = {
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
})
