return {
  -- Mason (Gestor de paquetes para servidores LSP, DAP, Linters, Formatters y Compilers)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },


  -- Mason tool installer (Herramienta para instalar automaticamente paquetes de Mason)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    after = "mason.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "bash-language-server",    -- Bash                         (LSP)
          "rust-analyzer",           -- Rust                         (LSP)
          "taplo",                   -- TOML                         (LSP)
          "lemminx",                 -- XML                          (LSP)
          "yaml-language-server",    -- YAML                         (LSP)
          "yamlfix",                 -- YAML                         (Formatter)
          "lua-language-server",     -- Lua                          (LSP)
          "stylua",                  -- Lua                          (Formatter)
          "vim-language-server",     -- Vim Script                   (LSP)
          "arduino-language-server", -- Arduino                      (LSP)
          "clangd",                  -- C y C++                      (LSP)
          "clang-format",            -- C, C++, C#, Java, JSON y JS  (Formatter)
          "cmakelang",               -- Archivos MakeFile            (LSP)
          "cmake-language-server",   -- Archivos MakeFile            (Linter y Formatter)
          "pyright",                 -- Python                       (LSP)
          "darker",                  -- Python                       (Formatter)
          "isort",                   -- Python                       (Formatter para ordenar alfabeticamente los imports)
          "haskell-language-server", -- Haskell                      (LSP)
          "basics-language-server",  -- Completado para rutas, snippets y buffers (LSP)
          "sqlls",                   -- SQL                          (LSP)
          "sqlfmt",                  -- SQL                          (Formatter)
          "biome",                   -- JSON, JS y TS                (LSP, Linter y Formatter)
          "superhtml",               -- HTML y SuperHTML             (LSP y Formatter)
          "jinja-lsp",               -- Motor HTML de Flask          (LSP, Linter y Compiler)
          "markdown-oxide",          -- Markdown                     (LSP)
          "mdformat",                -- Markdown                     (Formatter)
        },
        run_on_start = true,
        auto_update = true,
        integrations = { ["mason-lspconfig"] = true }
      })
    end,
  }
}
