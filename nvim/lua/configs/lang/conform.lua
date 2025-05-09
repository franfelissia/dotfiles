local form = {
  -- stylua: ignore start
  yaml =       { "yamlfix" },
  lua =        { "stylua" },
  arduino =    { "clang-format" },
  c =          { "clang-format" },
  cpp =        { "clang-format" },
  java =       { "clang-format" },
  cmake =      { "cmake-language-server" },
  python =     { "darker", "isort" },
  sql =        { "sqlfmt" },
  json =       { "biome" },
  jsonc =      { "biome" },
  javascript = { "biome" },
  html =       { "htmlbeautifier" },
  markdown =   { "mdformat" },
  xml =        { "xmlformatter" },
  latex =      { "latexindent" },
  rust =       { "rustfmt" },
  -- stylua: ignore end
}

require("conform").setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  formatters_by_ft = form,
  formatters = {
    injected = {
      ignore_errors = true,
      lang_to_formatters = form,
      lang_to_ext = {
        -- stylua: ignore start
        yaml =       "yaml",
        lua =        "lua",
        arduino =    "ino",
        c =          "c",
        cpp =        "cpp",
        java =       "java",
        python =     "py",
        sql =        "sql",
        json =       "json",
        javascript = "js",
        html =       "html",
        markdown =   "md",
        xml =        "xml",
        latex =      "latex",
        rust =       "rs",
        -- stylua: ignore end
      },
    },
    ["stylua"] = {
      pretend_args = {
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
      },
    },
    ["biome"] = {
      args = {
        "check",
        "--write",
        "--indent-style=space",
        "--indent-width=4",
        "--stdin-file-path",
        "$FILENAME",
      },
    },
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
