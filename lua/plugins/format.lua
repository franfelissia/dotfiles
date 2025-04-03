return {
  -- Conform (Gestor de Formatters)
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        -- Conform asocia los formatters a los tipos de archivo
        -- va a usarlos a todos en el orden especificado
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "darker" },
          yaml = { "yamlfix" },
          sql = { "sqlfmt" },
          markdown = { "mdformat" },
          json = { "biome" },
          cpp = { "clang-format" },
          c = { "clang-format" },
          html = { "superhtml" },
        },
        -- Con esto formatea cuando guardas el archivo
        format_on_save = false,

        -- Acá le damos opciones especificas de cada formatter
        formatters = {

          -- Acá le estamos diciendo que para clang-format user el archivo de confuración de ~/.config/clang-format
          ["clang-format"] = {
            command = "clang-format",
            args = {
              "--style=file:" .. vim.fn.expand("~/.config/nvim/clang-format")
            },
            stdin = true, -- Importante para que funcione con conform.nvim
          },
          ["stylua"] = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" }, -- Ajusta el ancho de indentación si es necesario
          },
        },
      })
    end
  }
